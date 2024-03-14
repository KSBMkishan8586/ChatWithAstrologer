/*
* @Author : Kishan kumar
* Email : ksbmkishan123@gmail.com
* Function API end points
* Created Date : 11 March 2024
* */

class ApiConstants{
  static String baseUrl = "https://chatwithastro.co.in/";
  static String userLogin = "${baseUrl}api/user_web_api/login?";
  static String otpVerification = "${baseUrl}api/user_web_api/verification_otp?";
  static String updateAccount = '${baseUrl}api/user_web_api/upload_customer_pic';
  static String getBanner = '${baseUrl}user/get_banner.php';
  static String getAstroList = '${baseUrl}api/api/astrolist1';
}