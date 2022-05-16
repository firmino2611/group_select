Multiple selection component with groupings
##### DEMO http://group-select.appinventorbrasil.com.br/#/

## Getting started

Import package

```dart
import 'package:group_select/group_select.dart';
```

## Usage

To use the component it is necessary to create a controller, and you can also specify a custom type for the controller and for the component.

```dart
final SelectController<int> controller = SelectController<int>(
    lang: LangBadge.enUS,
    multiple: false,
);

final SelectController<String> groupController = SelectController<String>();
```

The initalization component need to receive a controller:

```dart
// With items
 GroupSelect<int>(
    activeColor: Colors.red,
    title: 'With items',
    controller: controller,
    items: [
        Item(title: 'Item 1', value: 1),
        Item(title: 'Item 2', value: 2),
        Item(title: 'Item 3', value: 3),
        Item(title: 'Item 4', value: 4),
        Item(title: 'Item 5', value: 5),
    ],
),
```

The groups need of an unique id.

```dart
// With groups items
GroupSelect<String>(
    title: 'With groups items',
    activeColor: Colors.green,
    controller: groupController,
    groups: [
        Group(
            title: 'Grupo 1',
            id: '2',
            items: [
                Item(title: 'Item 1', value: '1'),
                Item(title: 'Item 2', value: '2'),
                Item(title: 'Item 3', value: '3'),
                Item(title: 'Item 4', value: '4'),
                Item(title: 'Item 5', value: '5'),
            ],
        ),
        Group(
            title: 'Grupo 2',
            id: '2',
            items: [
                Item(title: 'Item 1', value: '6'),
                Item(title: 'Item 2', value: '7'),
                Item(title: 'Item 3', value: '8'),
                Item(title: 'Item 4', value: '9'),
                Item(title: 'Item 5', value: '10'),
            ],
        ),
    ],
)
```

## Properties

Items can have a **leading**, that can be any widget:

```dart
Item(
    title: 'Item 4',
    value: '4',
    leading: const Icon(Icons.circle),
);
Item(
    title: 'Item 4',
    value: '4',
    leading: Image.asset('path/to/image'),
),
```

It's possible change color active (**activeColor**) in badge and checkbox:

```dart
GroupSelect<String>(
    title: 'With groups items',
    activeColor: Colors.green,
);
```

## Controller

To recover values selected use property **values** of controller:

```dart
List<T> get getValues
```

To recovery single value, when multiple options is false

```dart
List<T> get getValue
```

To clear a values use:

```dart
List<T> get resetValues(){}
```

## Additional information

CONTRIBUTORS:

- Guilherme Barbosa: [Linkedin](https://www.linkedin.com/in/barbosagui/)
- Lucas Firmino: [Linkedin](https://www.linkedin.com/in/lucasfirminobarros/)
