import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFEDEDED),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.green,
        child: Icon(Icons.check,size: 50,color: Colors.white,),
      ),
    );
  }
}