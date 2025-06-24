import 'package:flutter_emart/consts/consts.dart';

Widget featureButton({required String title,required String icon}) {
  return Row(
        children: [
          Image.asset(icon, width: 40, fit: BoxFit.fill),
          10.widthBox,
          title.text.fontFamily(semibold).color(darkFontGrey).make(),
        ],
      ).box
      .width(200)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .roundedSM
      .outerShadowSm
      .p8
      .make();
}
