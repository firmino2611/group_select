import 'package:group_select/components/group_header.dart';
import 'package:group_select/components/group_item.dart';
import 'package:group_select/components/item_select.dart';
import 'package:group_select/controllers/group_select/group_select_controller.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:group_select/utils/ci_colors.dart';

export 'package:group_select/components/item_select.dart';
export 'package:group_select/components/group_item.dart';

typedef T = dynamic;

enum Lang {
  ptBR,
  enUS,
}

class GroupSelect<T> extends StatefulWidget {
  const GroupSelect({
    Key? key,
    required this.title,
    required this.controller,
    this.groups,
    this.items,
    this.activeColor = CIColors.blue,
  })  : assert(groups != null || items != null),
        super(key: key);

  final GroupSelectControllerStore<T> controller;

  final List<Group<T>>? groups;
  final List<Item<T>>? items;

  final String title;

  final Color? activeColor;

  @override
  _GroupSelectState createState() => _GroupSelectState();
}

class _GroupSelectState extends State<GroupSelect> {
  @override
  void initState() {
    super.initState();

    assert(
      !widget.controller.hasGroupIdsRepeated(widget.groups),
      'contains repeated group id',
    );

    widget.controller.setup(widget);
    widget.controller.setHasGroups(widget.groups != null);
  }

  _validateContent() {
    if (widget.controller.rotation != 0) {
      if (widget.groups != null) {
        return widget.controller.groupItemsSelect;
      }
      if (widget.items != null) {
        return widget.controller.itemsSelect;
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
              widget.controller.toggle();
            },
            child: GroupHeader(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: widget.controller.rotation,
                  child: const Icon(
                    Icons.expand_more,
                    color: CIColors.grey500,
                  ),
                ),
              ),
              activeColor: widget.activeColor ?? CIColors.blue,
              selectController: widget.controller,
              title: widget.title,
              isSub: false,
              itemCount: widget.items?.length ?? widget.controller.totalItems,
              itemCountSelected: widget.controller.values?.length ?? 0,
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
          color: active ? CIColors.white : CIColors.grey600,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: active ? activeColor : CIColors.grey200,
      ),
    );
  }
}
