import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:html/parser.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universe_it_project/presentation/modules/all%20property/model/details_property_model.dart';


import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';


import '../../../../backend/services/ApiServices.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../add property/widgets/custom_text_icon.dart';
import '../../booking now/views/booking_screen.dart';
import '../contoller/all_property_controller.dart';
import '../model/all_property_model.dart';
import '../model/property_model.dart';
import '../widgets/contact_button.dart';
import '../widgets/property_semmary.dart';

class AllPropertyDetails extends StatelessWidget {
  final PropertyModel property;

  AllPropertyDetails({super.key, required this.property});



  final controller = Get.put(AllPropertyController());

  final PageController _pageController = PageController();

  DetailsPropertyModel detailsPropertyModel = DetailsPropertyModel();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: Backappbar(title: property.property!.propertyTypeName.toString(), bgcolor: Colors.teal),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Properties Images...
            ImageSlider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Properties Title And Location...
                  PropertyTitleAndLocation(),
                  SizedBox(height: 22.0),

                  ///Properies IndoRow...
                  PropertyInfoRow(),
                  SizedBox(height: 8.0),
                  Divider(color: Colors.black12, height: 20),

                  //Properties Summary
                  SizedBox(height: 8.0),
                  CustomText(text: "PROPERTY SUMMARY"),
                  Container(
                    height: 5,
                    width: 70,
                    color: Colors.teal,
                  ),
                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      width:180,

                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PropertySummary(icon: Iconsax.ruler,text: " Size : ${property.property!.size ?? ""} sft",),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Iconsax.building,text: " Total Apartment: ${property.property!.totalFloor ?? "None"}",),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Iconsax.house_2,text: " Facing: ${property.property!.facing ?? "N/A"}",),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Icons.bed,text: " Beds: ${property.property!.garages ?? "None"}",),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Icons.window,text: " Belconies: ${property.property!.belconies ?? "N/A"}",),

                        ],
                      ),
                    ),
                    Container(
                      width:180,

                     // color: Colors.yellow,
                      child: Column(
                        children: [
                          PropertySummary(icon: Iconsax.ruler,text: " Size : ${property.property!.sizeKatha ?? ""} Katha",),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Iconsax.building,text: " Apartment Size: ${property.property!.size ?? ""}Ft"),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Icons.check_circle_outline,text: " Status: ${property.property!.status ?? ""}"),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Icons.bathtub_outlined,text: " Bathroom: ${property.property!.bathroom ?? "None"}"),
                          SizedBox(height: 3,),
                          PropertySummary(icon: Icons.garage,text: " Garages: ${property.property!.garages ?? "None"}"),

                        ],
                      ),
                    ),
                  ],),

                  SizedBox(height: 8.0),
                  //Divider(color: Colors.black12, height: 20),


                  const SizedBox(height: 30.0),

                  //Contact Button...
                  ContactButtons(property),
                  const SizedBox(height: 40.0),
                  //Divider(color: Colors.black12, height: 20),
                  const SizedBox(height: 10.0),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        CustomText(text: "PROPERTY FEATURES"),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 60,right: 60),
                          child: Divider(),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SizedBox(

                              width: 200,
                              child: ListView.builder(

                                itemCount: property.property?.eminities?.length,

                                itemBuilder: (context, index) {
                                  final feminines = property.property!.eminities?[index];
                                  return Row(

                                    children: [
                                      Icon(Icons.check_circle,size: 15,),
                                      SizedBox(width: 10,),
                                      Text(feminines!.name.toString(),style: TextStyle(fontSize: 15),),
                                    ],
                                  );
                                },
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 10.0),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        Center(child: CustomText(text: "FLOOR PLANS")),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: Divider(),
                        ),
                    
                        const SizedBox(height: 10.0),
                    
                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 5,);
                            },
                            itemCount:property.floorplanImages!.length ,
                            itemBuilder: (context, index) {
                              final images = property.floorplanImages?[index];
                    
                              return Card(
                                  elevation: 5,
                                  shadowColor: Colors.black12,
                    
                                  child: Image.network(images!.image!.toString(),height: 130,width: 170,fit: BoxFit.fill,));
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  

                  const SizedBox(height: 10.0),
                  Card(

                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        Center(child: CustomText(text: "LOCATION IMAGES")),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: Divider(),
                        ),

                        const SizedBox(height: 10.0),

                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 5,);
                            },
                            itemCount:property.locationMapImages!.length ,
                            itemBuilder: (context, index) {
                              final images = property.locationMapImages?[index];

                              return Card(
                                  elevation: 5,
                                  shadowColor: Colors.black12,

                                  child: Image.network(images!.image!.toString(),height: 130,width: 170,fit: BoxFit.fill,));
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),




                  SizedBox(height: 10.0),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Center(child: CustomText(text: "PROPERTY DESCRIPTION")),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: Divider(),
                        ),
                        Html(data:property.property!.description ?? ''),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0),

                  Form(
                    key: controller.feedbackFormKey,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                      
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.0),
                          Center(child: CustomText(text: "Feedback")),
                          const SizedBox(height: 5.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 90,right: 90),
                            child: Divider(),
                          ),
                          const SizedBox(height: 15.0),
                      
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Textfield1(
                      
                              validation: (value){
                                if(value == null || value.isEmpty){
                                  return " Please enter name";
                                }
                              },
                              hinttext: "User Name",
                              controller: controller.userName,
                      
                            ),
                          ),
                      
                      
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Textfield1(
                              validation: (value){
                                if(value == null || value.isEmpty){
                                  return " Please write short description";
                                }
                      
                              },
                              hinttext: "Write A Short Description",
                      
                              controller: controller.description,
                              maxline: 2,
                            ),
                          ),
                          SizedBox(height: 10,),
                          CustomButton(onTap: (){
                            debugPrint("trapped");
                            if(controller.feedbackFormKey.currentState!.validate()){
                              controller.feedBackPost(property);
                            }
                      
                          },text: "Send Message",),
                          SizedBox(height: 20.0),
                      
                      
                      
                      
                        ],
                      
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageSlider() {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child:  PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: property.galleryImages?.length,
              itemBuilder: (context, index) {
                final images = property.galleryImages?[index];

                return Image.network(images?.image.toString() ?? '',
                  fit: BoxFit.cover,
                );
              },
            ),

        ),
        Positioned(
          right: 16,
          top: 80,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                size: 30, color: Colors.white),
            onPressed: () {
              if (_pageController.page!.toInt() <
                  controller.imageList.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
        Positioned(
          left: 16,
          top: 80,
          child: IconButton(
            icon:
            const Icon(Icons.arrow_back_ios, size: 30, color: Colors.white),
            onPressed: () {
              if (_pageController.page!.toInt() > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget PropertyTitleAndLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: property.property!.propertyName ?? '',
          fontsize: 20.0,
          maxline: 3,
          color: Colors.teal,
        ),
        const SizedBox(height: 9.0),
        Row(
          children: [
            Icon(Icons.location_on,size: 15,),
            SizedBox(width: 5,),
            CustomText(
              text: property.property!.address ?? '',
              fontsize: 16.0,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }

  Widget PropertyInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPropertyInfoContainer(
          text: property.property!.propertyTypeName ?? '',
          color: Colors.blueAccent,
        ),
        _buildPropertyInfoContainer(
          text: "৳ ${property.property!.price ?? ''}",
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildPropertyInfoContainer(
      {required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget ContactButtons(PropertyModel property) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ContactButton(
          icon: Icons.call,
          text: "Call Now",
          ontap: () {
            controller.makePhoneCall('01763551316');
          },
        ),
        ContactButton(
          icon: Icons.calendar_month,
          text: "Booking Now",
          ontap: () {
            Get.to(() => BookingScreen(property: property,));
          },
        ),
      ],
    );
  }
}

class PropertySummary extends StatelessWidget {
  const PropertySummary({
    super.key,
   required this.icon, required this.text, this.fontSize = 12,
  });

  final IconData icon;
  final String text;
  final double fontSize;



  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon,size: 17,),
      Text(text,style: TextStyle(fontSize: fontSize
          ,fontWeight: FontWeight.w800,color: Colors.black.withOpacity(0.6)),),


    ],);
  }


}

