import 'package:flutter/material.dart';

class OneRow extends StatelessWidget {
  const OneRow({super.key, required this.title, required this.descript});
  final String title;
  final String descript;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [Text(title), Text(descript)],
      ),
    );
  }
}
