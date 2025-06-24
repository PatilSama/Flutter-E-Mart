import 'package:flutter_emart/consts/consts.dart';

Widget allPadding({Widget? child}) {
  return Padding(padding: EdgeInsets.all(8.0), child: child);
}

Widget onlyPadding({
  double left = 0.0,
  double right = 0.0,
  double top = 0.0,
  double bottom = 0.0,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    ),
  );
}


EdgeInsets appPadMar(double padMar){
  return EdgeInsets.all(padMar);
}