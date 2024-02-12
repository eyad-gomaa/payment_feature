import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/payment_method_item.dart';

import '../../manager/choose_payment_cubit/choose_payment_cubit.dart';
import '../../manager/choose_payment_cubit/choose_payment_state.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({Key? key}) : super(key: key);

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethodItems = const [
    "Assets/Images/small_card.svg",
    "Assets/Images/paypal.svg",
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoosePaymentCubit, ChoosePaymentState>(
  builder: (context, state) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
              onTap: (){
                BlocProvider.of<ChoosePaymentCubit>(context).changePaymentMethod(currentIndex: index);
              },
              child: PaymentMethodItem(isActive: BlocProvider.of<ChoosePaymentCubit>(context).isActiveMethod(currentIndex: index),image: paymentMethodItems[index],)),

        ),
      ),
    );
  },
);
  }
}
