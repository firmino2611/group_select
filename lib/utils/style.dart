import 'package:flutter/material.dart';
import 'package:group_select/utils/colors_util.dart';

class Style {
  /// Group Header
  static BoxDecoration boxDecorationHeaderLight(bool isSub) {
    return BoxDecoration(
      color: isSub ? ColorsUtil.grey100 : ColorsUtil.white,
      border: const Border(
        bottom: BorderSide(
          color: ColorsUtil.grey200,
        ),
      ),
    );
  }

  static TextStyle textStyleHeaderLight() {
    return const TextStyle(
      fontSize: 17,
      color: ColorsUtil.grey700,
      overflow: TextOverflow.ellipsis,
    );
  }

  static BoxDecoration boxDecorationHeaderDark(bool isSub) {
    return BoxDecoration(
      color: isSub ? ColorsUtil.grey700 : ColorsUtil.black,
      border: const Border(
        bottom: BorderSide(
          color: ColorsUtil.grey600,
        ),
      ),
    );
  }

  static TextStyle textStyleHeaderDark() {
    return const TextStyle(
      fontSize: 17,
      color: ColorsUtil.white,
      overflow: TextOverflow.ellipsis,
    );
  }
}
