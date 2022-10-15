import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/ad/bindings/ad_binding.dart';
import '../modules/ad/views/ad_view.dart';
import '../modules/changepassword/bindings/changepassword_binding.dart';
import '../modules/changepassword/views/changepassword_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/getpassword/bindings/getpassword_binding.dart';
import '../modules/getpassword/views/getpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my/bindings/my_binding.dart';
import '../modules/my/views/my_view.dart';
import '../modules/play/bindings/play_binding.dart';
import '../modules/play/views/play_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MY;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MY,
      page: () => MyView(),
      binding: MyBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.AD,
      page: () => AdView(),
      binding: AdBinding(),
    ),
    GetPage(
      name: _Paths.PLAY,
      page: () => PlayView(),
      binding: PlayBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () => ChangepasswordView(),
      binding: ChangepasswordBinding(),
    ),
    GetPage(
      name: _Paths.GETPASSWORD,
      page: () => GetpasswordView(),
      binding: GetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
  ];
}
