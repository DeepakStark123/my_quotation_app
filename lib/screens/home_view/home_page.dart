import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotation/controllers/home_controller.dart';
import 'package:quotation/controllers/quotation_controller.dart';
import 'package:quotation/models/add_quateDetails_model.dart';
import 'package:quotation/utils/my_colors.dart';
import 'package:quotation/utils/routes/routes_name.dart';
import 'package:quotation/widgets/mybtn.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../boxes/boxes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();
    var quotationController = Get.find<QuotationController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Quotation"),
        leadingWidth: 0,
        actions: [
          MyBtn(
            onPressed: () {
              Get.toNamed(RoutesName.quotationScreen);
            },
            child: const Icon(
              Icons.add,
              color: lightTextColor,
            ),
          ),
          5.widthBox,
          MyBtn(
            onPressed: () {
              homeController.logoutUser();
            },
            child: const Icon(
              Icons.exit_to_app,
              color: lightTextColor,
            ),
          ),
          5.widthBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<Box<AddQuoteDetalisMoidel>>(
            valueListenable: Boxes.getData().listenable(),
            builder: (context, box, _) {
              var data = box.values.toList()..cast<AddQuoteDetalisMoidel>();
              return box.length == 0
                  ? const Center(child: Text("No Data Found"))
                  : ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Name :"),
                                    Text(data[index].name.toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Email :"),
                                    Text(data[index].email.toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Mobile No :"),
                                    Text(data[index].mobilenumber.toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Moving :"),
                                    Text(data[index].moving.toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Quotation number :"),
                                    Text(data[index].quoteNo.toString()),
                                  ],
                                ),
                                2.heightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Delete Quote :"),
                                    const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ).onTap(() {
                                      quotationController
                                          .deleteQuote(data[index]);
                                    })
                                  ],
                                ),
                              ],
                            ));
                      });
            }),
      ),
    );
  }
}
