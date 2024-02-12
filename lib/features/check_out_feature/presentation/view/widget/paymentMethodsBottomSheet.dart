import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/payment_method_listview.dart';
import '../../manager/choose_payment_cubit/choose_payment_cubit.dart';
import 'custom_payment_block_button.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),
          PaymentMethodListView(),
          SizedBox(height: 32,),
          CustomPaymentButtonWithBloc()
        ],
      ),
    );
  }
}
