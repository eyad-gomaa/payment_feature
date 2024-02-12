import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({Key? key, this.isActive = false, required this.image}) : super(key: key);
  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.50,color: isActive? Colors.green : Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
                color: isActive? Colors.green : Colors.transparent,
                blurRadius: 4,
                offset: const Offset(0,0),
                spreadRadius: 0
            )
          ]
      ),
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
