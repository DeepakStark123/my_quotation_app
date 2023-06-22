// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';

import '../models/add_quateDetails_model.dart';

class Boxes {
  static Box<AddQuoteDetalisMoidel> getData() =>
      Hive.box<AddQuoteDetalisMoidel>('myQuotations');
}
