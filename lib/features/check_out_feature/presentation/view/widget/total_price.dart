import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,required this.totalPrice,
  });

  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Total",style: Styles.style24,),
        const Spacer(),
        Text(totalPrice,style: Styles.style24,),
      ],
    );
  }
}
