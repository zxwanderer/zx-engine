# zx-engine

Игра мечты на zx-spectrum, все в 48к не влезло, поэтому только часть =)

sprintum evolution industries

-- errata v1.2.3

- сборка программы происходит в папочку output как в более современной версии zx-core
- после вывода сообщения об окончании игры надо нажать клавишу G для перехода в меню

-- errata v1.2.2-alpha:

- из кучки мусора можно взять только один осколок
- сделана динамическая расстановка предметов на карте по описанию в таблице предметов ITEM_ARRAY
- фикс работы макрокоманды CheckActiveItem <item_table> и связанных с ней предметов (body)
- вывод сообщения "Контейнер уже полон" при попытке что-то добавить в полный биоконтейнер
- возвращено сообщение о том, что предмет не лезет в биоконтейтер
- стулья стали более прочными и теперь не разваливаются в руках от удара
- экран компьютера больше нельзя разбить острым осколком и карточкой
- фикс распределения памяти таблицы предметов
- фикс функции замены ячейки на карте, с учетом того, что ней уже размещен предмет
- более корректная процедура одевания
- в боевом скафандре можно проходить лужи

-- errata v1.2.1-alpha:

- удалено зависание FX-эффекта удара об стену при нажатой клавише (?)
- восстановлен фикс процедуры вывода спрайта spr_index_to_addr
- в движок импортирована генерация спрайтов по png-файлу из более современной версии zx-core
- в движок импортирована генерация карты по tmx-файлу из более современной версии zx-core
- в движок импортирована макрокоманда CheckActionReaction <action_table> из более современной версии zx-core



### Благодарности ###

Выражаю благодарность AER за музыку, специально написанную для intro этой игры. Получилось очень атмосферно.

Thanks to xlat for tape-version attention and testing on real hardware.

My respect to coders: kalantaj, Wiev, Шыншыл and big russian demoscene boss AAA,
also special thanks to Alone Coder for some z80 ideas and IDE cable :)  

Thank's to Videogames Sematary for 2-hours game stream video, Shiru for operative and detailed information about 
the beeproblem sound and Modern ZX-Retro Gaming Channel for walkthrough video.

