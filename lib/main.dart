import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/cart.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/product.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/wishlist.dart';
import 'package:flutter_shop_cpt21/screens/bottom_nav_screen.dart';
import 'package:flutter_shop_cpt21/screens/cart_screen.dart';
import 'package:flutter_shop_cpt21/screens/feeds_screen.dart';
import 'package:flutter_shop_cpt21/screens/home_screen.dart';
import 'package:flutter_shop_cpt21/screens/inner_screens/brands_nav_rail.dart';
import 'package:flutter_shop_cpt21/screens/inner_screens/categories_feed_screen.dart';
import 'package:flutter_shop_cpt21/screens/inner_screens/product_details_screen.dart';
import 'package:flutter_shop_cpt21/screens/search_screen.dart';
import 'package:flutter_shop_cpt21/screens/user_scren.dart';
import 'package:flutter_shop_cpt21/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'models & providers/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ThemeNotifier()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => WishlistProvider()),
      ],
      child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyAppTheme.myThemes(notifier.isDark, context),
          home: const BottomNavScreen(),
          routes: {
            BottomNavScreen.routeName: (ctx) => const BottomNavScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            FeedsScreen.routeName: (ctx) => FeedsScreen(),
            SearchScreen.routeName: (ctx) => SearchScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            UserScreen.routeName: (ctx) => const UserScreen(),
            BrandsNavRailScreen.routeName: (ctx) => const BrandsNavRailScreen(),
            WishlistScreen.routeName: (ctx) => const WishlistScreen(),
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),
            CategoriesFeedScreen.routeName: (ctx) =>
                const CategoriesFeedScreen(),
          },
        );
      }),
    );
  }
}
