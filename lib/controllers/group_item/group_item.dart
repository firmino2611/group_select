// ignore_for_file: library_private_types_in_public_api

import 'package:group_select/components/group_item.dart';
import 'package:group_select/components/item_select.dart';

import 'package:mobx/mobx.dart';

part 'group_item.g.dart';

class GroupItemController = _GroupItemControllerStoreBase
    with _$GroupItemController;

abstract class _GroupItemControllerStoreBase with Store {
  @observable
  double rotation = 0;

  @observable
  ObservableList? groupValues = ObservableList();

  /// Change rotation icon arrow
  @action
  toggle() {
    rotation = rotation == 0 ? .5 : 0;
  }

  /// Count number of items selected
  /// [GroupItem] group item
  countItemsSelected(GroupItem widget) {
    int count = 0;
    for (ItemSelect item in widget.items!) {
      if (widget.selectController!.values?.contains(item.item.value) ?? false) {
        count++;
      }
    }
    return count;
  }
}
