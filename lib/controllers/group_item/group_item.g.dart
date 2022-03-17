// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupItemController on _GroupItemControllerStoreBase, Store {
  final _$rotationAtom = Atom(name: '_GroupItemControllerStoreBase.rotation');

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

  final _$groupValuesAtom =
      Atom(name: '_GroupItemControllerStoreBase.groupValues');

  @override
  ObservableList<dynamic>? get groupValues {
    _$groupValuesAtom.reportRead();
    return super.groupValues;
  }

  @override
  set groupValues(ObservableList<dynamic>? value) {
    _$groupValuesAtom.reportWrite(value, super.groupValues, () {
      super.groupValues = value;
    });
  }

  final _$_GroupItemControllerStoreBaseActionController =
      ActionController(name: '_GroupItemControllerStoreBase');

  @override
  dynamic toggle() {
    final _$actionInfo = _$_GroupItemControllerStoreBaseActionController
        .startAction(name: '_GroupItemControllerStoreBase.toggle');
    try {
      return super.toggle();
    } finally {
      _$_GroupItemControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rotation: ${rotation},
groupValues: ${groupValues}
    ''';
  }
}
