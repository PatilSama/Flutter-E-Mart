import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/controller/product_controller.dart';
import 'package:flutter_emart/services/firestore_services.dart';
import 'package:flutter_emart/views/categories_screens/item_details.dart';
import 'package:flutter_emart/widget_common/loding_indicator.dart';

class CategoryDetails extends StatelessWidget {
  final String title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title.text
              .fontFamily(bold)
              .white
              .make(),
          iconTheme: IconThemeData(color: whiteColor),
        ),
        body: StreamBuilder(
            stream: FireStoreServices.getProduct(title),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasData){
                var data = snapshot.data!.docs;
                return Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            controller.subcat.length,
                                (index) =>
                                "${controller.subcat[index]}".text
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
                          itemCount: data.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(data[index]['p_imgs'][0], height: 120, width: 200,),
                                5.heightBox,
                                "${data[index]['p_name']}".text.fontFamily(semibold).color(textfieldGrey).make(),
                                10.heightBox,
                                "${data[index]['p_price']}".numCurrency.text.color(redColor).make()
                              ],).box.white.roundedSM
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .outerShadowSm
                                .p12
                                .make()
                                .onTap(() {
                              Get.to(() => ItemDetails(title: "${data[index]['p_name']}",data:data[index]));
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }else if(snapshot.data!.docs.isNotEmpty){
                return Center(child: "No Product Found!".text.color(darkFontGrey).make(),);
              }else{
                return Center(child: loadingIndicator(),);
              }


            }),
      ),
    );
  }
}
