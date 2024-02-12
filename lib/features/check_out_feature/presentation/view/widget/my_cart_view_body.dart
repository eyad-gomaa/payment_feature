import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_feature_app/features/check_out_feature/data/repo/checkout_repo.dart';
import 'package:payment_feature_app/features/check_out_feature/data/repo/checkout_repo_impl.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/paymentMethodsBottomSheet.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/total_price.dart';

import '../../manager/choose_payment_cubit/choose_payment_cubit.dart';
import '../../manager/payment/payment_cubit.dart';
import 'cart_info_item.dart';
import 'custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("Assets/Images/cart_image.png"),
            const SizedBox(
              height: 16,
            ),
            const CartInfoItem(text: 'Order Subtotal', price: '\$42.97'),
            const CartInfoItem(text: 'Discount', price: '\$0'),
            const CartInfoItem(text: 'Shipping', price: '\$8'),
            const Divider(
              thickness: 2, indent: 40, endIndent: 40, height: 34,),
            const TotalPrice(totalPrice: '\$50.97',),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              isLoading: false,
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context){return const PaymentDetailsView();}));
                showModalBottomSheet(context: context, builder: (builder) {
                  return BlocProvider(
                    create: (context) =>
                        PaymentCubit(
                            repo: CheckOutRepoImpl()
                        ),
                    child: PaymentMethodsBottomSheet(),
                  );
                });
              },
              title: "Complete payment",
            )

          ],
        ),
      ),
    );
  }
}
