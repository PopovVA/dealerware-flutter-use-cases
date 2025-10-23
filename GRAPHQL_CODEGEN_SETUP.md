# GraphQL CodeGen Setup ✅

Этот документ описывает настройку и использование GraphQL CodeGen в проекте.

## ✅ Что было сделано

### 1. **Схема GraphQL**

- 📁 `lib/core/graphql/schema.graphql` - схема из GraphQL Zero API
- Содержит типы: User, Post, Album, Photo, Todo, Comment

### 2. **Operations файлы**

- 📁 `lib/core/graphql/operations/posts.graphql` - CRUD операции для Posts

  - `GetPosts` - получение списка с пагинацией
  - `GetPost` - получение одного поста с комментариями
  - `CreatePost` - создание поста
  - `UpdatePost` - обновление поста
  - `DeletePost` - удаление поста
  - `PostFields` - fragment для полей поста

- 📁 `lib/core/graphql/operations/cars_example.graphql` - шаблон для Cars

### 3. **Конфигурация Build.yaml**

```yaml
targets:
  $default:
    builders:
      graphql_codegen:
        enabled: true
        options:
          schema: lib/core/graphql/schema.graphql
          queries_glob: lib/core/graphql/operations/*.graphql
          type_name_suffix: "GQL"
          generate_helpers: true
          clients:
            - graphql_flutter
```

### 4. **Сгенерированные файлы**

После запуска генерации создаются:

- `lib/core/graphql/operations/posts.graphql.dart` (~4600 строк)
- `lib/core/graphql/schema.graphql.dart` (~3500 строк)

Содержат:

- ✅ Типизированные классы для всех типов GraphQL
- ✅ Query/Mutation классы с документами
- ✅ Variables классы для параметров
- ✅ Фрагменты
- ✅ JSON сериализация/десериализация
- ✅ CopyWith методы
- ✅ Equality операторы

### 5. **Пример использования**

📁 `lib/core/graphql/examples/posts_repository_example.dart`

Демонстрирует:

- Создание GraphQL клиента
- Repository паттерн с использованием сгенерированного кода
- CRUD операции
- Обработка ошибок

## 🚀 Команды

### Генерация кода

```bash
# Одноразовая генерация
flutter pub run build_runner build --delete-conflicting-outputs

# Непрерывная генерация (watch mode)
flutter pub run build_runner watch --delete-conflicting-outputs

# Очистка
flutter pub run build_runner clean
```

## 📋 Как адаптировать для Cars

### Шаг 1: Получить схему

Если у вас есть GraphQL endpoint для Cars:

```bash
# Опционально: скачать схему с сервера
# npm install -g get-graphql-schema
# get-graphql-schema https://your-api.com/graphql > lib/core/graphql/schema_cars.graphql
```

Или создать схему вручную на основе вашего API.

### Шаг 2: Создать operations файл

📁 `lib/core/graphql/operations/cars.graphql`:

```graphql
# Fragment для полей Car
fragment CarFields on Car {
  id
  make
  model
  year
  color
  vin
  price
  mileage
}

# Query: Получить все машины
query GetCars($options: PageQueryOptions) {
  cars(options: $options) {
    data {
      ...CarFields
    }
    meta {
      totalCount
    }
  }
}

# Query: Получить одну машину
query GetCar($id: ID!) {
  car(id: $id) {
    ...CarFields
  }
}

# Mutation: Создать машину
mutation CreateCar($input: CreateCarInput!) {
  createCar(input: $input) {
    ...CarFields
  }
}

# Mutation: Обновить машину
mutation UpdateCar($id: ID!, $input: UpdateCarInput!) {
  updateCar(id: $id, input: $input) {
    ...CarFields
  }
}

# Mutation: Удалить машину
mutation DeleteCar($id: ID!) {
  deleteCar(id: $id)
}
```

### Шаг 3: Сгенерировать код

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Шаг 4: Создать Repository

```dart
import 'package:graphql_flutter/graphql_flutter.dart';
import '../operations/cars.graphql.dart';
import '../schema.graphql.dart';

class CarsGraphQLRepository {
  final GraphQLClient client;

  CarsGraphQLRepository({required this.client});

  Future<Query$GetCars$cars?> getCars({int page = 1, int limit = 10}) async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryGetCars,
        variables: Variables$Query$GetCars(
          options: Input$PageQueryOptions(
            paginate: Input$PaginateOptions(page: page, limit: limit),
          ),
        ).toJson(),
      ),
    );

    if (result.hasException) throw result.exception!;
    return Query$GetCars.fromJson(result.data!).cars;
  }

  Future<Fragment$CarFields?> getCarById(String id) async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryGetCar,
        variables: Variables$Query$GetCar(id: id).toJson(),
      ),
    );

    if (result.hasException) throw result.exception!;
    return Query$GetCar.fromJson(result.data!).car;
  }

  // ... create, update, delete методы
}
```

### Шаг 5: Интегрировать с существующей архитектурой

1. Создать Use Cases для Cars
2. Создать Entities на основе сгенерированных типов
3. Маппить GraphQL типы в Domain Entities
4. Использовать в Riverpod Notifiers

## 🎯 Преимущества использования CodeGen

1. **Type Safety** - полная типизация на этапе компиляции
2. **Автогенерация** - не нужно писать сериализацию вручную
3. **Синхронизация** - схема всегда соответствует коду
4. **Меньше ошибок** - невозможно опечататься в названиях полей
5. **Autocompletion** - IDE подсказывает все доступные поля
6. **Рефакторинг** - легко изменять структуру данных

## 📚 Полезные ссылки

- [GraphQL Zero API](https://graphqlzero.almansi.me/) - тестовый API
- [graphql_codegen](https://pub.dev/packages/graphql_codegen) - документация пакета
- [graphql_flutter](https://pub.dev/packages/graphql_flutter) - GraphQL клиент
- [Пример использования](lib/core/graphql/examples/posts_repository_example.dart)

## 🔍 Структура проекта

```
lib/core/graphql/
├── schema.graphql              # Схема GraphQL
├── schema.graphql.dart         # ✨ Сгенерированные типы схемы
├── operations/
│   ├── posts.graphql           # Operations для Posts
│   ├── posts.graphql.dart      # ✨ Сгенерированный код для Posts
│   └── cars_example.graphql    # Шаблон для Cars
├── examples/
│   └── posts_repository_example.dart  # Пример использования
└── README.md                   # Подробная документация

✨ - файлы генерируются автоматически
```

## ✅ Результаты

- ✅ Настроен GraphQL CodeGen
- ✅ Создана схема из GraphQL Zero API
- ✅ Созданы operations для Posts (как пример flow)
- ✅ Настроен build.yaml
- ✅ Сгенерирован код (успешно, 9 outputs)
- ✅ Создан пример использования
- ✅ Все тесты проходят (31 тест)
- ✅ Нет линтер ошибок
- ✅ Готовый шаблон для Cars

Теперь этот flow можно легко применить к любой другой сущности (Cars, Users, Albums и т.д.)! 🚀
