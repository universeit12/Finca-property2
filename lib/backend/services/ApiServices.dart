import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:universe_it_project/presentation/modules/all%20property/model/all_property_model.dart';
import 'package:universe_it_project/presentation/modules/all%20property/model/web_ingo_model.dart';
import 'package:universe_it_project/presentation/modules/profile/model/company_profile_model.dart';
import 'package:universe_it_project/presentation/modules/profile/model/profile_model.dart';

import '../../presentation/modules/all property/model/details_property_model.dart';



const String APIKey = 'finc}a12j[hds(utftcy,Pr0Pe4T*1Ei1sE3';
final storage = GetStorage();

class ApiServices{
  static  String baseURL = "https://finca.psdcedu.xyz/api";
  var client = http.Client();

  // GET
  Future<dynamic> get (String api)async{
    var url = Uri.parse(baseURL + api);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}"

    };
    var response = await client.get(url,headers: _headers);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      // Throw exception and catch it in UI
    }

  }

   // Profile get
  Future<ProfileModel?> getData (String api)async{
    String token = await storage.read("token");
    var url = Uri.parse(baseURL + api);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}",
      'Authorization': "Token $token"

    };
    var response = await client.get(url,headers: _headers);
    if(response.statusCode == 200){
      ProfileModel model = ProfileModel.fromJson(json.decode(response.body));
      return model;
    }
    else{
      // Throw exception and catch it in UI
    }

  }

  Future<WebIngoModel?> getDataWebIngo (String api)async{
    //String token = await storage.read("token");
    var url = Uri.parse(baseURL + api);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}",
      //'Authorization': "Token $token"

    };
    var response = await client.get(url,headers: _headers);
    if(response.statusCode == 200){
      WebIngoModel model = WebIngoModel.fromJson(json.decode(response.body));
      return model;
    }
    else{
      // Throw exception and catch it in UI
    }

  }

  // AllProperty get
  /*
  Future<PropertyModel?> getAllProperty (String api)async{
    String token = await storage.read("token");
    var url = Uri.parse(baseURL + api);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}",


    };
    var response = await client.get(url,headers: _headers);
    if(response.statusCode == 200){
      PropertyModel model = PropertyModel.fromJson(json.decode(response.body));
      return model;
    }
    else{
      // Throw exception and catch it in UI
    }

  }*/

  Future<CompanyProfileModel?> getCompanyData (String api)async{
    String token = await storage.read("token");
    var url = Uri.parse(baseURL + api);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}",
      'Authorization': "Token $token"

    };
    var response = await client.get(url,headers: _headers);
    if(response.statusCode == 200){
      CompanyProfileModel model = CompanyProfileModel.fromJson(json.decode(response.body));
      return model;
    }
    else{
      // Throw exception and catch it in UI
    }

  }

  Future<dynamic> post (String api,dynamic object)async{
    var url = Uri.parse(baseURL + api);
    var _payload = json.encode(object);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}"

    };
    var response = await client.post(url,body:_payload,headers: _headers);
    if(response.statusCode == 201){
      return response.body;
    }
    else if(response.statusCode == 200){
      return response.body;
    }
    else{
      // Throw exception and catch it in UI
    }


  }

  Future<dynamic> post3 (String api,dynamic object)async{
    var url = Uri.parse(baseURL + api);
    var _payload = json.encode(object);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}"

    };
    var response = await client.post(url,body:_payload,headers: _headers);
    if(response.statusCode == 201){
      return response.body;
    }
    else if(response.statusCode == 200){
      return response.body;
    }
    else{
      // Throw exception and catch it in UI
    }


  }

  Future<dynamic> post2 (String api,dynamic object)async{
    String token = await storage.read("token");
    var url = Uri.parse(baseURL + api);
    var _payload = json.encode(object);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}",
      'Authorization': "Token $token"

    };
    var response = await client.post(url,body:_payload,headers: _headers);

     if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    else{
      // Throw exception and catch it in UI
    }


  }



  Future<dynamic> put (String api,dynamic object)async{
    String token = await storage.read("token");
    var url = Uri.parse(baseURL + api);
    var _payload = json.encode(object);
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${APIKey}",
      'Authorization': "Token $token"

    };
    var response = await client.put(url,body:_payload,headers: _headers);

    if(response.statusCode == 200){
      return response.body;
    }
    else{
      // Throw exception and catch it in UI
    }

  }

  Future<dynamic> delete (String api)async{

  }


  // Featch Product
  Future<List<FincaPropertyModel>> fetchProducts() async {
    final response = await http.get(Uri.parse("https://finca.psdcedu.xyz/api/property"));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => FincaPropertyModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Featch Product Details

  Future<DetailsPropertyModel> fetchProductDetails(String slug) async {
    final response = await http.get(Uri.parse('https://finca.psdcedu.xyz/api/property/data/$slug'));
    if (response.statusCode == 200) {
      return DetailsPropertyModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }

  Future<http.StreamedResponse> patchImage(String api, String filePath)async{
    String token = await storage.read("token");
    var url = Uri.parse(baseURL + api);
    var request = http.MultipartRequest('PATCH',url);
    request.files.add(await http.MultipartFile.fromPath("image", filePath));
    request.headers.addAll(
      {
        "Content-Type": "multipart/form-data",
        'x-API-Key': "${APIKey}",
        'Authorization': "Token $token"
      }

    );
    var response = request.send();
    return response;

  }


}