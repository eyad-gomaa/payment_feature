// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/customAppBar.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
        body: ThankYouViewBody()
    );
  }
}
