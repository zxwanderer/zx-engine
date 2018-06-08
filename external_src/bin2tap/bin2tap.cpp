#include <iostream>
#include <fstream>
#include <string>
#include <stdint.h>
#include "optionparser.h"
using namespace std;

uint8_t xorall(uint8_t *bytebuffer, int N) {
	uint8_t r=0;
	for (int i=0; i<N; i++)
		r^=bytebuffer[i];
	return r;
}

enum  optionIndex { UNKNOWN, HELP, BASIC, CODE, SCREEN, RAW };
const option::Descriptor usage[] = {
	{UNKNOWN, 0,	"",	"",	option::Arg::None,	"  a tool to create tape images out of binary files\n\n"
												"  usage:\n"
												"    bin2tap [-r] input.bin output.tap\n"
												"      creates a headerless tape block\n"
												"    bin2tap -b input.bin output.tap zxname [start]\n"
												"      creates a basic file that autostarts at line 'start'\n"
												"    bin2tap -c input.bin output.tap zxname start\n"
												"      creates a code file that loads at address 'start'\n"
//												"    bin2tap -s input.bin output.tap zxname\n"
//												"      creates a screen$ file\n\n"
												"  options:" },
	{HELP, 0,	"h",	"help",	option::Arg::None, "    -h, --help  \tprint usage and exit."},
	{BASIC, 0,	"b",	"basic",	option::Arg::None, "    -b, --basic  \tcreate basic *.tap file."},
	{CODE, 0,	"c",	"code",	option::Arg::None, "    -c, --code  \tcreate code *.tap file."},
//	{SCREEN, 0,	"s",	"screen",	option::Arg::None, "    -s, --screen  \tcreate screen$ *.tap file."},
	{RAW, 0,	"r",	"raw",	option::Arg::None, "    -r, --raw  \tcreate a raw block, i.e. do not generate block id and checksum."},
	{0,0,0,0,0,0}
};

