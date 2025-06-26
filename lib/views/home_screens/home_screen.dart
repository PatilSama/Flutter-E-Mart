import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/views/home_screens/components/featured_button.dart';
import 'package:flutter_emart/widget_common/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnything,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(sliderList[index], fit: BoxFit.fill)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8.0))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButtons(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todayDeal : flashSale,
                          onPress: () {
                            print("DONE");
                          },
                        ),
                      ),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                              secondSliderList[index],
                              fit: BoxFit.fill,
                            ).box.rounded
                            .margin(EdgeInsets.all(8.0))
                            .clip(Clip.antiAlias)
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => homeButtons(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 3.5,
                          icon: index == 0
                              ? icTopCategories
                              : index == 1
                              ? icBrands
                              : icTopSeller,
                          title: index == 0
                              ? topCategories
                              : index == 1
                              ? brand
                              : topSellers,
                          onPress: () {},
                        ),
                      ),
                    ),
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .size(18)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              featureButton(
                                title: featuredTitles1[index],
                                icon: featuredImages1[index],
                              ),
                              10.heightBox,
                              featureButton(
                                title: featuredTitles2[index],
                                icon: featuredImages2[index],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    20.heightBox,
                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                6,
                                (index) =>
                                    Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              imgP1,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            10.heightBox,
                                            "Laptop".text
                                                .fontFamily(semibold)
                                                .color(darkFontGrey)
                                                .make(),
                                            10.heightBox,
                                            "\$600".text
                                                .color(redColor)
                                                .fontFamily(bold)
                                                .size(16)
                                                .make(),
                                          ],
                                        ).box.white
                                        .padding(EdgeInsets.all(8.0))
                                        .margin(
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                        )
                                        .rounded
                                        .make(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                              secondSliderList[index],
                              fit: BoxFit.fill,
                            ).box
                            .margin(EdgeInsets.symmetric(horizontal: 5))
                            .rounded
                            .clip(Clip.antiAlias)
                            .make();
                      },
                    ),
                    20.heightBox,
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300
                        // mainAxisExtent: context.screenWidth*0.75,
                      ),
                      itemBuilder: (context1, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Image.asset(
                              imgP5,
                              width: 200,
                              height: 200,
                              // width: context.screenWidth * 0.5,
                              // height: context.screenHeight * 0.25,
                              fit: BoxFit.fill,
                            ).box.red600.make(),
                            Spacer(),
                            "Laptop".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                            10.heightBox,
                          ],
                        ).box.white.roundedSM.margin(EdgeInsets.symmetric(horizontal: 4)).p12.make();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
