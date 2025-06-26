import 'package:flutter_emart/consts/consts.dart';

Widget detailsCard({
  required BuildContext context,
  required String count,
  required String title,
}) {
  return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          count.text.fontFamily(bold).color(darkFontGrey).make(),
          5.heightBox,
          title.text.color(darkFontGrey).make(),
        ],
      ).box.white.rounded
      .width(context.screenWidth / 3.4)
      .height(context.screenWidth * 0.20)
      .p4
      .make();
}
