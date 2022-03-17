// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_select_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupSelectControllerStore on _GroupSelectControllerBaseStore, Store {
  final _$groupItemsSelectAtom =
      Atom(name: '_GroupSelectControllerBaseStore.groupItemsSelect');

  @override
  ObservableList<GroupItem>? get groupItemsSelect {
    _$groupItemsSelectAtom.reportRead();
    return super.groupItemsSelect;
  }

  @override
  set groupItemsSelect(ObservableList<GroupItem>? value) {
    _$groupItemsSelectAtom.reportWrite(value, super.groupItemsSelect, () {
      super.groupItemsSelect = value;
    });
  }

  final _$hasGroupsAtom =
      Atom(name: '_GroupSelectControllerBaseStore.hasGroups');

  @override
  bool get hasGroups {
    _$hasGroupsAtom.reportRead();
    return super.hasGroups;
  }

  @override
  set hasGroups(bool value) {
    _$hasGroupsAtom.reportWrite(value, super.hasGroups, () {
      super.hasGroups = value;
    });
  }

  final _$itemsSelectAtom =
      Atom(name: '_GroupSelectControllerBaseStore.itemsSelect');

  @override
  ObservableList<ItemSelect>? get itemsSelect {
    _$itemsSelectAtom.reportRead();
    return super.itemsSelect;
  }

  @override
  set itemsSelect(ObservableList<ItemSelect>? value) {
    _$itemsSelectAtom.reportWrite(value, super.itemsSelect, () {
      super.itemsSelect = value;
    });
  }

  final _$rotationAtom = Atom(name: '_GroupSelectControllerBaseStore.rotation');

  @override
  double get rotation {
    _$rotationAtom.reportRead();
    return super.rotation;
  }

  @override
  set rotation(double value) {
    _$rotationAtom.reportWrite(value, super.rotation, () {
      super.rotation = value;
    });
  }

  final _$valuesAtom = Atom(name: '_GroupSelectControllerBaseStore.values');

  @override
  ObservableList<dynamic>? get values {
    _$valuesAtom.reportRead();
    return super.values;
  }

  @override
  set values(ObservableList<dynamic>? value) {
    _$valuesAtom.reportWrite(value, super.values, () {
      super.values = value;
    });
  }

  final _$_GroupSelectControllerBaseStoreActionController =
      ActionController(name: '_GroupSelectControllerBaseStore');

  @override
  dynamic setHasGroups(bool val) {
    final _$actionInfo = _$_GroupSelectControllerBaseStoreActionController
        .startAction(name: '_GroupSelectControllerBaseStore.setHasGroups');
    try {
      return super.setHasGroups(val);
    } finally {
      _$_GroupSelectControllerBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setup(GroupSelect<dynamic> widget) {
    final _$actionInfo = _$_GroupSelectControllerBaseStoreActionController
        .startAction(name: '_GroupSelectControllerBaseStore.setup');
    try {
      return super.setup(widget);
    } finally {
      _$_GroupSelectControllerBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addValue(dynamic val) {
    final _$actionInfo = _$_GroupSelectControllerBaseStoreActionController
        .startAction(name: '_GroupSelectControllerBaseStore.addValue');
    try {
      return super.addValue(val);
    } finally {
      _$_GroupSelectControllerBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeValue(dynamic val) {
    final _$actionInfo = _$_GroupSelectControllerBaseStoreActionController
        .startAction(name: '_GroupSelectControllerBaseStore.removeValue');
    try {
      return super.removeValue(val);
    } finally {
      _$_GroupSelectControllerBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggle() {
    final _$actionInfo = _$_GroupSelectControllerBaseStoreActionController
        .startAction(name: '_GroupSelectControllerBaseStore.toggle');
    try {
      return super.toggle();
    } finally {
      _$_GroupSelectControllerBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
groupItemsSelect: ${groupItemsSelect},
hasGroups: ${hasGroups},
itemsSelect: ${itemsSelect},
rotation: ${rotation},
values: ${values}
    ''';
  }
}
