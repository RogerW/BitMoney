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
        | admin@example.com     | test1  | Current Account              |
         
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
        | customer1@example.com | test1  | Money deposited successfully     | 10.0   |
        | customer2@example.com | test2  | Money deposited successfully     | 15.5   |
        | customer1@example.com | test1  | Money deposited successfully     | 36.7   |
        | admin@example.com     | test3  | Money deposited successfully     | 98.24  |
        | admin@example.com     | test2  | Money deposited successfully     | 15.24  |
    
    Структура сценария: Пользователям необходимо дать возможность переводить деньги между своими счетами
        Допустим созданы счета
        | email                 | title  | balance  |
        | customer1@example.com | test1  | 100.00   |
        | customer1@example.com | test2  | 100.00   |
        | admin@example.com     | test3  | 101.00   |
        И пользователь <email> хочет перенести с счета <title_source> на счет <title_destination> <amount> рублей
        То видит сообщение <message>
    Примеры:
        | email                 | title_source  | title_destination | message                          | amount |
        | customer1@example.com | test1         | test1             | Source and Destination Equal     | 10.0   |
        | customer2@example.com | test2         | test1             | Money transfered successfully    | 15.5   |
        | customer1@example.com | test1         | test2             | Money transfered successfully    | 36.7   |
        | customer1@example.com | test1         | test2             | Not enough money                 | 110.0  | 
