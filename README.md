📢 **Telegram Channel:** [https://t.me/NetraIR](https://t.me/NetraIR)

# NetraUploader

Telegram file uploader bot powered by Cloudflare Workers.

Runs entirely on **Cloudflare Workers + D1** — no Node.js server or VPS required, and no command-line tools needed either (set up fully through the Cloudflare web dashboard).

**Language:** [🇬🇧 English](#english) | [🇮🇷 فارسی](#فارسی) | [🇨🇳 中文](#中文) | [🇷🇺 Русский](#русский)

---

## English

📢 Telegram Channel: [@NetraIR](https://t.me/NetraIR)

### What this is

A Telegram bot that stores files (in a private Telegram channel you control) and hands out a private download link/code for each one. It supports 10 interface languages, an admin panel, optional forced-join, and optional auto-delete of sent files.

### Before you start

You'll need: a Cloudflare account (free tier is fine) and a Telegram account. Everything is done through Cloudflare's web dashboard — no Node.js or command-line tools required.

### Installation

1. **Create your Telegram bot** — in Telegram, open `@BotFather`, send `/newbot`, and follow the prompts. Save the token it gives you — that's your `BOT_TOKEN`.

2. **Get your Telegram user ID** — message `@userinfobot` on Telegram and copy your numeric ID — that's your `OWNER_ID` (only this account can access the admin panel at first).

3. **Create a D1 database (via the dashboard)** — log into the Cloudflare dashboard, go to **Workers & Pages → D1**, click "Create database", name it `filestore-bot`, and create it. Open the database's page afterward and note the `Database ID` shown there.

4. **Load the database schema** — on the database page, open the "Console" tab. Open `schema.sql` in a text editor, copy its entire contents, paste them into the console, and run it.

5. **Create the Worker** — go to Workers & Pages, click "Create", choose "Create Worker", give it a name (e.g. `telegram-filestore-bot`), and deploy it with the default code to finish creating it.

6. **Paste in the code** — open the Worker, click "Edit code" (Quick Edit), delete the default code, open `worker.js`, copy its entire contents, paste it into the editor, then click "Save and deploy".

7. **Bind the database** — on the Worker's Settings → Variables (or Bindings) tab, find "D1 Database Bindings", click "Add binding", set the variable name to `DB`, and select the `filestore-bot` database you created. Save.

8. **Add variables and secrets** — on the same Variables tab:
   - Add an environment variable `OWNER_ID` with your numeric Telegram ID as the value (plain text).
   - Add a secret variable `BOT_TOKEN` with your bot's token as the value (check the "Encrypt" option).
   - Add a secret variable `WEBHOOK_SECRET` with any random string you make up (e.g. a UUID), also encrypted.
   Save, and redeploy if prompted.

9. **Note your Worker's URL** — the Worker's overview page shows its `*.workers.dev` address.

10. **Point Telegram at your worker**:
    ```bash
    curl "https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=https://<your-worker>.workers.dev/webhook/<WEBHOOK_SECRET>"
    ```
    (Run this in any terminal, or just paste the URL into a browser's address bar — nothing needs to be installed.)

11. **Test it** — open your bot on Telegram and send `/start`. As the owner, send `/admin` to open the admin panel (set your storage channel there first — forward any message from it to the bot when prompted, with the bot added as admin of that channel).

### Support

Questions or issues? Reach out on Telegram: **[@NetraIR](https://t.me/NetraIR)**

---

## فارسی

📢 کانال تلگرام: [@NetraIR](https://t.me/NetraIR)

### این چیست

یک ربات تلگرام که فایل‌ها را در یک کانال خصوصی تلگرام (متعلق به خودتان) ذخیره می‌کند و برای هر فایل یک لینک/کد دانلود اختصاصی می‌دهد. از ۱۰ زبان رابط کاربری، پنل مدیریت، عضویت اجباری اختیاری و حذف خودکار فایل ارسالی پشتیبانی می‌کند.

### قبل از شروع

به این‌ها نیاز دارید: یک حساب Cloudflare (پلن رایگان کافی است) و یک حساب تلگرام. همهٔ مراحل از طریق پنل وب Cloudflare انجام می‌شود — نیازی به نصب Node.js یا هیچ ابزار خط فرمانی نیست.

### نصب

1. **ساخت ربات تلگرام** — در تلگرام `@BotFather` را باز کنید، دستور `/newbot` را بفرستید و مراحل را دنبال کنید. توکنی که می‌دهد را ذخیره کنید — همان `BOT_TOKEN` شماست.

2. **گرفتن آی‌دی عددی تلگرام خودتان** — به `@userinfobot` پیام بدهید و آی‌دی عددی خود را کپی کنید — همان `OWNER_ID` است (در ابتدا فقط همین حساب به پنل مدیریت دسترسی دارد).

3. **ساخت دیتابیس D1 (از طریق پنل وب)** — وارد داشبورد Cloudflare شوید، به بخش **Workers & Pages → D1** بروید، روی «Create database» کلیک کنید، نام `filestore-bot` را وارد کنید و بسازید. پس از ساخت، وارد صفحهٔ دیتابیس شوید و مقدار `Database ID` نمایش داده‌شده را یادداشت کنید.

4. **بارگذاری ساختار دیتابیس** — در همان صفحهٔ دیتابیس، تب «Console» را باز کنید. فایل `schema.sql` را با یک ویرایشگر متن باز کنید، تمام محتوای آن را کپی کنید، در کنسول جای‌گذاری کنید و اجرا (Run) کنید.

5. **ساخت Worker** — به بخش Workers & Pages بروید، روی «Create» کلیک کنید، گزینهٔ «Create Worker» را انتخاب کنید، نامی مثل `telegram-filestore-bot` بدهید و آن را با کد پیش‌فرض مستقر کنید تا ساخته شود.

6. **جای‌گذاری کد** — وارد Worker شوید، روی «Edit code» (یا Quick Edit) کلیک کنید، کد پیش‌فرض را پاک کنید، فایل `worker.js` را باز کرده و کل محتوای آن را کپی و در ویرایشگر جای‌گذاری کنید، سپس «Save and deploy» را بزنید.

7. **اتصال دیتابیس به Worker** — به تب Settings → Variables (یا Bindings) همان Worker بروید، بخش «D1 Database Bindings» را پیدا کنید، روی «Add binding» کلیک کنید، نام متغیر را `DB` بگذارید و دیتابیس `filestore-bot` را انتخاب کنید. ذخیره کنید.

8. **افزودن متغیرها و مقادیر محرمانه** — در همان تب Variables:
   - یک متغیر محیطی با نام `OWNER_ID` و مقدار آی‌دی عددی تلگرام خودتان اضافه کنید (به‌صورت متن ساده).
   - یک متغیر محرمانه با نام `BOT_TOKEN` و مقدار توکن ربات اضافه کنید (گزینهٔ Encrypt را فعال کنید).
   - یک متغیر محرمانه با نام `WEBHOOK_SECRET` و یک رشتهٔ تصادفی دلخواه (مثلاً یک UUID) اضافه کنید، آن هم به‌صورت رمزنگاری‌شده.
   در پایان تغییرات را ذخیره و در صورت درخواست، دوباره Deploy کنید.

9. **یادداشت آدرس Worker** — در صفحهٔ اصلی Worker، آدرس `*.workers.dev` آن نمایش داده می‌شود.

10. **معرفی Worker به تلگرام**:
    ```bash
    curl "https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=https://<your-worker>.workers.dev/webhook/<WEBHOOK_SECRET>"
    ```
    (این دستور را می‌توانید در هر ترمینال یا حتی مرورگر با جای‌گذاری آدرس در نوار آدرس اجرا کنید — نیازی به نصب چیزی نیست.)

11. **آزمایش** — ربات را در تلگرام باز کنید و `/start` بفرستید. به‌عنوان مالک، برای باز کردن پنل مدیریت `/admin` را بفرستید (ابتدا کانال ذخیره‌سازی را همان‌جا تنظیم کنید — با فوروارد یک پیام از آن کانال به ربات، در حالی که ربات به‌عنوان ادمین آن کانال اضافه شده باشد).

### پشتیبانی

سوال یا مشکلی دارید؟ در تلگرام پیام بدهید: **[@NetraIR](https://t.me/NetraIR)**

---

## 中文

📢 Telegram 频道: [@NetraIR](https://t.me/NetraIR)

### 这是什么

一个 Telegram 机器人,将文件保存在您自己控制的私有 Telegram 频道中,并为每个文件生成专属的下载链接/代码。支持 10 种界面语言、管理面板、可选的强制加入频道功能,以及可选的文件自动删除功能。

### 开始之前

您需要:一个 Cloudflare 账户(免费套餐即可)和一个 Telegram 账户。全部操作都通过 Cloudflare 的网页控制台完成——不需要安装 Node.js 或任何命令行工具。

### 安装步骤

1. **创建您的 Telegram 机器人** — 在 Telegram 中打开 `@BotFather`,发送 `/newbot` 并按提示操作。保存它给出的令牌——这就是您的 `BOT_TOKEN`。

2. **获取您的 Telegram 用户 ID** — 给 `@userinfobot` 发消息并复制您的数字 ID——这就是您的 `OWNER_ID`(初始时只有该账户可以访问管理面板)。

3. **创建 D1 数据库(通过网页控制台)** — 登录 Cloudflare 控制台,进入 **Workers & Pages → D1**,点击「Create database」,输入名称 `filestore-bot` 并创建。创建后打开该数据库页面,记下显示的 `Database ID`。

4. **导入数据库结构** — 在该数据库页面,打开「Console」标签页。用文本编辑器打开 `schema.sql`,复制其全部内容,粘贴到控制台中并执行。

5. **创建 Worker** — 进入 Workers & Pages,点击「Create」,选择「Create Worker」,输入名称(例如 `telegram-filestore-bot`),使用默认代码完成部署以创建它。

6. **粘贴代码** — 打开该 Worker,点击「Edit code」(或 Quick Edit),删除默认代码,打开 `worker.js` 并复制其全部内容,粘贴到编辑器中,然后点击「Save and deploy」。

7. **绑定数据库** — 进入该 Worker 的 Settings → Variables(或 Bindings)标签页,找到「D1 Database Bindings」,点击「Add binding」,变量名填写 `DB`,选择刚创建的 `filestore-bot` 数据库,保存。

8. **添加变量和密钥** — 在同一个 Variables 标签页中:
   - 添加一个环境变量 `OWNER_ID`,值为您的 Telegram 数字 ID(纯文本)。
   - 添加一个密钥变量 `BOT_TOKEN`,值为您的机器人令牌(勾选 Encrypt)。
   - 添加一个密钥变量 `WEBHOOK_SECRET`,值为任意随机字符串(例如一个 UUID),同样加密保存。
   保存更改,如有提示请重新部署。

9. **记下 Worker 地址** — 在 Worker 概览页面可以看到它的 `*.workers.dev` 地址。

10. **让 Telegram 指向您的 worker**:
    ```bash
    curl "https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=https://<your-worker>.workers.dev/webhook/<WEBHOOK_SECRET>"
    ```
    (在任意终端,或将地址粘贴到浏览器地址栏中执行即可,无需安装任何工具。)

11. **测试** — 在 Telegram 中打开您的机器人并发送 `/start`。作为所有者,发送 `/admin` 打开管理面板(先在那里设置存储频道——将该频道的一条消息转发给机器人即可,机器人需先被添加为该频道的管理员)。

### 获取支持

有问题或遇到故障?请通过 Telegram 联系:**[@NetraIR](https://t.me/NetraIR)**

---

## Русский

📢 Телеграм-канал: [@NetraIR](https://t.me/NetraIR)

### Что это такое

Telegram-бот, который сохраняет файлы в приватном Telegram-канале, принадлежащем вам, и выдаёт для каждого файла приватную ссылку/код для скачивания. Поддерживает 10 языков интерфейса, панель администратора, опциональную обязательную подписку на канал и опциональное автоудаление отправленных файлов.

### Перед началом

Понадобится: аккаунт Cloudflare (бесплатного тарифа достаточно) и аккаунт Telegram. Всё делается через веб-панель Cloudflare — устанавливать Node.js или какие-либо инструменты командной строки не нужно.

### Установка

1. **Создайте своего Telegram-бота** — в Telegram откройте `@BotFather`, отправьте `/newbot` и следуйте подсказкам. Сохраните выданный токен — это ваш `BOT_TOKEN`.

2. **Узнайте свой Telegram user ID** — напишите `@userinfobot` и скопируйте свой числовой ID — это ваш `OWNER_ID` (изначально только этот аккаунт имеет доступ к панели администратора).

3. **Создайте базу данных D1 (через веб-панель)** — войдите в панель Cloudflare, откройте **Workers & Pages → D1**, нажмите «Create database», введите имя `filestore-bot` и создайте. Затем откройте страницу базы данных и запишите показанный `Database ID`.

4. **Загрузите схему базы данных** — на странице базы данных откройте вкладку «Console». Откройте файл `schema.sql` в текстовом редакторе, скопируйте всё его содержимое, вставьте в консоль и выполните.

5. **Создайте Worker** — перейдите в Workers & Pages, нажмите «Create», выберите «Create Worker», задайте имя (например, `telegram-filestore-bot`) и разверните его с кодом по умолчанию, чтобы завершить создание.

6. **Вставьте код** — откройте Worker, нажмите «Edit code» (Quick Edit), удалите код по умолчанию, откройте `worker.js`, скопируйте всё его содержимое, вставьте в редактор и нажмите «Save and deploy».

7. **Привяжите базу данных** — на вкладке Settings → Variables (или Bindings) Worker найдите «D1 Database Bindings», нажмите «Add binding», укажите имя переменной `DB` и выберите созданную базу `filestore-bot`. Сохраните.

8. **Добавьте переменные и секреты** — на той же вкладке Variables:
   - добавьте переменную окружения `OWNER_ID` со значением вашего числового Telegram ID (обычный текст);
   - добавьте секретную переменную `BOT_TOKEN` со значением токена бота (включите Encrypt);
   - добавьте секретную переменную `WEBHOOK_SECRET` с произвольной случайной строкой (например, UUID), также зашифрованную.
   Сохраните изменения и при необходимости разверните заново.

9. **Запишите адрес Worker** — на странице обзора Worker будет показан его адрес `*.workers.dev`.

10. **Укажите Telegram адрес вашего воркера**:
    ```bash
    curl "https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=https://<your-worker>.workers.dev/webhook/<WEBHOOK_SECRET>"
    ```
    (выполните в любом терминале или просто вставьте адрес в браузер — устанавливать ничего не нужно.)

11. **Проверьте работу** — откройте бота в Telegram и отправьте `/start`. Как владелец, отправьте `/admin`, чтобы открыть панель администратора (сначала настройте там канал хранения — перешлите боту любое сообщение из этого канала; бот должен быть добавлен туда администратором).

### Поддержка

Вопросы или проблемы? Пишите в Telegram: **[@NetraIR](https://t.me/NetraIR)**

