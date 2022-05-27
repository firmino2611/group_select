// ignore_for_file: unused_element

import 'dart:async';
import 'dart:developer';

import 'package:group_select/components/group_select.dart';
import 'package:group_select/controllers/group_item/group_item.dart';
import 'package:group_select/controllers/item_select/item_select_controller.dart';
import 'package:group_select/controllers/select_group_controller.dart';

import 'package:mobx/mobx.dart';
part 'group_select_controller.g.dart';

typedef SelectController<T> = GroupSelectControllerStore<T>;
typedef OnChange = Function(dynamic);

/// Class to controller Widget
class GroupSelectControllerStore<T> = _GroupSelectControllerBaseStore
    with _$GroupSelectControllerStore;

abstract class _GroupSelectControllerBaseStore with Store {
  _GroupSelectControllerBaseStore({
    this.lang = LangBadge.enUS,
    this.multiple = true,
  }) {
    whenValuesCleared = _whenValuesClearedStream.stream;
  }

  @observable
  ObservableList<GroupItem>? groupItemsSelect;

  @observable
  bool hasGroups = false;

  @observable
  ObservableList<ItemSelect>? itemsSelect;

  final LangBadge lang;
  final bool multiple;
  final _whenValuesClearedStream = StreamController<bool>.broadcast();

  late Stream<bool> whenValuesCleared;

  int totalItems = 0;
  bool _hasInitialized = false;

  /// Degree rotation of icon arrow
  @observable
  double rotation = 0;

  /// Values selected
  @observable
  ObservableList<T>? values = ObservableList<T>();

  /// Add new values in controller
  /// [val] dynamic or T
  @action
  addValue(val) {
    bool exists = values?.contains(val) ?? false;
    if (!exists) {
      values?.add(val);
    }
  }

  /// Closed controller stream
  dispose() {
    _whenValuesClearedStream.close();
  }

  /// Recovery list of selected values
  @computed
  List<T> get getValues => values?.map((val) => val).toList() ?? [];

  /// Can be used when the  multiple option id true
  @computed
  T get getValue => values?.map((val) => val).first;

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

  /// Remove value of list
  /// [val] values to be removed of list
  @action
  removeValue(val) {
    values?.removeWhere((value) => value == val);
  }

  /// Reset all selected values
  @action
  resetValues() {
    values?.clear();
    _whenValuesClearedStream.sink.add(true);
  }

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
            selectController: widget.controller.selectCtrl,
            onChnage: widget.onChange,
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
                selectController: widget.controller.selectCtrl,
                onChnage: widget.onChange,
              );
            }).toList(),
            controller: GroupItemController(),
            selectController: widget.controller.selectCtrl,
          );
        },
      ).toList();

      groupItemsSelect = ObservableList.of(list);
      _hasInitialized = true;
    }
  }

  /// Control display of items/groups
  @action
  toggle() {
    rotation = rotation == 0 ? .5 : 0;
  }
}
