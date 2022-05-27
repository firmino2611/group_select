import 'package:group_select/controllers/group_select/group_select_controller.dart';
import 'package:group_select/controllers/item_select/item_select_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:group_select/utils/colors_util.dart';

class ItemSelect extends StatefulWidget {
  const ItemSelect({
    Key? key,
    required this.item,
    this.controller,
    this.selectController,
    this.activeColor,
    this.onChnage,
  }) : super(key: key);

  final ItemSelectController? controller;
  final Item item;
  final GroupSelectControllerStore? selectController;

  final Color? activeColor;
  final Function(dynamic)? onChnage;

  @override
  _ItemSelectState createState() => _ItemSelectState();
}

class _ItemSelectState extends State<ItemSelect> {
  @override
  void initState() {
    super.initState();

    widget.selectController?.whenValuesCleared.listen((event) {
      if (widget.selectController!.multiple) {
        widget.controller?.setChecked(false);
      } else {
        widget.controller?.setChecked(
          widget.selectController!.getValues.contains(widget.item.value),
        );
      }
    });
  }

  void _checkMultiple() {
    widget.controller?.setChecked(!(widget.controller?.isCheck ?? false));

    if (widget.controller?.isCheck ?? false) {
      widget.selectController?.addValue(widget.item.value);
    } else {
      widget.selectController?.removeValue(widget.item.value);
    }

    if (widget.onChnage != null) {
      widget.onChnage!(
        widget.selectController?.getValues ?? [],
      );
    }
  }

  void _checkSingle() {
    widget.selectController?.resetValues();
    widget.controller?.setChecked(true);

    widget.selectController?.addValue(widget.item.value);

    if (widget.onChnage != null) {
      widget.onChnage!(
        widget.selectController?.getValue,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .5,
              color: ColorsUtil.grey300,
            ),
          ),
        ),
        child: ListTile(
          title: Text(
            widget.item.title,
            style: const TextStyle(
              fontSize: 17,
              color: ColorsUtil.grey700,
              overflow: TextOverflow.fade,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          tileColor: ColorsUtil.grey100,
          onTap:
              widget.selectController!.multiple ? _checkMultiple : _checkSingle,
          leading: widget.item.leading,
          minLeadingWidth: 5,
          contentPadding: EdgeInsets.only(
            left: widget.selectController?.hasGroups ?? false ? 90 : 50,
            right: 20,
          ),
          trailing: Checkbox(
            onChanged: (bool? value) {
              widget.selectController!.multiple
                  ? _checkMultiple()
                  : _checkSingle();
            },
            value: (widget.controller?.isCheck ?? false) &&
                widget.selectController!.getValues.isNotEmpty,
            shape: widget.selectController!.multiple
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )
                : const CircleBorder(),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return widget.activeColor ?? ColorsUtil.blue;
              }
              return ColorsUtil.grey600;
            }),
          ),
        ),
      );
    });
  }
}

class Item<T> {
  Item({
    Key? key,
    this.leading,
    required this.title,
    this.value,
  });

  final Widget? leading;
  final String title;
  final T? value;
}
