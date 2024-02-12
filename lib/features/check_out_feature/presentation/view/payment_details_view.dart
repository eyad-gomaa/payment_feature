import 'package:flutter/material.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/customAppBar.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),
      body: const PaymentDetailsViewBody(),
    );
  }
}
