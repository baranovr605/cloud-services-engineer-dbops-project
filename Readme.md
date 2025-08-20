# Документация

## Предварительные действия

Перед тем как выполнять миграции и запросы к БД необходимо запустить на удаленном хосте контейнер Docker. Файл `docker-compose.yml` уже имеет всю соответствующую конфигурацию для запроска БД на удалеенном хосте и достаточно выполнить команду `docker compose up -d` убедившись, что контейнер был запущен успешно. Так же перед тем как запускать настоятельно рекомендуется изменить данные пользователя и порт по умолчанию для избежания доступа 
злоумышленников.

## Создание пользователя

После того как БД запущена и корректно работает необходимо выполнить ряд действий (в командах ниже уже считается что имеется доступ к консоли postgresql)

1. Создать нового пользователя

```
 CREATE USER your_user WITH PASSWORD 'your_secret_password';
```

2. Назначить права доступа

```
GRANT USAGE, CREATE ON SCHEMA public TO your_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO your_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO your_user;
```

Данные команды предоставяет все необходимые права пользователю для провеления миграций и манипулирования данными. 

## Выполнение запросов

Ниже приведен запрос для получения общего количества сосисок за предыдущую неделю

```
SELECT o.date_created, SUM(op.quantity)
FROM orders AS o
    JOIN order_product AS op ON o.id = op.order_id
WHERE status = 'shipped'
    AND o.date_created > NOW() - INTERVAL '7 DAY';
```

Данный запрос выполняет выборку по товарам со статусом `shipped` и выполняет `JOIN` по `order_id`, в результате чего получает общее количество сосик проданных за последнюю неделю.
