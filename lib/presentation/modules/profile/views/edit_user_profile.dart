import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../backend/services/ApiServices.dart';
import '../../../../widgets/back_app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../add property/widgets/custom_text_icon.dart';
import '../controller/image_controller.dart';
import 'package:http/http.dart' as http;
import '../model/profile_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart'; // for basename function


import 'package:mime/mime.dart'; // for lookupMimeType

class EditUserProfile extends StatefulWidget {
  final ProfileModel profileModel;
  EditUserProfile({super.key, required this.profileModel});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  ProfileModel profileModel = ProfileModel();
  bool circular = false;

  var image = "";
  var fullName = "";
  var email = "";
  var phone = "";
  var monthlyIncome = "";
  var permanentAddress = "";
  var presentAddress = "";
  var dateOfBirthDay ="";

  bool isReady = false;

  featchProfile() async {
    bool isReady = true;
    ApiServices().getData("/user").then((value) => {

      setState(() {
        profileModel = value!;
        bool isReady = false;
        image = profileModel.image.toString();
        fullName = profileModel.fullName.toString();
        email = profileModel.email.toString();
        phone = profileModel.phone.toString();
        monthlyIncome = profileModel.monthlyIncome.toString();
        permanentAddress = profileModel.permanentAddress.toString();
        presentAddress = profileModel.presentAddress.toString();
        dateOfBirthDay = profileModel.dateOfBirthday.toString();


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
    featchProfile();

    super.initState();
  }


  //final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImageController());



    final _formKey = GlobalKey<FormState>();

    // Customer Variable Controller
    final  phoneController = TextEditingController(text: phone.toString());
    final emailController = TextEditingController(text: email.toString());
    final nameController = TextEditingController(text: fullName.toString());
    final dateOfBirthController = TextEditingController(text: dateOfBirthDay != "null"? dateOfBirthDay:"");
    final monthly_incomeController = TextEditingController(text: monthlyIncome!=null ?monthlyIncome.toString():"");
    final permanent_addreessController = TextEditingController(text: permanentAddress!=null ?permanentAddress.toString():"");
    final present_addressController = TextEditingController(text: presentAddress!= null?presentAddress.toString():"");







    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(onPressed: (){
          Get.back();

        }, icon: Icon(Icons.arrow_back)),),//Backappbar(title: 'Edit Profile'),
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
                            image: /*image != null
                                ? DecorationImage(
                                image: NetworkImage(image.toString()),fit: BoxFit.cover

                            )
                                : */_imageFile?.path.toString() != null?  DecorationImage(image:FileImage(File(_imageFile!.path)), fit: BoxFit.cover,):  DecorationImage(image:NetworkImage(image.toString()), fit: BoxFit.cover,)
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
                CustomTextIcon(text: "Date of Birth"),
                Textfield1(
                  controller: dateOfBirthController,
                  hintText: 'Date of Birth (Year-Month-Date)',
                  inputype: TextInputType.number,
                  suffixicon: Icons.date_range,
                ),


                CustomTextIcon(text: "Monthly Income"),
                Textfield1(
                  controller: monthly_incomeController,
                  hintText: 'Enter your monthly income',
                  inputype: TextInputType.number,
                  suffixicon: Icons.monetization_on,
                ),

                CustomTextIcon(text: "Permanent Address"),
                Textfield1(
                  controller: permanent_addreessController,
                  hintText: 'Enter your permanent address',
                  suffixicon: Icons.location_on,
                ),

                CustomTextIcon(text: "Present Address"),
                Textfield1(
                  controller: present_addressController,
                  hintText: 'Enter your present address',
                  suffixicon: Icons.location_on,
                ),
                const SizedBox(height: 100.0),
              ],
            )),),),



      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: CustomButton(
          text: 'UPDATE',
          onTap: () async {
            debugPrint("trapped");
            var user= {
              "user":{
                "phone": phoneController.text,
                "email": emailController.text,
                "full_name": nameController.text
              },
              "profile": {
                "date_of_birthday": dateOfBirthController.text,
                "monthly_income": monthly_incomeController.text,
                "permanent_address": permanent_addreessController.text,
                "present_address": present_addressController.text,

                
              }
            };
            var response = await ApiServices().put("/user/and/profile/update", user);
            if(response == null)return;


             if(_imageFile?.path != null){

                var imageResponse = await ApiServices().patchImage("/user/and/profile/update/image", _imageFile!.path);

              }




            debugPrint("Successful");
            Fluttertoast.showToast(msg: 'Profile Updated');
            featchProfile();
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


