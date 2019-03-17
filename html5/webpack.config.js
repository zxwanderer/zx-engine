'use strict';

const webpack = require('webpack');
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')

const outputFolder = 'dist'

const definePlugin = new webpack.DefinePlugin({
    __DEV__: JSON.stringify(JSON.parse(process.env.BUILD_DEV || 'true')),
    WEBGL_RENDERER: false, // I did this to make webpack work, but I'm not really sure it should always be true
    CANVAS_RENDERER: true // I did this to make webpack work, but I'm not really sure it should always be true
})

module.exports = {

    entry: './src/index.js',

    output: {
        path: path.resolve(__dirname, outputFolder),
        filename: 'project.bundle.js'
    },

    devServer: {
        // contentBase: './'+outputFolder,
        hot: true
    },

    module: {
        rules: [
            {
                enforce: "pre",
                test: /\.js$/,
                exclude: /node_modules/,
                loader: "eslint-loader"
            },
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: "babel-loader"
            },
            {
                test: [ /\.vert$/, /\.frag$/ ]
            }
        ]
    },

    plugins: [
        // new webpack.ProgressPlugin(), тормозит только и ненужно
        new CleanWebpackPlugin(),
        new CopyWebpackPlugin([
            { from: './assets/*', to: './'+outputFolder }
        ]),
        definePlugin,
        new HtmlWebpackPlugin({
            filename: 'index.html',
            template: 'template/index.html'
        }),
        new webpack.HotModuleReplacementPlugin()
    ]

};
