import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/utils/routes/routes_name.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/my_listTile.dart';

class QuotationScreen extends StatelessWidget {
  const QuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quotation"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView(
                children: [
                  MyListTile(
                    title: "Quotation",
                    onTap: () {
                      Get.toNamed(RoutesName.addQuotationScreen);
                    },
                    icon: Icons.holiday_village,
                  ),
                  MyListTile(
                    title: "Survey",
                    onTap: () {},
                    icon: Icons.holiday_village,
                  ),
                  MyListTile(
                    title: "Packing",
                    onTap: () {},
                    icon: Icons.holiday_village,
                  ),
                  MyListTile(
                    title: "Condition",
                    onTap: () {},
                    icon: Icons.holiday_village,
                  ),
                  MyListTile(
                    title: "Bill",
                    onTap: () {},
                    icon: Icons.holiday_village,
                  ),
                  MyListTile(
                    title: "Payment",
                    onTap: () {},
                    icon: Icons.holiday_village,
                  ),
                  MyListTile(
                    title: "Receipt",
                    onTap: () {},
                    icon: Icons.holiday_village,
                  ),
                ],
              ).expand(),
            ],
          ),
        ));
  }
}
