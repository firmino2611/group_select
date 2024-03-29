// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'group_header_controller.g.dart';

class GroupHeaderController = _GroupHeaderControllerStoreBase
    with _$GroupHeaderController;

abstract class _GroupHeaderControllerStoreBase with Store {
  @observable
  bool? checkAll = false;

  bool changeOnlyVIsual = false;

  /// Detect click on chackbox in header
  @action
  onClickCheckAll(bool? value, [bool? onlyVisual]) {
    checkAll = value;

    changeOnlyVIsual = onlyVisual ?? false;
  }
}
