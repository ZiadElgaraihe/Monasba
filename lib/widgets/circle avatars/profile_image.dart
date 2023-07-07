import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.width, required this.height});

  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        child: Image.asset('assets/images/Ellipse 3.png'),
      ),
    );
  }
}
