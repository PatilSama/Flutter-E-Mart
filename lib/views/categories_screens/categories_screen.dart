import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/controller/product_controller.dart';
import 'package:flutter_emart/views/categories_screens/category_details.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
          iconTheme: IconThemeData(color: whiteColor),
        ),
        body: Container(
          padding: EdgeInsets.all(12),

          child: GridView.builder(

            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Image.asset(
                          categoryImages[index],
                          height: 120,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      10.heightBox,
                      categoriesList[index].text
                          .color(darkFontGrey)
                          .align(TextAlign.center)
                          .make(),
                    ],
                  ).box.white.outerShadowSm.roundedSM
                  .clip(Clip.antiAlias)
                  .p12
                  .make().onTap((){
                    controller.getSubCategories(categoriesList[index]);
                    Get.to(()=>CategoryDetails(title: categoriesList[index]));
              });
            },
          ).box.rounded.make(),
        ),
      ),
    );
  }
}
