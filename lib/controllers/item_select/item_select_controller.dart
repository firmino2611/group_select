import 'package:mobx/mobx.dart';
part 'item_select_controller.g.dart';

class ItemSelectController = _ItemSelectControllerStoreBase
    with _$ItemSelectController;

abstract class _ItemSelectControllerStoreBase with Store {
  @observable
  bool isCheck = false;

  @action
  setChecked(bool val) {
    isCheck = val;
  }
}
