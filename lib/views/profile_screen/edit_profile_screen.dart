import 'dart:io';

import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () =>
              Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      controller.profileImgPath.isEmpty
                          ? Image.asset(
                              imgProfile2,
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.file(
                              File(controller.profileImgPath.value),
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.heightBox,
                      outButton(
                        onPress: () {
                          controller.changeImage(context);
                        },
                        color: redColor,
                        textColor: textfieldGrey,
                        title: "Change",
                      ),
                      Divider(),
                      20.heightBox,
                      customTextField(
                        hint: nameHint,
                        title: name,
                        controller: controller.nameController,
                      ),
                      10.heightBox,
                      customTextField(
                        controller: controller.oldPassController,
                        hint: passwordHint,
                        title: oldPass,
                        isPass: true,
                      ),
                      10.heightBox,
                      customTextField(
                        controller: controller.newPassController,
                        hint: passwordHint,
                        title: newPass,
                        isPass: true,
                      ),
                      20.heightBox,
                      controller.isloading.value
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : outButton(
                              onPress: () async {
                                controller.isloading(true);
                                if (controller
                                    .profileImgPath
                                    .value
                                    .isNotEmpty) {
                                  await controller.uploadProfileImage();
                                } else {
                                  controller.profileImageLink =
                                      data['imageUrl'];
                                }

                                // if Old Password Matches database.
                                if (data['password'] ==
                                    controller.oldPassController.text) {
                                  await controller.changeAuthPassword(
                                    email: data['email'],
                                    password: controller.oldPassController.text,
                                    newPassword:
                                        controller.newPassController.text,
                                  );

                                  await controller.updateProfile(
                                    imageUrl: controller.profileImageLink,
                                    name: controller.nameController.text,
                                    password: controller.oldPassController.text,
                                  );
                                  VxToast.show(context, msg: "Updated");
                                } else {
                                  VxToast.show(
                                    context,
                                    msg: "Wrong Old Password.",
                                  );
                                  controller.isloading(false);
                                }
                              },
                              color: redColor,
                              textColor: textfieldGrey,
                              title: "Save",
                            ).box.width(context.screenWidth).make(),
                    ],
                  ).box.shadowSm.white.rounded
                  .padding(EdgeInsets.all(16))
                  .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
                  .make(),
        ),
      ),
    );
  }
}
