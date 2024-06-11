import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/middlware/mymiddleware.dart';
import 'package:delivery_app/view/screen/auth/add_delivery_image.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:delivery_app/view/screen/auth/login.dart';
import 'package:delivery_app/view/screen/auth/signup.dart';
import 'package:delivery_app/view/screen/auth/success_signup.dart';
import 'package:delivery_app/view/screen/auth/verifycodesignup.dart';
import 'package:delivery_app/view/screen/homepage/homepagescreen.dart';
import 'package:delivery_app/view/screen/language.dart';
import 'package:delivery_app/view/screen/onboarding.dart';
import 'package:delivery_app/view/screen/orders/accepted.dart';
import 'package:delivery_app/view/screen/orders/archieve_orders.dart';
import 'package:delivery_app/view/screen/orders/tracing_order.dart';
import 'package:delivery_app/view/screen/setting/settingpage.dart';
import 'package:get/get.dart';
import 'view/screen/orders/details.dart';
import 'view/screen/orders/pending_orders.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
 /*    GetPage(
    name: "/",
    page: () => const Cart(),
  ),  */
               
  GetPage(
    name: "/",
    page: () => const Language(),
     middlewares: [
      MyMiddleWare(),
    ], 
  ),
  GetPage(
    name: AppRotes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRotes.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRotes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRotes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRotes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRotes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRotes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRotes.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRotes.onBoarding,
    page: () => const OnBoarding(),
  ),

  //home page
  GetPage(
    name: AppRotes.homePage,
    page: () => const HomePageScreen(),
  ),
 

  GetPage(
    name: AppRotes.pendingOrders,
    page: () => const PendingOrders(),
  ),
  GetPage(
    name: AppRotes.acceptedOrders,
    page: () => const AcceptedOrders(),
  ),
  GetPage(
    name: AppRotes.archivedOrders,
    page: () => const ArchivedOrders(),
  ),
  GetPage(
    name: AppRotes.ordersDetails,
    page: () => const OrdersDetails(),
  ),
  GetPage(
    name: AppRotes.ordersTracing,
    page: () => const OrdersTracing(),
  ),
  GetPage(
    name: AppRotes.addDeliveryImage,
    page: () => const AddDeliveryImage(),
  ),
  GetPage(
    name: AppRotes.settingPage,
    page: () => const SettingPage(),
  ),
  /* GetPage(
    name: AppRotes.ordersArchieved,
    page: () => const ArchievedOrders(),
  ), */
];
