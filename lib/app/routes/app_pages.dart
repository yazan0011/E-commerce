import 'package:e_co/app/modules/signIn/signIn_binding.dart';
import 'package:e_co/app/modules/signIn/signIn_view.dart';
import 'package:e_co/app/modules/signUp/signUp_binding.dart';
import 'package:e_co/app/modules/signUp/signUp_view.dart';
import 'package:e_co/app/modules/wishlist/wishlist_binding.dart';
import 'package:e_co/app/modules/wishlist/wishlist_view.dart';
import 'package:get/get.dart';
import 'package:e_co/app/modules/home/home_view.dart';
import 'package:e_co/app/modules/home/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.detaiLs,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.wishlist,
      page: () => WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
        name: Routes.signIn,
        page: () => SignInView(),
        binding: SignInBinding()),
    GetPage(
        name: Routes.signUp,
        page: () => SignUpView(),
        binding: SignUpBinding()),
  ];
}
