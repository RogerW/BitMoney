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
    