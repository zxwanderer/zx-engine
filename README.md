# zx-engine

Игра мечты на zx-spectrum, все в 48к не влезло, поэтому только часть =)


-- errata:

- сделана динамическая расстановка предметов на карте по описанию в таблице предметов

-- errata v1.2.1-alpha:

- удалено зависание FX-эффекта удара об стену при нажатой клавише (?)
- восстановлен фикс процедуры вывода спрайта spr_index_to_addr
- в движок импортирована генерация спрайтов по png-файлу из более современной версии zx-core
- в движок импортирована генерация карты по tmx-файлу из более современной версии zx-core
- в движок импортирована макрокоманда CheckActionReaction <action_table> из более современной версии zx-core


- фикс распределения памяти таблицы предметов
