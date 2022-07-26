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
  State<ItemSelect> createState() => _ItemSelectState();
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
    return Observer(
      builder: (_) {
        return SizedBox(
          child: ListTile(
            title: Text(
              widget.item.title,
              style: TextStyle(
                fontSize: 17,
                color: widget.selectController!.dark
                    ? ColorsUtil.white
                    : ColorsUtil.grey700,
                overflow: TextOverflow.fade,
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
            tileColor: widget.selectController!.dark
                ? ColorsUtil.grey700
                : ColorsUtil.grey100,
            onTap: widget.selectController!.multiple
                ? _checkMultiple
                : _checkSingle,
            leading: widget.item.leading,
            minLeadingWidth: 5,
            contentPadding: EdgeInsets.only(
              left: widget.selectController?.hasGroups ?? false ? 90 : 50,
              right: 20,
            ),
            trailing: _CheckBox(
              onChange: (bool? value) {
                widget.selectController!.multiple
                    ? _checkMultiple()
                    : _checkSingle();
              },
              activeColor: widget.activeColor,
              value: _checkValue,
              shape: widget.selectController!.multiple
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )
                  : const CircleBorder(),
            ),
          ),
        );
      },
    );
  }

  /// Verify current value
  bool get _checkValue {
    return (widget.controller?.isCheck ?? false) &&
        widget.selectController!.getValues.isNotEmpty;
  }
}

/// Widget internal checkbox
class _CheckBox extends StatefulWidget {
  const _CheckBox({
    Key? key,
    required this.onChange,
    this.value = false,
    this.shape,
    this.activeColor,
  }) : super(key: key);

  final Function(bool?) onChange;
  final bool value;
  final OutlinedBorder? shape;
  final Color? activeColor;

  @override
  State<_CheckBox> createState() => __CheckBoxState();
}

class __CheckBoxState extends State<_CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: widget.onChange,
      value: widget.value,
      shape: widget.shape,
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return widget.activeColor ?? ColorsUtil.blue;
        }
        return ColorsUtil.grey600;
      }),
    );
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
