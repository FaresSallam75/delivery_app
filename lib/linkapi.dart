class AppLink {
  //const String linkServerName = "http://10.0.2.2/course_php";
  //const String linkServerName = "localhost/ecommerce";
  //static const String server = "https://faressallam.online/ecommerce";
  static const String server = "http://10.0.2.2/ecommerce";
  static const String test = "$server/test.php";

  // images ========================
  static const String imageStatic = "$server/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String imageDelivery = "$imageStatic/deliveryimage";

  // =============== Auth ============
  static const String signup = "$server/delivery/auth/signup.php";
  static const String login = "$server/delivery/auth/login.php";
  static const String verifyCodeSignUp = "$server/delivery/auth/verifycode.php";
  static const String resendCode = "$server/delivery/auth/resend.php";
  static const String viewDelivery = "$server/delivery/auth/viewdelivery.php";
  static const String getNotifyVerifyCodeData = "$server/delivery/auth/sendnotify.php";

  // Forget Password
  static const String checkEmail =
      "$server/delivery/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/delivery/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/delivery/forgetpassword/resetpassword.php";

  //checkout || Orders
  static const String viewPendingOrders = "$server/delivery/orders/pending.php";
  static const String viewArchieveOrders =
      "$server/delivery/orders/archieve.php";
  static const String viewDetailsOrders = "$server/delivery/orders/details.php";
  static const String viewAcceptedOrders =
      "$server/delivery/orders/accepted.php";
  static const String approveOrders = "$server/delivery/orders/approve.php";
  static const String doneOrders = "$server/delivery/orders/done.php";

  // Notifications
  static const String notificationsData =
      "$server/delivery/notifications/notifications.php";
}
