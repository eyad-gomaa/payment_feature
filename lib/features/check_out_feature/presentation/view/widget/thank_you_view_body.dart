import 'package:flutter/material.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/thank_you_card.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:0,left: 20,right: 20,bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
              left: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
              right: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CustomCheckIcon(),
          ),
          Positioned(
              left: 30,
              right: 30,
              bottom: MediaQuery.sizeOf(context).height * 0.2  + 20 ,
              child: const CustomDashedLine())
        ],
      ),
    );
  }
}





