import 'package:flutter_emart/consts/consts.dart';

Widget outButton({
  required VoidCallback onPress,
  required Color color,
  required Color textColor,
  required String title,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: onPress,
    child: title.text.white.color(textColor).fontFamily(bold).make(),
  );
}
