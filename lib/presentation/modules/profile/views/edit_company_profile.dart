import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universe_it_project/presentation/modules/profile/model/company_profile_model.dart';
import '../../../../backend/services/ApiServices.dart';
import '../../../../widgets/back_app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../add property/widgets/custom_text_icon.dart';
import '../controller/image_controller.dart';

import '../model/profile_model.dart';

class EditCompanyProfile extends StatefulWidget {
  final CompanyProfileModel profileModel;
  EditCompanyProfile({super.key, required this.profileModel});

  @override
  State<EditCompanyProfile> createState() => _EditCompanyProfileState();
}

class _EditCompanyProfileState extends State<EditCompanyProfile> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  CompanyProfileModel companyProfileModel = CompanyProfileModel();
  var image = "";
  var phone ="";
  var email ="";
  var name ="";
  var phone2 ="";
  var companyName ="";
  var designation ="";
  var officeAddress ="";



  featchCompanyProfile() async {
    bool isReady = true;
    ApiServices().getCompanyData("/user").then((value) => {

      setState(() {
        companyProfileModel = value! ;
        bool isReady = false;
        image = companyProfileModel.image.toString();
         phone = companyProfileModel.phone.toString();
         email = companyProfileModel.email.toString();
         name = companyProfileModel.fullName.toString();
         phone2 = companyProfileModel.phone2.toString();
         companyName = companyProfileModel.companyName.toString();
         designation = companyProfileModel.designation.toString();
         officeAddress = companyProfileModel.officeAddress.toString();

      })





    }).onError((error, stackTrace) => {
      debugPrint(error.toString()),
      setState(() {
        bool isReady = false;
      })
    });


  }

  @override
  void initState() {
    featchCompanyProfile();
    super.initState();
  }
  //final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImageController());

    // Customer Variable Controller
    final  phoneController = TextEditingController(text:phone.toString());
    final emailController = TextEditingController(text: email.toString());
    final nameController = TextEditingController(text: name.toString());
    final phone2Controller = TextEditingController(text: phone2!= null ?phone2.toString():"");
    final companyNameController = TextEditingController(text: companyName!= null ?companyName.toString():"");
    final designationController = TextEditingController(text: designation!= null ?designation.toString():"");
    final officeAddressController = TextEditingController(text: officeAddress!= null?officeAddress.toString():"");


    return Scaffold(
      appBar: Backappbar(title: 'Edit Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image
                Align(
                  alignment: Alignment.center,
                  child:  GestureDetector(
                      onTap: () {

                        showModalBottomSheet(
                          context: context,
                          builder:(context) => bottomSheet(context),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(
                                  color: Colors.blueAccent, width: 3),
                              shape: BoxShape.circle,
                              image: _imageFile?.path.toString() != null?  DecorationImage(image:FileImage(File(_imageFile!.path)), fit: BoxFit.cover,):  DecorationImage(image:NetworkImage(image.toString()), fit: BoxFit.cover,)
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.camera_alt,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),

                ),
                const SizedBox(height: 20),
                CustomTextIcon(text: "Phone"),
                Textfield1(
                  controller: phoneController,
                  hintText: 'Enter your phone number',
                  inputype: TextInputType.phone,
                  suffixicon: Icons.phone,
                ),
                CustomTextIcon(text: "Email"),
                Textfield1(
                  controller: emailController,
                  hintText: 'Enter your email',
                  inputype: TextInputType.emailAddress,
                  suffixicon: Icons.email,
                ),

                CustomTextIcon(text: "Name"),
                Textfield1(
                  controller: nameController,
                  hintText: 'Enter your full name',
                  suffixicon: Icons.person,
                ),

                CustomTextIcon(text: "Phone 2"),
                Textfield1(
                  controller: phone2Controller,
                  hintText: 'Enter your phone number 2',
                  suffixicon: Icons.call,
                ),

                CustomTextIcon(text: "Company Name"),
                Textfield1(
                  controller:companyNameController,
                  hintText: 'Enter your company Name',
                  inputype: TextInputType.name,
                  suffixicon: Iconsax.house,
                ),

                CustomTextIcon(text: "Designation"),
                Textfield1(
                  controller: designationController,
                  hintText: 'Enter your designation',
                  suffixicon: Icons.location_on,
                ),

                CustomTextIcon(text: "Office Address"),
                Textfield1(
                  controller: officeAddressController,
                  hintText: 'Enter your office address',
                  suffixicon: Iconsax.home_wifi,
                ),
                const SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: CustomButton(
          text: 'UPDATE',
          onTap: () async {
            var user= {
              "user":{
                "phone": phoneController.text,
                "email": emailController.text,
                "full_name": nameController.text
              },
              "profile": {
                "company_name": companyNameController.text,
                "designation": designationController.text,
                "phone2": phone2Controller.text,
                "office_address": officeAddressController.text
              }
            };
            var response = await ApiServices().put("/user/and/profile/update", user);
            if(response == null)return;
            if(_imageFile?.path != null){

              var imageResponse = await ApiServices().patchImage("/user/and/profile/update/image", _imageFile!.path);

            }
            debugPrint("Successful");
            Fluttertoast.showToast(msg: 'Profile Updated');
            featchCompanyProfile();
          },
        ),
      ),
    );
  }

  Widget bottomSheet(context){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: <Widget>[
          Text("Chose a Profile photo",style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(onPressed: (){
                takePhoto(ImageSource.camera);
              }, icon: Icon(Icons.camera), label:Text("Camera")),
              TextButton.icon(onPressed: (){
                takePhoto(ImageSource.gallery);
              }, icon: Icon(Icons.image), label:Text("Gallery")),

            ],),
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile ;
    });
  }

}
