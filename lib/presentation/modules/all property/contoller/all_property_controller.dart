

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/backend/services/ApiServices.dart';
import 'package:universe_it_project/presentation/modules/all%20property/model/property_model.dart';
import 'package:universe_it_project/presentation/modules/all%20property/model/web_ingo_model.dart';

import 'package:url_launcher/url_launcher.dart';


import '../model/all_property_model.dart';

class AllPropertyController extends GetxController {
  ///Images Controller
  var imageList = [
    'assets/images/flat4.jpg',
    'assets/images/flat.jpg',
    'assets/images/flat4.jpg',
  ].obs;

  ///Make a Caller Function
  void makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Fluttertoast.showToast(msg: 'Something Wrong');
    }
  }


  // All Property get
 // RxList  propertyList= [].obs;


  /*Future<RxList> getData()async{

    final response = await http.get(Uri.parse("${ApiServices.baseURL}property"));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String, dynamic> index in data){
        propertyList.add(ProfileModel.fromJson(index));
      }
      return propertyList;
    }
    else{
      return propertyList;
    }


  }*/


  var isLoading = true.obs;
  var isReady = false.obs;
  var productList = <FincaPropertyModel>[].obs;
  var webIngoList = WebIngoModel().obs;



  final ApiServices _apiService = ApiServices();

  @override
  void onInit() {
    fetchProducts();
    fetchWebingo();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await _apiService.fetchProducts();
      productList.assignAll(products);
    } finally {
      isLoading(false);
    }
  }

  void fetchWebingo() async {
    try {
      isReady(true);
      var WebIngoData = await _apiService.getDataWebIngo("/web-info");
      if (WebIngoData != null) {
        webIngoList.value = WebIngoData ;

      }
    } catch (e) {
      debugPrint("Error fetching profile: $e");
    } finally {
      isReady(false);
    }
  }


  void fetchProductDetails(String slug) async {
    try {
      isLoading(true);
      var productDetails = await _apiService.fetchProductDetails(slug);
      //selectedProduct.value = productDetails;
    } finally {
      isLoading(false);
    }
  }

  // Variables
  final userName = TextEditingController();
  final description = TextEditingController();
  final feedbackFormKey = GlobalKey<FormState>();

  // Feedback Post
 Future<void> feedBackPost(PropertyModel property)async{
    try{
      var user = {
        "name": userName.text,
        "property":property.property?.id.toString(),
        "description": description.text,

      };
      var response = await ApiServices().post("/feedback-form", user).catchError((err){debugPrint("Unsuccessful");});
      debugPrint(response);
      if(response == null)return;
      debugPrint("Successful");
      Get.snackbar("Successful", "Submitted Successfully");

    }catch(e){
      Get.snackbar("Error", "Something went wrong");

    }
  }






}
