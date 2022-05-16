// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_select_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupSelectControllerStore on _GroupSelectControllerBaseStore, Store {
  Computed<List<dynamic>>? _$getValuesComputed;

  @override
  List<dynamic> get getValues =>
      (_$getValuesComputed ??= Computed<List<dynamic>>(() => super.getValues,
              name: '_GroupSelectControllerBaseStore.getValues'))
          .value;
  Computed<dynamic>? _$getValueComputed;

  @override
  dynamic get getValue =>
      (_$getValueComputed ??= Computed<dynamic>(() => super.getValue,
              name: '_GroupSelectControllerBaseStore.getValue'))
          .value;

  late final _$groupItemsSelectAtom = Atom(
      name: '_GroupSelectControllerBaseStore.groupItemsSelect',
      context: context);

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

  late final _$hasGroupsAtom =
      Atom(name: '_GroupSelectControllerBaseStore.hasGroups', context: context);

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

  late final _$itemsSelectAtom = Atom(
      name: '_GroupSelectControllerBaseStore.itemsSelect', context: context);

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

  late final _$rotationAtom =
      Atom(name: '_GroupSelectControllerBaseStore.rotation', context: context);

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

  late final _$valuesAtom =
      Atom(name: '_GroupSelectControllerBaseStore.values', context: context);

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

  late final _$_GroupSelectControllerBaseStoreActionController =
      ActionController(
          name: '_GroupSelectControllerBaseStore', context: context);

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
  dynamic resetValues() {
    final _$actionInfo = _$_GroupSelectControllerBaseStoreActionController
        .startAction(name: '_GroupSelectControllerBaseStore.resetValues');
    try {
      return super.resetValues();
    } finally {
      _$_GroupSelectControllerBaseStoreActionController.endAction(_$actionInfo);
    }
  }

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
values: ${values},
getValues: ${getValues},
getValue: ${getValue}
    ''';
  }
}
