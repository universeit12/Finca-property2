import 'package:get/get.dart';

import '../model/booking_model.dart';

class BookingPropertyController extends GetxController {
  var properties = [].obs;
  var isLoading = true.obs;

  var selectedProperty = Rxn<BookingModel>();

  @override
  void onInit() {
    fetchProperties();
    super.onInit();
  }

  void fetchProperties() async {
    try {
      isLoading(true);
      final response = await GetConnect()
          .get('https://finca.psdcedu.xyz/api/property-for-booking');
      if (response.statusCode == 200) {
        var propertyList = response.body as List;
        properties.value = propertyList
            .map((property) => BookingModel.fromJson(property))
            .toList();
        // Set default selected property
        selectedProperty.value = properties.first;
      }
    } catch (e) {
      print("Error fetching properties: $e");
    } finally {
      isLoading(false);
    }
  }
}