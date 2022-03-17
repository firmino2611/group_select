import 'package:group_select/controllers/group_select/group_select_controller.dart';
import 'package:group_select/controllers/item_select/item_select_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:group_select/utils/ci_colors.dart';

class ItemSelect extends StatefulWidget {
  const ItemSelect({
    Key? key,
    required this.item,
    this.controller,
    this.selectController,
    this.activeColor,
  }) : super(key: key);

  final ItemSelectController? controller;
  final Item item;
  final GroupSelectControllerStore? selectController;

  final Color? activeColor;

  @override
  _ItemSelectState createState() => _ItemSelectState();
}

class _ItemSelectState extends State<ItemSelect> {
  void _check() {
    widget.controller?.setChecked(!(widget.controller?.isCheck ?? false));

    if (widget.controller?.isCheck ?? false) {
      widget.selectController?.addValue(widget.item.value);
    } else {
      widget.selectController?.removeValue(widget.item.value);
    }
  }

  test() {}

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .5,
              color: CIColors.grey300,
            ),
          ),
        ),
        child: ListTile(
          title: Text(
            widget.item.title,
            style: const TextStyle(fontSize: 17, color: CIColors.grey700),
          ),
          tileColor: CIColors.grey100,
          onTap: _check,
          leading: widget.item.leading,
          minLeadingWidth: 5,
          contentPadding: EdgeInsets.only(
            left: widget.selectController?.hasGroups ?? false ? 90 : 50,
            right: 20,
          ),
          trailing: Checkbox(
            onChanged: (bool? value) {
              _check();
            },
            value: widget.controller?.isCheck ?? false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return widget.activeColor ?? CIColors.blue;
              }
              return CIColors.grey600;
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
