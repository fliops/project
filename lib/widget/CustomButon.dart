import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButon extends StatelessWidget {
  CustomButon({super.key, this.onTap, required this.text,required this.colors});
  VoidCallback? onTap;
  String text;
  Color colors;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 370,
          height: 62,
          decoration: ShapeDecoration(
            color: colors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
