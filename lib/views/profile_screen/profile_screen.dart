import 'dart:io';

import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/controller/auth_controller.dart';
import 'package:flutter_emart/controller/profile_controller.dart';
import 'package:flutter_emart/services/firestore_services.dart';
import 'package:flutter_emart/views/auth_screen/login_screen.dart';
import 'package:flutter_emart/views/home_screens/home.dart';
import 'package:flutter_emart/views/profile_screen/detail_cart.dart';
import 'package:flutter_emart/views/profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FireStoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs[0];
                  return SafeArea(
                    child: Column(
                      children: [
                        // Edit Profile Button.
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.edit, color: whiteColor).onTap(
                              () {
                                controller.nameController.text = data['name'];
                                // controller.oldPassController.text =
                                //     data['password'];
                                Get.to(() => EditProfileScreen(data: data));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              data['imageUrl'] == '' &&
                                      controller.profileImgPath.isEmpty
                                  ? Image.asset(
                                          imgProfile2,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ).box.roundedFull
                                        .clip(Clip.antiAlias)
                                        .make()
                                  : data['imageUrl'] != '' &&
                                        controller.profileImgPath.isEmpty
                                  ? Image.network(
                                          data['imageUrl'],
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ).box.roundedFull
                                        .clip(Clip.antiAlias)
                                        .make()
                                  : Image.file(
                                          File(controller.profileImgPath.value),
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ).box.roundedFull
                                        .clip(Clip.antiAlias)
                                        .make(),
                              10.widthBox,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}".text.white
                                        .fontFamily(semibold)
                                        .make(),
                                    "${data['email']}".text.white.make(),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: whiteColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  await Get.put(
                                    AuthController(),
                                  ).signOutMethod(context: context);
                                  Get.offAll(() => LoginScreen());
                                },
                                child: logout.text.white
                                    .fontFamily(semibold)
                                    .make(),
                              ),
                            ],
                          ),
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                              context: context,
                              count: "${data['cart_count']}",
                              title: "In Your Cart",
                            ),
                            detailsCard(
                              context: context,
                              count: "${data['wishlist_count']}",
                              title: "In Your Wishlist",
                            ),
                            detailsCard(
                              context: context,
                              count: "${data['order_count']}",
                              title: "In Your orders",
                            ),
                          ],
                        ),

                        ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.asset(
                                    profileButtonIcons[index],
                                    width: 22,
                                  ),
                                  title: profileButtonList[index].text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(color: lightGrey, thickness: 1);
                              },
                              itemCount: profileButtonList.length,
                            ).box.white.rounded
                            .padding(EdgeInsets.symmetric(horizontal: 16))
                            .margin(EdgeInsetsGeometry.all(12))
                            .shadowSm
                            .make()
                            .box
                            .color(redColor)
                            .make(),
                      ],
                    ),
                  );
                }
              },
        ),
      ),
    );
  }
}
