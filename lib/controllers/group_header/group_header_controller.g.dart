// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_header_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupHeaderController on _GroupHeaderControllerStoreBase, Store {
  late final _$checkAllAtom =
      Atom(name: '_GroupHeaderControllerStoreBase.checkAll', context: context);

  @override
  bool? get checkAll {
    _$checkAllAtom.reportRead();
    return super.checkAll;
  }

  @override
  set checkAll(bool? value) {
    _$checkAllAtom.reportWrite(value, super.checkAll, () {
      super.checkAll = value;
    });
  }

  late final _$_GroupHeaderControllerStoreBaseActionController =
      ActionController(
          name: '_GroupHeaderControllerStoreBase', context: context);

  @override
  dynamic onClickCheckAll(bool? value, [bool? onlyVisual]) {
    final _$actionInfo = _$_GroupHeaderControllerStoreBaseActionController
        .startAction(name: '_GroupHeaderControllerStoreBase.onClickCheckAll');
    try {
      return super.onClickCheckAll(value, onlyVisual);
    } finally {
      _$_GroupHeaderControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkAll: ${checkAll}
    ''';
  }
}
