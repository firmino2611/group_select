Multiple selection component with groupings
##### DEMO http://group-select.esquilodigital.com.br/#/

## Getting started

Import package

```dart
import 'package:group_select/group_select.dart';
```

## Usage

To use the component it is necessary to create a controller, and you can also specify a custom type for the controller and for the component.

```dart
final  controller = SelectGroupController<int>(
    lang: LangBadge.enUS,
    multiple: false,
    dark: false,
);

final  groupController = SelectGroupController<String>();
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
     onChange: (values) {
        print(values);
    }
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

### Groups

Groups receive items, and must have a unique id.

```dart
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
```

### Items

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

### onChange

It is always called when there is a change in the selected items:

```dart
GroupSelect<T>(
    title: 'With groups items',
    activeColor: Colors.green,
    controller: groupController,
     onChange: (dynamic values) {
        print(values);
    }
    // ... code ommitted
)
```

### activeColor

It's possible change color active in badge and checkbox:

```dart
GroupSelect<String>(
    title: 'With groups items',
    activeColor: Colors.green,
);
```

### dark

Enable mode dark to component. example in LINK DEMO.

## Controller

Recover value selected. If multiple enable the value is a [List<T>], else return a single value [T]:

```dart
dynamic get value
```

To clear a values use:

```dart
void resetValues()
```

## Additional information

CONTRIBUTORS:

- Guilherme Barbosa: [Linkedin](https://www.linkedin.com/in/barbosagui/)
- Lucas Firmino: [Linkedin](https://www.linkedin.com/in/lucasfirminobarros/)
