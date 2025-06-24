import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/widget_common/all_paddings.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),

              10.heightBox,
              "Join the $appName".text.white.size(18).fontFamily(bold).make(),
              15.heightBox,
              Column(
                    children: [
                      customTextField(hint: nameHint, title: name),
                      customTextField(hint: emailHint, title: email),
                      customTextField(hint: passwordHint, title: password),
                      customTextField(
                        hint: passwordHint,
                        title: retypePassword,
                      ),
                      5.heightBox,
                      Align(
                        alignment: Alignment.centerRight,
                        child: forgetPass.text.make(),
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          Checkbox(
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {

                              });
                              isCheck = newValue;
                            },
                            checkColor: redColor,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.heightBox,
                      outButton(
                        onPress: () {},
                        color:isCheck==true? redColor:lightGrey,
                        textColor: whiteColor,
                        title: signup,
                      ).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: alreadyHaveAccount,
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: " $login",
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              ),
                            ),
                          ],
                        ),
                      ).onTap((){Get.back();}),
                    ],
                  ).box
                  .padding(EdgeInsets.all(8.0))
                  .white
                  .withRounded(value: 10)
                  .width(context.screenWidth - 15)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
