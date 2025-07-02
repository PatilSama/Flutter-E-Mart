import 'package:flutter_emart/consts/consts.dart';

Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  bool isPass=false
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text
          .color(redColor)
          .fontFamily(semibold)
          .size(16)
          .make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          ),
        ),
      ),
      10.heightBox
    ],
  );
}
