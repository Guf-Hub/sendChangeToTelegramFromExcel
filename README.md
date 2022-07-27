# sendChangeToTelegramFromExcel
Скрипт фиксирующий изменения в таблице MS Excel и отправляющих их в Telegram бот по [API Telegram](https://core.telegram.org/bots/api).<br/>
Для работы необходимы API Token бота, user_id получателей сообщений, наличие Интернет соединения на компьютере, где размещён файл.

[![Donate](https://img.shields.io/badge/Donate-Yoomoney-green.svg)](https://yoomoney.ru/to/410019620244262)


### Получить TOKEN:
* Открыть в Telegram > [**@BotFather**](https://t.me/BotFather);
* Меню команд > [**/newbot**](https://zen.yandex.ru/media/excelifehack/upravliaem-telegram-botom-iz-google-tablicy-62a5c73192615c0231850322) или **/mybots**;
* [**Создать**](https://zen.yandex.ru/media/excelifehack/upravliaem-telegram-botom-iz-google-tablicy-62a5c73192615c0231850322) или выбрать имеющегося бота;
* What do you want to do with the bot? > **API Token** (выбрать).

### Узнать USER_ID получателя:
* Получить **USER_ID** > добавиться в бота [**@getmyid_bot**](https://t.me/getmyid_bot) и нажать **Начать**.<br>
_В ответном сообщении отобразится ID, после 'Your user ID:' XXXXXX._

Далее, используйте [**Шаблон**](https://drive.google.com/file/d/12NSVsWidJVjW4108-xLvF9Qs8bvkh7Aa/view?usp=sharing) или добавьте код в ваш файл:
* Скачайте и откройте шаблон (или используйте код на [**GitHub**](https://github.com/Guf-Hub/sendChangeToTelegramFromExcel/blob/main/%D0%AD%D1%82%D0%B0%D0%9A%D0%BD%D0%B8%D0%B3%D0%B0.cls));
* Откройте ваш файл (если будите переносить код в него);
* Откройте Pедактор VBA **ALT+F11**.

#### Если копируете код из шаблона:
  * Слева в Редакторе VBA найдите книгу **Отправка в телеграм.xlsm**;
  * Активируйте лист проекта **ЭтаКнига**;
  * **CTRL+A**, **CTRL+C** (копируйте весь код);
  * Вставьте код в свой файл на лист **ЭтаКнига**;
  * Добавьте *Function sendToTelegram* ваш **TOKEN** и **CHAT_ID** получателя(-ей);
  * Сохраните файл в формате **.xlsm**.
  
#### Если копируете код из GitHub:
* Копируйте весь код из репозитория;
* Слева в Редакторе VBA найдите вашу книгу;
* Активируйте лист проекта **ЭтаКнига**, **CTRL+V** (вставьте в него код);
* Добавьте *Function sendToTelegram* ваш **TOKEN** и **CHAT_ID** получателя(-ей);
* Сохраните файл в формате **.xlsm**.
