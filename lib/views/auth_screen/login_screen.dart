import 'package:flutter/foundation.dart';
import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/consts/lists.dart';
import 'package:flutter_emart/controller/auth_controller.dart';
import 'package:flutter_emart/views/auth_screen/signup_screen.dart';
import 'package:flutter_emart/views/home_screens/home.dart';

import 'package:flutter_emart/widget_common/all_paddings.dart';
import 'package:flutter_emart/widget_common/applogo_widget.dart';
import 'package:flutter_emart/widget_common/bg_widget.dart';
import 'package:flutter_emart/widget_common/custom_textField.dart';
import 'package:flutter_emart/widget_common/our_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Log In to $appName".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,

              Obx(
                () =>
                    Column(
                          children: [
                            customTextField(
                              hint: emailHint,
                              title: email,
                              controller: controller.emailController,
                            ),

                            customTextField(
                              hint: passwordHint,
                              title: password,
                              controller: controller.passwordController,
                            ),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () async {
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                        if (value != null) {
                                          if (context.mounted) {
                                            VxToast.show(
                                              context,
                                              msg: loggedin,
                                            );
                                            Get.offAll(() => Home());
                                          }
                                        }
                                      });
                                },
                                child: forgetPass.text.make(),
                              ),
                            ),
                            5.heightBox,
                            controller.isLoading.value
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                      redColor,
                                    ),
                                  )
                                : outButton(
                                    color: redColor,
                                    title: login,
                                    textColor: whiteColor,
                                    onPress: () async{
                                      controller.isloading(true);
                                      await controller.loginMethod(context:context).then((value){
                                        if(value!=null){
                                          VxToast.show(context, msg: loggedin);
                                          Get.to(() => Home());
                                        }else{
                                          controller.isloading(false);
                                        }
                                      });
                                    },
                                  ).box.width(context.screenWidth - 50).make(),
                            5.heightBox,
                            createNewAccount.text.color(fontGrey).make(),
                            5.heightBox,
                            outButton(
                              onPress: () {
                                Get.to(
                                  () => SignupScreen(),
                                  transition: Transition.leftToRight,
                                );
                              },
                              color: lightGolden,
                              textColor: redColor,
                              title: signup,
                            ).box.width(context.screenWidth - 50).make(),
                            10.heightBox,
                            loginWith.text.color(fontGrey).make(),
                            5.heightBox,

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(socialIconList.length, (
                                index,
                              ) {
                                return allPadding(
                                  child: CircleAvatar(
                                    backgroundColor: lightGrey,
                                    radius: 25,
                                    child: Image.asset(
                                      socialIconList[index],
                                      width: 30,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ).box.white.rounded
                        .padding(EdgeInsets.all(16))
                        .width(context.screenWidth - 10)
                        .shadowSm
                        .make(),
              ),

              // SizedBox(height:100,width:100,child: Column(children: [],).box.withRoundedOnly(topLeft: 50, bottomLeft: 50).white.make())
            ],
          ),
        ),
      ),
    );
  }
}
