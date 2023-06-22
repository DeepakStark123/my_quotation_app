import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../boxes/boxes.dart';
import '../models/add_quateDetails_model.dart';

class QuotationController extends GetxController {
  final quotationNumberController = TextEditingController();
  final mobileController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final moveToAddController = TextEditingController();
  final moveFromAddController = TextEditingController();
  var quoteNo = 0.obs;

  List<String> movingList = ['Delhi', "Noida", "Banglore"];
  var dropdownval = 'Delhi'.obs;

  addQuote() {
    var quotedata = AddQuoteDetalisMoidel(
      email: emailController.text,
      mobilenumber: mobileController.text,
      moving: dropdownval.toString(),
      name: nameController.text,
      quoteNo: int.parse(quotationNumberController.text.toString()),
    );
    final box = Boxes.getData();
    box.add(quotedata);
    Get.snackbar("Status", "Quotation added");
  }
}
