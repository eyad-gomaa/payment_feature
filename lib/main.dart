import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/utils/api_keys.dart';
import 'features/check_out_feature/presentation/manager/choose_payment_cubit/choose_payment_cubit.dart';
import 'features/check_out_feature/presentation/view/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChoosePaymentCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyCartView(),
      ),
    );
  }
}
