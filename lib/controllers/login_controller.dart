import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  var auth = FirebaseAuth.instance;
  var valid = false;
  String verificationID = '';
  var loading = false.obs;

  isValid() {
    valid = phoneController.text.isEmpty ? false : true;
    update();
  }

  verifyPhoneNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (_) {},
        verificationFailed: (e) {
          debugPrint("verificationFailed = $e");
          Get.snackbar("Verification Errror = ", e.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (e) {
          debugPrint("codeAutoRetrievalTimeout = $e");
        });
  }

  getverify() async {
    loading(true);
    debugPrint("verify id = $verificationID");
    var credential = PhoneAuthProvider.credential(
      verificationId: verificationID.toString(),
      smsCode: otpController.text,
    );
    try {
      await auth.signInWithCredential(credential);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('login', true);
      Get.offAllNamed(RoutesName.homeScreen);
    } catch (e) {
      debugPrint("Auth Error = $e");
      Get.snackbar("Authentication Exception = ", e.toString());
    } finally {
      verificationID = '';
      loading(false);
    }
  }
}
