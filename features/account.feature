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
    
    Структура сценария: Пользователям необходимо дать возможность вносить деньги на счет
    с занесением соответсвующих записей в БД
        Допустим созданы счета
        | email                 | title  |
        | customer1@example.com | test1  |
        | customer2@example.com | test2  |
        | admin@example.com     | test3  |
        И пользователь <email> хочет внести на счет <title> <amount> рублей
        То видит сообщение <message>
    Примеры:
        | email                 | title  | message                          | amount |
        | customer1@example.com | test2  | Money deposited successfully     | 10.0   |
        | customer2@example.com | test3  | Not enough money in the account  | 15.5   |
        | customer1@example.com | test1  | Money deposited successfully     | 36.7   |
        | admin@example.com     | test3  | Money deposited successfully     | 98.24  |