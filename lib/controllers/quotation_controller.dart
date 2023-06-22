import 'dart:math';

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
      quoteNo: int.parse(quotationNumberController.text.isEmpty
          ? "0"
          : quotationNumberController.text),
    );
    final box = Boxes.getData();
    box.add(quotedata);
    quotedata.save();
    Get.snackbar("Status", "Quotation added");
    emptyFields();
  }

  deleteQuote(AddQuoteDetalisMoidel quatation) async {
    await quatation.delete();
  }

  emptyFields() {
    emailController.clear();
    mobileController.clear();
    dropdownval.value = movingList[0];
    nameController.clear();
    quotationNumberController.clear();
  }

  getDafaultData() {
    Random random = Random();
    var randomNumber = random.nextInt(100);
    debugPrint(randomNumber.toString());
    quotationNumberController.text = randomNumber.toString();
  }

  incrementQuoteNo() {
    int temp = int.parse(quotationNumberController.text.isEmpty
        ? "0"
        : quotationNumberController.text);
    temp++;
    quotationNumberController.text = temp.toString();
  }

  @override
  void onInit() {
    getDafaultData();
    super.onInit();
  }
}
