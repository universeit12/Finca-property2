import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  //Add first page field-->>
  var type = ''.obs;
  var status = ''.obs;
  var addressName = ''.obs;
  var propertyName = ''.obs;
  var size = ''.obs;
  var utilityCost = ''.obs;
  var totalPrice = ''.obs;
  var Bedroom = ''.obs;
  var Bathroom = ''.obs;
  var Belconis = ''.obs;
  var garages = ''.obs;
  //Add second page field-->>
  var floorNumber = ''.obs;
  var title = ''.obs;
  var Description = ''.obs;
  var mobile = ''.obs;

  printAllData() {
    print(type);
    print(status);
    print(addressName);
    print(propertyName);
    print(size);
    print(utilityCost);
    print(totalPrice);
    print(Bedroom);
    print(Bathroom);
    print(Belconis);
    print(garages);
    print(title);
    print(Description);
    print(mobile);
  }
}
