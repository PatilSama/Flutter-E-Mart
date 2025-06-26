import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/views/categories_screens/item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title.text.fontFamily(bold).white.make(),
          iconTheme: IconThemeData(color: whiteColor),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => "Baby Clothing".text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .size(12)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make(),
                  ),
                ),
              ),
              20.heightBox,
              Expanded(
                child: GridView.builder(
                  itemCount: 8,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Image.asset(imgP3,height: 120,width: 200,),
                      "Laptop".text.make(),
                      10.heightBox,
                      "\$80 price".text.color(redColor).make()
                    ],).box.white.roundedSM.margin(EdgeInsets.symmetric(horizontal: 4)).outerShadowSm.p12.make().onTap((){
                      Get.to(()=>ItemDetails(title: 'golu chaddi',));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
