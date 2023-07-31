# Интеграция с телеграм

## Документация

Документация по интеграции с телеграм опубликована по [ссылке](https://core.telegram.org/bots/api), инструкция ниже сформирована на основании этой документации.

## Подготовка

### Создание бота

1. Напишете в телеграм [https://t.me/BotFather](BotFather) команду "/start"
2. Напишите команду "/newbot"
3. Выберите имя вашего бота, которое будет видеть пользователи
4. Выберите идентификатор вашего бота (он должен заканчиваться на "bot")
5. Скопируйте токен, который пришлет BotFather и сохраните его в константу

### Создание группы

1. Создайте группу в телеграм
2. Добавьте в группу только что созданного бота
3. Назначьте боту права администратора

### Получите идентификатор группы

1. Напишите любое сообщение в группу
2. С помощью браузера или Postman выполните запрос `https://api.telegram.org/bot[ВашТокен]/getUpdates`. В полученном JSON найдите идентификатор группы, в которой получено сообщение и сохраните его в константу

## Отправка сообщений

1. Создайте общий модуль "Телеграм"
2. В модуле реализуйте метод, который получает на вход текст сообщения
3. В рамках метода:
    - Создайте защищенное соединение с сервером "api.telegram.org"
    - Создайте HTTP-запрос к ресурсу `/bot[ВашТокен]/sendMessage`
    - Добавьте Заголовок "Content-Type" со значением "application/json"
    - Подготовьте Структуру с полями:
        - "chat_id" - идентификатор группы из константы
        - "text" - текст сообщения
    - Установите JSON строку, полученную из структуры, в качестве тела HTTP-запроса
    - Отправьте запрос с помощью метода "POST"
    - Проверьте, что получет ответ с кодом состояния 200, если код состояния другой - получите тело ответа как строку и запишите в журнал регистрации информацию об ошибке

*Пример реализации телеграм-бота подробнее можно посмотреть в [видео](https://www.youtube.com/live/peZsik57m4k?feature=share)*
