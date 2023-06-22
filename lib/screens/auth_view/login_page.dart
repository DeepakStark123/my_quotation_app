import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/controllers/login_controller.dart';

import '../../utils/my_colors.dart';
import '../../widgets/mybtn.dart';
import '../../widgets/otp_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Login",
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 36,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<LoginController>(
              builder: (context) {
                return TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    loginController.isValid();
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Phone Number",
                    suffixIcon: loginController.valid == false
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: MyBtn(
                              onPressed: () {},
                              child: const Text(
                                "Request",
                                style: TextStyle(color: lightTextColor),
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(4),
                            child: OTPButton(
                              title: const Text("Request"),
                              onPressed: () {
                                loginController.verifyPhoneNumber();
                              },
                            ),
                          ),
                  ),
                  controller: loginController.phoneController,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter otp';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "Enter OTP",
              ),
              controller: loginController.otpController,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: MyBtn(
                  child: loginController.loading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(color: lightTextColor),
                        ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginController.getverify();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
