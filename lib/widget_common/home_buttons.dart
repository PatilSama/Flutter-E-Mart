import 'package:flutter_emart/consts/consts.dart';

Widget homeButtons({double width=0.0,double height=0.0,String? title,VoidCallback? onPress,String? icon}) {
  return GestureDetector(onTap:()=>onPress,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon!, width: 26),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
    ).box.white.size(width, height).rounded.shadowSm.make(),
  );
}
