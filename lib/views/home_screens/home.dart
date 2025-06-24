import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/controller/home_controller.dart';
import 'package:flutter_emart/views/cart_screens/cart_screen.dart';
import 'package:flutter_emart/views/categories_screens/categories_screen.dart';
import 'package:flutter_emart/views/home_screens/home_screen.dart';
import 'package:flutter_emart/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    var navBarItem = [
      BottomNavigationBarItem(
        icon: Image.asset(icHome, width: 26),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icCategories, width: 26),
        label: categories,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icCart, width: 26),
        label: cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icProfile, width: 26),
        label: account,
      ),
    ];

    dynamic navBody = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          items: navBarItem,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
      body: Column(
        children: [
          Obx(() =>
                Expanded(child: navBody[controller.currentNavIndex.value]),
          ),
        ],
      ),
    );
  }
}
