import 'package:group_select/components/group_header.dart';
import 'package:group_select/components/group_item.dart';
import 'package:group_select/components/item_select.dart';
import 'package:group_select/controllers/group_select/group_select_controller.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:group_select/controllers/select_group_controller.dart';
import 'package:group_select/utils/colors_util.dart';
import 'package:mobx/mobx.dart';

export 'package:group_select/components/item_select.dart';
export 'package:group_select/components/group_item.dart';

typedef T = dynamic;

enum LangBadge {
  ptBR('de'),
  enUS('from');

  final String translate;

  const LangBadge(this.translate);
}

class GroupSelect<T> extends StatefulWidget {
  const GroupSelect({
    Key? key,
    required this.title,
    required this.controller,
    this.groups,
    this.items,
    this.activeColor = ColorsUtil.blue,
    this.onChange,
  })  : assert(groups != null || items != null),
        super(key: key);

  /// Controller component
  final SelectGroupController<T> controller;

  final List<Group<T>>? groups;
  final List<Item<T>>? items;

  /// Title header top
  final String title;

  /// Color active items
  final Color? activeColor;

  /// Called whenever selected values change, returns values
  ///  in case of multiple selection or a single value in
  ///  case of single selection.
  final void Function(dynamic)? onChange;

  @override
  _GroupSelectState createState() => _GroupSelectState();
}

class _GroupSelectState extends State<GroupSelect> {
  @override
  void initState() {
    super.initState();

    assert(
      !widget.controller.selectCtrl.hasGroupIdsRepeated(widget.groups),
      'contains repeated group id',
    );

    widget.controller.selectCtrl.setup(widget);
    widget.controller.selectCtrl.setHasGroups(widget.groups != null);
  }

  /// Validate content show
  _validateContent() {
    if (widget.controller.selectCtrl.rotation != 0) {
      if (widget.groups != null) {
        return widget.controller.selectCtrl.groupItemsSelect;
      }
      if (widget.items != null) {
        return widget.controller.selectCtrl.itemsSelect;
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              widget.controller.selectCtrl.toggle();
            },
            child: GroupHeader(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: widget.controller.selectCtrl.rotation,
                  child: const Icon(
                    Icons.expand_more,
                    color: ColorsUtil.grey500,
                  ),
                ),
              ),
              activeColor: widget.activeColor ?? ColorsUtil.blue,
              selectController: widget.controller.selectCtrl,
              title: widget.title,
              isSub: false,
              itemCount: widget.items?.length ??
                  widget.controller.selectCtrl.totalItems,
              itemCountSelected:
                  widget.controller.selectCtrl.values?.length ?? 0,
            ),
          ),
          ..._validateContent(),
        ],
      );
    });
  }
}

class GroupBadge extends StatelessWidget {
  const GroupBadge({
    Key? key,
    required this.text,
    this.active = false,
    this.activeColor,
  }) : super(key: key);

  final String text;
  final bool active;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: active ? ColorsUtil.white : ColorsUtil.grey600,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: active ? activeColor : ColorsUtil.grey200,
      ),
    );
  }
}
