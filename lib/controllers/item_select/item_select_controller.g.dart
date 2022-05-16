// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_select_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemSelectController on _ItemSelectControllerStoreBase, Store {
  late final _$isCheckAtom =
      Atom(name: '_ItemSelectControllerStoreBase.isCheck', context: context);

  @override
  bool get isCheck {
    _$isCheckAtom.reportRead();
    return super.isCheck;
  }

  @override
  set isCheck(bool value) {
    _$isCheckAtom.reportWrite(value, super.isCheck, () {
      super.isCheck = value;
    });
  }

  late final _$_ItemSelectControllerStoreBaseActionController =
      ActionController(
          name: '_ItemSelectControllerStoreBase', context: context);

  @override
  dynamic setChecked(bool val) {
    final _$actionInfo = _$_ItemSelectControllerStoreBaseActionController
        .startAction(name: '_ItemSelectControllerStoreBase.setChecked');
    try {
      return super.setChecked(val);
    } finally {
      _$_ItemSelectControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCheck: ${isCheck}
    ''';
  }
}
