import 'package:flutter_emart/consts/consts.dart';


Widget appLogoWidget(){
  return Image.asset(icAppLogo).box.white.size(77, 77).padding(EdgeInsets.all(8)).rounded.make();
}

extension ColumnPadding on double{
  EdgeInsets get ColPad => EdgeInsets.all(this);
}

extension EdgeInsetsExtension on num {
  EdgeInsets onlyLTRB({double? left, double? right, double? top, double? bottom}) {
    return EdgeInsets.only(
      left: left ?? 0,
      right: right ?? 0,
      top: top ?? 0,
      bottom: bottom ?? 0,
    );
  }
}

