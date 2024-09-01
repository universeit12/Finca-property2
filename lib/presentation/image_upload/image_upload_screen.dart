import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../backend/services/ApiServices.dart';


class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? image;
  final _picker = ImagePicker();
  bool isShowSpinner = false;
  final storage = GetStorage();


  Future getImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    if(pickedFile != null){
      image = File(pickedFile.path);
      setState(() {

      });
    }else{
      print("No image selected");
    }

  }

  Future<void> uploadImage ()async{
    String token = await storage.read("token");
    setState(() {
      isShowSpinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();




    var uri = Uri.parse("https://finca.psdcedu.xyz/api/property/create");
    //https://fakestoreapi.com/products

    var request = http.MultipartRequest("POST", uri);

    request.fields['title'] = "try property 90";
    request.fields['property_name'] = "try property 90";
    request.fields['address'] = "try property 90";
    request.fields['price_type'] = "Fixed";
    request.fields['construction_status'] = "Ready";
    request.fields['facing'] = "try property 90";
    request.fields['furnished'] = "Furnished";
    request.fields['description'] = "Furnishefhgjhhjikhjihn";
    request.fields['handover_date'] = "2024-08-10";
    request.fields['map_location'] = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.420033931431!2d90.42369270845957!3d23.76805258801397!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755bf537d1f2e09%3A0x8fe7a3faf331a140!2sUniverse%20IT%20Institute!5e0!3m2!1sen!2sbd!4v1723118136755!5m2!1sen!2sbd";
    request.fields['area'] = "fgh";
    request.fields['city'] = 1 as String;
    request.fields['size'] = "2";
    request.fields['property_type'] = "2";
    request.fields['price'] = "10";
    request.fields['total_price'] = "100";
    request.fields['eminities'] = [1,2,3] as String;

    var multipart = http.MultipartFile('featured_image',stream,length);


    request.files.add(multipart);
    request.headers.addAll(
        {
          "Content-Type": "multipart/form-data",
          'x-API-Key': "${APIKey}",
          'Authorization': "Token $token"
        }

    );

    var response = await request.send();

    debugPrint(response.statusCode.toString());

    if(response.statusCode == 200 || response.statusCode == 201){
      setState(() {
        isShowSpinner = false;
      });
      print("Image is Uploaded");
    }
    else{
      setState(() {
        isShowSpinner = false;
      });
      print("Failed to uploaded");
    }

  }


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isShowSpinner,
      child: Scaffold(

        appBar: AppBar(
          title: const Text("Image Upload"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                child: image == null ?const Center(child: Text("Pick Image") ,):Container(
                    child:Center(child: Image.file(File(image!.path).absolute,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),)),
              ),
            ),
            const SizedBox(height: 100,),
            GestureDetector(
              onTap: (){
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: const Center(child: Text("Upload",style: TextStyle(color: Colors.white),)),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
