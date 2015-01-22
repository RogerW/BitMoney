# language: ru
Функционал: Пользователям необходимо 
    дать возможность управления своими счетами
    
    Предыстория:
        Допустим созданы пользователи
        | email                 | password | role   | 
        | customer1@example.com | 12345678 | user   |
        | customer2@example.com | 12345678 | user   |
        | admin@example.com     | 12345678 | admin  |
    
    Структура сценария: Пользователь создает свой счет
        Допустим пользователь <email> авторизован в системе
        И создает себе счет с именем <title>
        Тогда видит сообщение об успешном создании счета
    Примеры:
        | email                 | title |
        | customer1@example.com | test  |
        | customer2@example.com | test  |
        | admin@example.com     | test  |
    
    Структура сценария: Пользователь пытается получить доступ к чужому счету
        Допустим созданы счета
        | email                 | title  |
        | customer1@example.com | test1  |
        | customer2@example.com | test2  |
        | admin@example.com     | test3  |
        И пользователь <email> хочет получить доступ к счету <title>
        То видит сообщение <message>
    Примеры:
        | email                 | title  | message                      |
        | customer1@example.com | test2  | Account don't exist.         |
        | customer2@example.com | test3  | Account don't exist.         |
        | admin@example.com     | test1  | Find me in app               |
         
    Структура сценария: Пользователь пытается отредактировать счет
        Допустим созданы счета
        | email                 | title  |
        | customer1@example.com | test1  |
        | customer2@example.com | test2  |
        | admin@example.com     | test3  |
        И пользователь <email> хочет переименовать счет <title>
        То видит сообщение <message>
    Примеры:
        | email                 | title  | message                      |
        | customer1@example.com | test2  | Account don't exist.         |
        | customer2@example.com | test3  | Account don't exist.         |
        | customer1@example.com | test1  | Account updated              | 
        | admin@example.com     | test3  | Account updated              |