
import 'package:app1/pages/introduction.dart';
import 'package:flutter/material.dart';


class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;

  ResponsiveButton({Key? key, this.width, this.isResponsive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 60,
      child: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntroductionScreen()), // Trang đích
    );
  },
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: const Color.fromARGB(255, 27, 88, 59).withOpacity(0.7),
  ),
  child: Center(
    child: Text(
      "LET'S GO BABYLON...?",
      style: TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
