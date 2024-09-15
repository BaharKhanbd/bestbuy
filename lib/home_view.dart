import 'package:bestbuy/controller/app_provider.dart';
import 'package:bestbuy/view/account_view.dart';
import 'package:bestbuy/view/cart_view.dart';
import 'package:bestbuy/view/favourite_view.dart';
import 'package:bestbuy/view/home.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home_view Rebuilding");
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    final List<Widget> pages = [
      const Home(),
      const FavouriteView(),
      const CartView(),
      const AccountView(),
    ];

    return Scaffold(
      body: pages[appProvider.navigationIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.green.shade700,
        color: Colors.green.shade700,
        items: <Widget>[
          Icon(Icons.home, size: 30.sp, color: Colors.white),
          badges.Badge(
            badgeContent: Center(
              child: Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
            child: Icon(Icons.favorite, size: 26.sp, color: Colors.white),
          ),
          badges.Badge(
            badgeContent: Center(
              child: Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
            child: Icon(Icons.shopping_cart, size: 26.sp, color: Colors.white),
          ),
          Icon(Icons.person, size: 30.sp, color: Colors.white),
        ],
        onTap: (index) {
          // Update the current index using provider
          appProvider.setNavigationIndex(index);
        },
      ),
    );
  }
}
