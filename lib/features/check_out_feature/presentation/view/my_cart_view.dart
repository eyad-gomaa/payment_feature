import 'package:flutter/material.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/customAppBar.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "My Cart"),
        body: const MyCartViewBody()
    );
  }
}





