import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/utils/my_colors.dart';
import 'package:quotation/widgets/mybtn.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/quotation_controller.dart';

class AddQuotationScreen extends GetView<QuotationController> {
  const AddQuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var controller = Get.put(QuotationController());

    return Scaffold(
        appBar: AppBar(
          title: "Add Quotation".text.make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Quotation Number".text.size(14).make(),
                            5.heightBox,
                            TextFormField(
                              controller: controller.quotationNumberController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Quotation no.';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "3",
                                hintStyle:
                                    const TextStyle(color: Colors.black26),
                                suffixIcon: MyBtn(
                                  onPressed: () {
                                    controller.incrementQuoteNo();
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            5.heightBox,
                            "Moving".text.size(14).make(),
                            SizedBox(
                              height: 50,
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    contentPadding: EdgeInsets.only(
                                        bottom: 20, left: 10, right: 10)),
                                value: controller.dropdownval.value.isEmpty
                                    ? null
                                    : controller.dropdownval.value,
                                onChanged: (newValue) {
                                  controller.dropdownval.value =
                                      newValue!.toString();
                                },
                                items: controller.movingList.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                          fontSize: 17,
                                        )),
                                  );
                                }).toList(),
                              ),
                            ),
                            5.heightBox,
                            "Name".text.size(14).make(),
                            5.heightBox,
                            TextFormField(
                              controller: controller.nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "Deepak kumar",
                                hintStyle: TextStyle(color: Colors.black26),
                              ),
                            ),
                            5.heightBox,
                            "Mobile Number".text.size(14).make(),
                            5.heightBox,
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter mobile no.';
                                }
                                return null;
                              },
                              controller: controller.mobileController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "+918527715662",
                                hintStyle: TextStyle(color: Colors.black26),
                              ),
                            ),
                            "Email".text.size(14).make(),
                            5.heightBox,
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter email';
                                }
                                if (EmailValidator.validate(value) == false) {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "depak123@gmail.con",
                                hintStyle: TextStyle(color: Colors.black26),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                20.heightBox,
                Row(
                  children: [
                    MyBtn(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.addQuote();
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: lightTextColor),
                      ),
                    ).expand(),
                  ],
                ),
                30.heightBox,
              ],
            ),
          ),
        ));
  }
}
