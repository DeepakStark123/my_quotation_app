import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotation/models/add_quateDetails_model.dart';

import 'bindings/initila_bindings.dart';
import 'firebase_options.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //----Hive initilization----//
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(AddQuoteDetalisMoidelAdapter());
  await Hive.openBox<AddQuoteDetalisMoidel>('myQuotations');
  //----Bindings initilization----//
  RootBinding().dependencies();
  //----Firebase initilization----//
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: RootBinding(),
      initialRoute: RoutesName.spalashScreen,
      getPages: AppRoutes().getPages,
    );
  }
}
