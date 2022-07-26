import 'package:group_select/components/group_select.dart';
import 'package:group_select/controllers/group_header/group_header_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_select/controllers/group_select/group_select_controller.dart';
import 'package:group_select/utils/colors_util.dart';
import 'package:group_select/utils/style.dart';

class GroupHeader extends StatefulWidget {
  const GroupHeader({
    Key? key,
    required this.title,
    required this.icon,
    this.isSub = false,
    this.itemCount = 0,
    this.itemCountSelected = 0,
    this.selectController,
    this.controller,
    this.activeColor,
  }) : super(key: key);

  final GroupSelectControllerStore? selectController;
  final GroupHeaderController? controller;

  final Widget icon;

  final bool isSub;

  final int itemCount;
  final int itemCountSelected;

  final String title;

  final Color? activeColor;

  @override
  State<GroupHeader> createState() => _GroupHeaderState();
}

class _GroupHeaderState extends State<GroupHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: widget.selectController!.dark
          ? Style.boxDecorationHeaderDark(widget.isSub)
          : Style.boxDecorationHeaderLight(widget.isSub),
      padding: widget.isSub ? const EdgeInsets.only(left: 40) : null,
      child: Row(
        children: [
          widget.icon,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      widget.title,
                      style: widget.selectController!.dark
                          ? Style.textStyleHeaderDark()
                          : Style.textStyleHeaderLight(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Visibility(
                  visible: (widget.selectController?.multiple ?? false),
                  child: GroupBadge(
                    text: _getText,
                    activeColor: widget.activeColor,
                    active: widget.itemCountSelected > 0,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.isSub &&
                widget.controller != null &&
                (widget.selectController?.multiple ?? false),
            child: Observer(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Checkbox(
                    onChanged: widget.controller?.onClickCheckAll,
                    value: widget.controller?.checkAll ?? false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return widget.activeColor ?? ColorsUtil.blue;
                      }
                      return ColorsUtil.grey600;
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String get _getText => "${widget.itemCountSelected.toString()} "
      "${widget.selectController?.lang.translate} "
      "${widget.itemCount.toString()}";
}
