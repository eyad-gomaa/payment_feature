import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem({
    super.key, required this.title, required this.info,
  });
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Styles.style18,),
        const Spacer(),
        Text(info,style: Styles.styleBold18,),
      ],
    );
  }
}