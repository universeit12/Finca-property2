import 'dart:convert';
import 'package:flutter/cupertino.dart';


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universe_it_project/presentation/modules/home/home.dart';

import '../../../../../backend/services/ApiServices.dart';
import '../../../../bottom nav/views/bottom_screen.dart';
import '../../../profile/views/profile_screen.dart';
import '../view/signinpage.dart';


class SignInController extends GetxController {
  // Variables
  final mobileController = TextEditingController();
  final  passwordController = TextEditingController();
  final storage = GetStorage();



  // Customer and Company Login

  customerOrCompanyLogin() async {
    try{
      var user = {
        "password": passwordController.text,
        "phone": mobileController.text,
      };
      var response = await ApiServices().post3("/user/login", user).catchError((err){debugPrint("Unsuccessful");});

      var data = jsonDecode(response);
      storage.write("token", data["token"]);
      storage.write("id", data["user_pk"]);
      if(response == null)return;
      debugPrint("Successful");
      debugPrint(data["token"]);
      Get.off(() =>BottomNavScreen());
      Get.snackbar("Successful", data["status"]);

    }catch(e){
      Get.snackbar("Error", "Something went wrong");

    }

  }

  // Login Function
/*
  loginApi(context) async {
    try {
      var url = "${API.fincaURL}/${API.routeURL}/user/login";
      var data = {
        "phone": mobileController.text.toString(),
        "password": passwordController.text.toString()
      };
      var body = json.encode(data);
      var urlParse = Uri.parse(url);
      var response = await http.post(urlParse, body: body, headers: {
        "Content-Type": "application/json",
        'x-API-Key': "${API.APIKey}"
      });

      if (response.statusCode == 200) {
        var data2 = jsonDecode(response.body);

        Get.to(() => Profile_Screen ());
        Fluttertoast.showToast(
          msg: "Sign in Done",
        );
        await tokenStorage.write(key: "token", value: data2["token"]);

        debugPrint(data2.toString());
        print(data2["token"]);
        Get.snackbar("Token", data2["token"].toString());
      } else {
        Get.snackbar("Error", "Not valid user");
      }
    } catch (e) {
      Get.snackbar("Error", "Some thing went wrong");
    }
  }
*/
  // log out api
  void logOut() async {


    storage.remove("token");
    storage.remove("id");
    Get.offAll(() => Home());

    Get.snackbar("Logout", "Logout Successfully");
  }

}
