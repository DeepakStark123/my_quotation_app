// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
