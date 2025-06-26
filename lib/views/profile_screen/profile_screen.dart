import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/views/profile_screen/detail_cart.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Edit Profile Button.////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.edit, color: whiteColor).onTap(() {
                    print("DONE");
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Dummy User".text.white.fontFamily(semibold).make(),
                          "customer@gmail.com".text.white.make(),
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
                      onPressed: () {},
                      child: logout.text.white.fontFamily(semibold).make(),
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
                    count: "0.0",
                    title: "In Your Cart",
                  ),
                  detailsCard(
                    context: context,
                    count: "22",
                    title: "In Your Wishlist",
                  ),
                  detailsCard(
                    context: context,
                    count: "67",
                    title: "In Your orders",
                  ),
                ],
              ),


              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(profileButtonIcons[index],width: 22,),
                    title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: lightGrey, thickness: 1);
                },
                itemCount: profileButtonList.length,
              ).box.white.rounded.padding(EdgeInsets.symmetric(horizontal: 16)).margin(EdgeInsetsGeometry.all(12)).shadowSm.make().box.color(redColor).make(),
            ],
          ),
        ),
      ),
    );
  }
}
