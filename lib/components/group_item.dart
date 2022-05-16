import 'package:group_select/components/group_header.dart';
import 'package:group_select/controllers/group_header/group_header_controller.dart';
import 'package:group_select/controllers/group_item/group_item.dart';
import 'package:group_select/controllers/group_select/group_select_controller.dart';
import 'package:group_select/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'item_select.dart';

class GroupItem extends StatefulWidget {
  const GroupItem({
    Key? key,
    this.items,
    required this.title,
    this.controller,
    this.selectController,
    required this.id,
    this.activeColor,
  }) : super(key: key);

  final GroupItemController? controller;
  final List<ItemSelect>? items;
  final GroupSelectControllerStore? selectController;
  final String title;
  final dynamic id;
  final Color? activeColor;

  @override
  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  final groupHeaderController = GroupHeaderController();

  @override
  void initState() {
    super.initState();

    /// React when the select all on header is clicked and
    /// change all items to false
    reaction((fn) => groupHeaderController.checkAll, (bool? value) {
      if (!groupHeaderController.changeOnlyVIsual) {
        widget.items?.forEach((item) {
          item.controller!.setChecked(value ?? false);

          value ?? false
              ? widget.selectController?.addValue(item.item.value)
              : widget.selectController?.removeValue(item.item.value);
        });
      }
    });

    reaction((fn) => widget.controller?.countItemsSelected(widget), (values) {
      bool allItemSelected =
          widget.items?.length == widget.controller!.countItemsSelected(widget);

      groupHeaderController.onClickCheckAll(allItemSelected, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                widget.controller?.toggle();
              },
              child: GroupHeader(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 0),
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: widget.controller?.rotation ?? 0,
                    child: const Icon(
                      Icons.expand_more,
                      color: ColorsUtil.grey500,
                    ),
                  ),
                ),
                title: widget.title,
                activeColor: widget.activeColor,
                controller: groupHeaderController,
                isSub: true,
                selectController: widget.selectController,
                itemCount: widget.items?.length ?? 0,
                itemCountSelected: widget.controller!.countItemsSelected(
                  widget,
                ),
              ),
            ),
            Visibility(
              visible: widget.controller?.rotation != 0,
              child: Column(
                children: widget.items ?? [],
              ),
            ),
          ],
        );
      },
    );
  }
}

class Group<T> {
  const Group({
    Key? key,
    this.items,
    required this.title,
    required this.id,
  });

  final List<Item<T>>? items;
  final String title;
  final T id;
}
