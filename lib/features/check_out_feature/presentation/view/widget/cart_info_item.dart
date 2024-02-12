import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CartInfoItem extends StatelessWidget {
  const CartInfoItem({
    super.key, required this.text, required this.price,
  });
  final String text;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,style: Styles.style18,),
        // ignore: prefer_const_constructors
        Spacer(),
        Text(price,style: Styles.style18,),
      ],
    );
  }
}
