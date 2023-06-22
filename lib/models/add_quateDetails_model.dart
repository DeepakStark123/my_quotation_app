// ignore_for_file: file_names

import 'package:hive/hive.dart';

part 'add_quateDetails_model.g.dart';

@HiveType(typeId: 0)
class AddQuoteDetalisMoidel extends HiveObject {
  @HiveField(0)
  final int quoteNo;
  @HiveField(1)
  final String moving;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String mobilenumber;
  @HiveField(4)
  final String email;
  @HiveField(5)
  AddQuoteDetalisMoidel({
    required this.quoteNo,
    required this.moving,
    required this.name,
    required this.mobilenumber,
    required this.email,
  });
}
