// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'item_select_controller.g.dart';

class ItemSelectController = _ItemSelectControllerStoreBase
    with _$ItemSelectController;

abstract class _ItemSelectControllerStoreBase with Store {
  @observable
  bool isCheck = false;

  /// Set value of checked item
  @action
  setChecked(bool val) {
    isCheck = val;
  }
}
