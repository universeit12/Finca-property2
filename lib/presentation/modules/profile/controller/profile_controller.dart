// controllers/profile_controller.dart

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../backend/services/ApiServices.dart';

import '../model/company_profile_model.dart';
import '../model/profile_model.dart';



class ProfileController extends GetxController {
  var profileModel = ProfileModel().obs;
  var companyProfileModel = CompanyProfileModel().obs;
  var isReady = false.obs;
  var image = ''.obs;
  var fullName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;

  final ApiServices apiServices = ApiServices();

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
    fetchCompanyProfile();
  }

  void fetchProfile() async {
    try {
      isReady(true);
      var profileData = await apiServices.getData("/user");
      if (profileData != null) {
        profileModel.value = profileData;
        image.value = profileModel.value.image.toString();
        fullName.value = profileModel.value.fullName.toString();
        email.value = profileModel.value.email.toString();
        phone.value = profileModel.value.phone.toString();
      }
    } catch (e) {
      debugPrint("Error fetching profile: $e");
    } finally {
      isReady(false);
    }
  }

  void fetchCompanyProfile() async {
    try {
      isReady(true);
      var companyData = await apiServices.getCompanyData("/user");
      if (companyData != null) {
        companyProfileModel.value = companyData;
      }
    } catch (e) {
      debugPrint("Error fetching company profile: $e");
    } finally {
      isReady(false);
    }
  }
}
