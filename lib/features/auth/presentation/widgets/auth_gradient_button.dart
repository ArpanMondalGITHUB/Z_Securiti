import 'package:flutter/material.dart';
import 'package:khanakhazana/global/theme/appallate.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  const AuthButton({super.key, required this.text,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Appallete.gradient1, Appallete.gradient2],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
          onPressed:ontap,
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(395, 55),
              backgroundColor: Appallete.transparentColor,
              shadowColor: Appallete.transparentColor),
          child: Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          )),
    );
  }
}
