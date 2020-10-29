import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/medicine.dart';
import 'package:flutter_healthcare_app/src/model/medicine_type.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EShopViewModel extends ChangeNotifier {
  Future<List<Medicine>> getAllMedicine(String medicineId, String medCompany,
      String medType, String productCategoryId) async {
    final response = await http.get(
        'http://172.16.61.221:8059/admins.asmx/getAllMedicine?MedicineId=$medicineId&MedCompany=$medCompany&medType=$medType&ProductCategoryId=$productCategoryId');

    if (response.statusCode == 200) {
      List<Medicine> medicines;

      Iterable list = json.decode(response.body);
      medicines = list.map((model) => Medicine.fromJson(model)).toList();

      return medicines;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<List<MedicineType>> getAllMedicineType() async {
    final response =
        await http.get('http://172.16.61.221:8059/admins.asmx/getMedicineType');

    if (response.statusCode == 200) {
      List<MedicineType> medicines;

      Iterable list = json.decode(response.body);
      medicines = list.map((model) => MedicineType.fromJson(model)).toList();

      return medicines;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }
}
