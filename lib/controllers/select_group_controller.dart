import 'package:group_select/components/group_select.dart';
import 'package:group_select/controllers/group_select/group_select_controller.dart';

/// This class simplifies access to select
/// controller resources
class SelectGroupController<T> {
  SelectGroupController({
    this.lang = LangBadge.enUS,
    this.multiple = true,
  }) {
    _controller = SelectController<T>(
      lang: lang,
      multiple: multiple,
    );
  }

  /// Language badge of item
  final LangBadge lang;

  /// Enable select multiple choice
  final bool multiple;

  /// Store controller of component
  late SelectController<T> _controller;

  /// Recover store controller of component
  get selectCtrl => _controller;

  /// Reset all values selected
  void resetValues() {
    _controller.resetValues();
  }

  /// Recover value selected. If multiple enable the value is a [List<T>], else
  /// return a single value [T]
  get value {
    if (multiple) return _controller.getValues;
    return _controller.getValue;
  }
}
