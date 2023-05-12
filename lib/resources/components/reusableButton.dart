import 'package:flutter/material.dart';

class ReusableBotton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const ReusableBotton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child:
            Center(child: loading ? CircularProgressIndicator() : Text(title)),
      ),
    );
  }
}
