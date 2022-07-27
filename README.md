# sendChangeToTelegramFromExcel
Скрипт фиксирующий изменения в таблице MS Excel и отправляющих их в Telegram бот.

### Получить TOKEN:
* Открыть в Telegram > [**@BotFather**](https://t.me/BotFather);
* Меню команд > [**/newbot**](https://zen.yandex.ru/media/excelifehack/upravliaem-telegram-botom-iz-google-tablicy-62a5c73192615c0231850322) или **/mybots**;
* [**Создать**](https://zen.yandex.ru/media/excelifehack/upravliaem-telegram-botom-iz-google-tablicy-62a5c73192615c0231850322) или выбрать имеющегося бота;
* What do you want to do with the bot? > **API Token** (выбрать).

### Узнать CHAT_ID получателя:
* Получить **CHAT_ID** > добавиться в бота [**@getmyid_bot**](https://t.me/getmyid_bot) и нажать **Начать**.<br>
_В ответном сообщении отобразится ID, после 'Your user ID:' XXXXXX._

Далее, используйте [**Шаблон**](https://drive.google.com/file/d/12NSVsWidJVjW4108-xLvF9Qs8bvkh7Aa/view?usp=sharing) или добавьте код в ваш файл:
* Скачайте и откройте шаблон (или используйте код на [**GitHub**](https://github.com/Guf-Hub/sendChangeToTelegramFromExcel/blob/main/%D0%AD%D1%82%D0%B0%D0%9A%D0%BD%D0%B8%D0%B3%D0%B0.cls));
* Откройте ваш файл (если будите переносить код в него);
* Откройте редактор кода **ALT + F11**.

#### Если копируете код из шаблона:
  * Слева в проектах найдите книгу **Отправка в телеграм.xlsm**;
  * Активируйте лист проекта **ЭтаКнига**.
  * **CTRL+A**, **CTRL + C** (копируйте весь код).
  * Вставьте код в свой файл на лист **ЭтаКнига**;
  * Добавьте ваш **TOKEN** и **CHAT_ID** получателя(-ей);
  * **CTRL+S** сохраните файл в формате **.xlsm**.
  
#### Если копируете код из GitHub:
* **CTRL+A**, **CTRL + C** (копируйте весь код из репозитория).
* Слева в проектах найдите вашу книгу;
* Активируйте лист проекта **ЭтаКнига**, **CTRL+V** (вставьте в него код);
* Добавьте ваш **TOKEN** и **CHAT_ID** получателя(-ей);
* **CTRL+S** сохраните файл в формате **.xlsm**.