int main(int argc, char *argv[]) {

	argc--; argv++; // always skip program name argv[0]
	option::Stats	stats(usage, argc, argv);
	option::Option*	options = new option::Option[stats.options_max];
	option::Option*	buffer = new option::Option[stats.buffer_max];
	option::Parser	parse(usage, argc, argv, options, buffer);
	if (parse.error()) return 1;

	if (argc>0) cout << endl;
	cout << "  bin2tap ver.0.1 by introspec (" << __DATE__ << ")" << endl << endl;
	if (argc == 0 || options[HELP]) {
		option::printUsage(std::cout, usage);
		return 0;
	}

	string argin, argout;

	//cout << "[" << parse.optionsCount() << " " << parse.nonOptionsCount() << "]" << endl;

	// the case of headerless *.tap file
	if ((parse.optionsCount()==0 || (parse.optionsCount()==1 && options[RAW])) && parse.nonOptionsCount() == 2) {
		string argin = string(parse.nonOption(0)), argout = string(parse.nonOption(1));

		std::ifstream filein(argin.c_str(), std::ifstream::binary);
		if (filein) {
			// measure input file length
			filein.seekg(0, filein.end);
			int lenin = static_cast<int>(filein.tellg());
			filein.seekg(0, filein.beg);

			//cout << lenin << endl;

			// copy the file
			if (lenin<=65535 && options[RAW]) {
				// copy data verbatim
				uint8_t bytebuffer[65535];
				std::ofstream fileout(argout.c_str(), std::ifstream::binary);
				filein.read(reinterpret_cast<char *>(bytebuffer), lenin);

				fileout.write(reinterpret_cast<char *>(&lenin), 2); // data block length
				fileout.write(reinterpret_cast<char *>(bytebuffer), lenin); // data block itself
				fileout.close();
			} else if (lenin<=65535-2 && !options[RAW]) {
				// create an appropriate data block
				uint8_t bytebuffer[65535];
				bytebuffer[0] = 0xFF;
				std::ofstream fileout(argout.c_str(), std::ifstream::binary);
				filein.read(reinterpret_cast<char *>(&bytebuffer[1]), lenin);
				bytebuffer[lenin+1] = xorall(bytebuffer, lenin+1);

				lenin+=2;
				fileout.write(reinterpret_cast<char *>(&lenin), 2); // data block length
				fileout.write(reinterpret_cast<char *>(bytebuffer), lenin); // data block itself
				fileout.close();
			} else {
				cout << "  error: the input file is too long." << endl; return 1;
			}

			filein.close();
			return 0;
		} else {
			cout << "  error: cannot open the input file." << endl; return 1;
		}
	}

	// the case of a basic *.tap file
	if ((parse.optionsCount()==1 && options[BASIC]) && parse.nonOptionsCount() >= 3 && parse.nonOptionsCount() <= 4) {
		string argin = string(parse.nonOption(0)), argout = string(parse.nonOption(1));
		string tapname = string(parse.nonOption(2));
		int line=-1;
		if (parse.nonOptionsCount()==4) {
			line=atoi(parse.nonOption(3)); // will be 0 for non-numeric inputs
		}

		std::ifstream filein(argin.c_str(), std::ifstream::binary);
		if (filein) {
			// measure input file length
			filein.seekg(0, filein.end);
			int lenin = static_cast<int>(filein.tellg());
			filein.seekg(0, filein.beg);

			if (lenin<=65535-2) {
				// set up the code header
				uint8_t bytebuffer[65535];
				bytebuffer[0]=0; // means "header"
				bytebuffer[1]=0; // means "basic"
				for (int i=0; i<10; i++) {
					if (i<tapname.size()) bytebuffer[i+2]=tapname[i];
					else bytebuffer[i+2]=' ';
				}
				bytebuffer[12]=reinterpret_cast<uint8_t *>(&lenin)[0];
				bytebuffer[13]=reinterpret_cast<uint8_t *>(&lenin)[1];
				if (line>=0) {
					bytebuffer[14]=reinterpret_cast<uint8_t *>(&line)[0];
					bytebuffer[15]=reinterpret_cast<uint8_t *>(&line)[1];
				} else {
					bytebuffer[14]=0;
					bytebuffer[15]=0x80;
				}
				bytebuffer[16]=bytebuffer[12]; // no variables are assumed here
				bytebuffer[17]=bytebuffer[13]; // may generalize in the future
				bytebuffer[18] = xorall(bytebuffer, 18);

				// save header
				std::ofstream fileout(argout.c_str(), std::ifstream::binary);
				int hdrlen=19;
				fileout.write(reinterpret_cast<char *>(&hdrlen), 2); // header length
				fileout.write(reinterpret_cast<char *>(bytebuffer), hdrlen); // header itself

				// save data
				bytebuffer[0] = 0xFF;
				filein.read(reinterpret_cast<char *>(&bytebuffer[1]), lenin);
				bytebuffer[lenin+1] = xorall(bytebuffer, lenin+1);

				lenin+=2;
				fileout.write(reinterpret_cast<char *>(&lenin), 2); // data block length
				fileout.write(reinterpret_cast<char *>(bytebuffer), lenin); // data block itself
				fileout.close();
			} else {
				cout << "  error: the input file is too long." << endl; return 1;
			}
		} else {
			cout << "  error: cannot open the input file." << endl; return 1;
		}
	}

	// the case of a code *.tap file
	if ((parse.optionsCount()==1 && options[CODE]) && parse.nonOptionsCount() == 4) {
		string argin = string(parse.nonOption(0)), argout = string(parse.nonOption(1));
		string tapname = string(parse.nonOption(2));
		int addr = atoi(parse.nonOption(3)); // will be 0 for non-numeric inputs

		std::ifstream filein(argin.c_str(), std::ifstream::binary);
		if (filein) {
			// measure input file length
			filein.seekg(0, filein.end);
			int lenin = static_cast<int>(filein.tellg());
			filein.seekg(0, filein.beg);

			if (lenin<=65535-2) {
				// set up the code header
				uint8_t bytebuffer[65535];
				bytebuffer[0]=0; // means "header"
				bytebuffer[1]=3; // means "code"
				for (int i=0; i<10; i++) {
					if (i<tapname.size()) bytebuffer[i+2]=tapname[i];
					else bytebuffer[i+2]=' ';
				}
				bytebuffer[12]=reinterpret_cast<uint8_t *>(&lenin)[0];
				bytebuffer[13]=reinterpret_cast<uint8_t *>(&lenin)[1];
				bytebuffer[14]=reinterpret_cast<uint8_t *>(&addr)[0];
				bytebuffer[15]=reinterpret_cast<uint8_t *>(&addr)[1];
				bytebuffer[16]=0;
				bytebuffer[17]=0x80;
				bytebuffer[18] = xorall(bytebuffer, 18);

				// save header
				std::ofstream fileout(argout.c_str(), std::ifstream::binary);
				int hdrlen=19;
				fileout.write(reinterpret_cast<char *>(&hdrlen), 2); // header length
				fileout.write(reinterpret_cast<char *>(bytebuffer), hdrlen); // header itself

				// save data
				bytebuffer[0] = 0xFF;
				filein.read(reinterpret_cast<char *>(&bytebuffer[1]), lenin);
				bytebuffer[lenin+1] = xorall(bytebuffer, lenin+1);

				lenin+=2;
				fileout.write(reinterpret_cast<char *>(&lenin), 2); // data block length
				fileout.write(reinterpret_cast<char *>(bytebuffer), lenin); // data block itself
				fileout.close();
			} else {
				cout << "  error: the input file is too long." << endl; return 1;
			}
		} else {
			cout << "  error: cannot open the input file." << endl; return 1;
		}
	}


	/*
	bool saneinput = false;
	string arg1;
	if (argc >= 2) {
		arg1 = string(argv[1]);
		if ((arg1 == "8x4") && (argc == 8)) saneinput = true;
	}
	if (saneinput) {
		if (arg1 == "8x4") {
			std::ifstream scr2x_upper(argv[2], std::ifstream::binary);
			std::ifstream scr2x_lower(argv[3], std::ifstream::binary);
			std::ifstream scr_border(argv[4], std::ifstream::binary);
			if (scr2x_upper && scr2x_lower && scr_border) {
				scr2x_upper.seekg(0, scr2x_upper.end);
				int len_upper = static_cast<int>(scr2x_upper.tellg());
				scr2x_lower.seekg(0, scr2x_lower.end);
				int len_lower = static_cast<int>(scr2x_lower.tellg());
				scr_border.seekg(0, scr_border.end);
				int len_border = static_cast<int>(scr_border.tellg());
				if (len_upper == 6912 && len_lower == 6912 && len_border == 14640) {
						scr2x_upper.seekg(0, scr2x_upper.beg);
						scr2x_lower.seekg(0, scr2x_lower.beg);
						scr_border.seekg(0, scr_border.beg);
						uint8_t buf_upper[6912], buf_lower[6912], buf_border[14640];
						scr2x_upper.read(reinterpret_cast<char *>(buf_upper), 6912);
						scr2x_lower.read(reinterpret_cast<char *>(buf_lower), 6912);
						scr_border.read(reinterpret_cast<char *>(buf_border), 14640);

						// first, generate a raster image from the even lines of two images
						ofstream bitmap6144(argv[5], ios::binary);
						if (bitmap6144) {
							// i tried clever, but failed. here goes moronic.
							uint8_t buf_linear[6144*2];
							for (int i=0; i<192; i++) {
								int src = line2addr(i), dest_upper = 32*i, dest_lower = 6144+32*i;
								for (int j=0; j<32; j++) {
									buf_linear[dest_upper+j]=buf_upper[src+j];
									buf_linear[dest_lower+j]=buf_lower[src+j];
								}
							}
							for (int i=0; i<192; i++) {
								int src = 2*line2addr(i);
								bitmap6144.write(reinterpret_cast<char *>(&buf_linear[src]),32);
							}
							bitmap6144.close();
						}

						// second, generate a combined set of attributes
						ofstream attr1536(argv[6], ios::binary);
						if (attr1536) {
							for (int i=0; i<24/2; i++) {
								int src = 6144+32*2*i;
								attr1536.write(reinterpret_cast<char *>(&buf_upper[src]),32);
							}
							for (int i=0; i<24/2; i++) {
								int src = 6144+32*2*i;
								attr1536.write(reinterpret_cast<char *>(&buf_lower[src]),32);
							}
							for (int i=0; i<24/2; i++) {
								int src = 6144+32*2*i+32;
								attr1536.write(reinterpret_cast<char *>(&buf_upper[src]),32);
							}
							for (int i=0; i<24/2; i++) {
								int src = 6144+32*2*i+32;
								attr1536.write(reinterpret_cast<char *>(&buf_lower[src]),32);
							}
							attr1536.close();
						}

						// third, convert the border image data
						ofstream border4224(argv[7], ios::binary);
						if (border4224) {
							// saving the results
							for (int i=0; i<64; i++) {
								int src = 48+48*i;
								uint8_t buf[24];
								for (int j=0; j<24; j++) {
									buf[j] = (buf_border[src+j*2] & 0x07) + 8*(buf_border[src+j*2+1] & 0x07);
								}
								border4224.write(reinterpret_cast<char *>(&buf[0]),24);
							}

							for (int i=0; i<192; i++) {
								int src = 48+64*48+48*i;
								uint8_t buf1[4],buf2[4];
								for (int j=0; j<4; j++) {
									buf1[j] = (buf_border[src+j*2] & 0x07) + 8*(buf_border[src+j*2+1] & 0x07);
									buf2[j] = (buf_border[src+40+j*2] & 0x07) + 8*(buf_border[src+40+j*2+1] & 0x07);
								}
								border4224.write(reinterpret_cast<char *>(&buf1[0]),4);
								border4224.write(reinterpret_cast<char *>(&buf2[0]),4);
							}

							for (int i=0; i<48; i++) {
								int src = 48+48*64+48*192+48*i;
								uint8_t buf[24];
								for (int j=0; j<24; j++) {
									buf[j] = (buf_border[src+j*2] & 0x07) + 8*(buf_border[src+j*2+1] & 0x07);
								}
								border4224.write(reinterpret_cast<char *>(&buf[0]),24);
							}
							border4224.close();
						}

				} else {
					cout << "  one of the input files seems to have incorrect length, cannot continue\n" << endl;
				}
				scr2x_upper.close(); scr2x_lower.close(); scr_border.close();
			} else {
				cout << "  one of the input files failed to open, cannot continue\n" << endl;
				return 0;
			}
		}
	} else {
		cout << "  usage: edgecon [format] [inputs]\n\n"
			<< "  where [format] can be either 8x8 or 8x4. few examples of valid command lines:\n"
			<< "  edgecon 8x8 border.raw border.4224\n"
			<< "  edgecon 8x4 upper.scr lower.scr border.raw raster.6144 attr.1536 border.4224\n" << endl;
	}
	*/

	delete[] options;
	delete[] buffer;
	return 0;
}
