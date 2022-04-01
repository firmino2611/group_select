import 'dart:async';
import 'dart:developer';

import 'package:group_select/components/group_select.dart';
import 'package:group_select/controllers/group_item/group_item.dart';
import 'package:group_select/controllers/item_select/item_select_controller.dart';

import 'package:mobx/mobx.dart';
part 'group_select_controller.g.dart';

typedef SelectController<T> = GroupSelectControllerStore<T>;

/// Class to controller Widget
class GroupSelectControllerStore<T> = _GroupSelectControllerBaseStore
    with _$GroupSelectControllerStore;

abstract class _GroupSelectControllerBaseStore with Store {
  int totalItems = 0;

  bool _hasInitialized = false;

  final _whenValuesClearedStream = StreamController<bool>.broadcast();
  late Stream<bool> whenValuesCleared;

  _GroupSelectControllerBaseStore({
    this.lang = Lang.enUS,
  }) {
    whenValuesCleared = _whenValuesClearedStream.stream;
  }

  final Lang lang;

  @observable
  ObservableList<GroupItem>? groupItemsSelect;

  @observable
  bool hasGroups = false;

  @observable
  ObservableList<ItemSelect>? itemsSelect;

  @observable
  double rotation = 0;

  @observable
  ObservableList<T>? values = ObservableList<T>();

  @computed
  List<T> get getValues => values?.map((val) => val).toList() ?? [];

  /// Setup control verify has group
  /// [val] if 'true' has groups
  @action
  setHasGroups(bool val) {
    hasGroups = val;
  }

  /// Create widget items and groups
  /// [widget] GroupSelect
  @action
  setup(GroupSelect widget) {
    if (_hasInitialized) return;

    if (widget.items != null) {
      final list = widget.items!.map(
        (e) {
          totalItems++;
          return ItemSelect(
            item: e,
            activeColor: widget.activeColor,
            controller: ItemSelectController(),
            selectController: widget.controller,
          );
        },
      ).toList();

      itemsSelect = ObservableList.of(list);
      _hasInitialized = true;
      return;
    }

    if (widget.groups != null) {
      final list = widget.groups!.map(
        (e) {
          return GroupItem(
            title: e.title,
            id: e.id,
            activeColor: widget.activeColor,
            items: e.items?.map((i) {
              totalItems++;

              return ItemSelect(
                item: i,
                activeColor: widget.activeColor,
                controller: ItemSelectController(),
                selectController: widget.controller,
              );
            }).toList(),
            controller: GroupItemController(),
            selectController: widget.controller,
          );
        },
      ).toList();

      groupItemsSelect = ObservableList.of(list);
      _hasInitialized = true;
    }
  }

  /// Add new values in controller
  /// [val] dynamic or T
  @action
  addValue(val) {
    bool exists = values?.contains(val) ?? false;
    if (!exists) {
      values?.add(val);
    }
    log('values: ' + values.toString());
  }

  /// Remove value of list
  /// [val] values to be removed of list
  @action
  removeValue(val) {
    values?.removeWhere((value) => value == val);
  }

  /// Control display of items/groups
  @action
  toggle() {
    rotation = rotation == 0 ? .5 : 0;
  }

  /// Reset all selected values
  @action
  resetValues() {
    values?.clear();
    _whenValuesClearedStream.sink.add(true);
  }

  /// Closed controller stream
  dispose() {
    _whenValuesClearedStream.close();
  }

  /// Verify if has any group with id repeat
  /// [groups] list of groups
  hasGroupIdsRepeated(List<Group>? groups) {
    if (groups != null) {
      for (Group group in groups) {
        final size = groups.where(
          (g) => g.id == group.id,
        );

        if (size.length > 1) return true;
      }
    }
    return false;
  }

  /// Translate text of badge item
  translateBadge() {
    switch (lang) {
      case Lang.ptBR:
        return 'de';
      case Lang.enUS:
        return 'from';
    }
  }
}
