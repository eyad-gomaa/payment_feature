import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/manager/choose_payment_cubit/choose_payment_cubit.dart';
import '../../../../../core/utils/api_keys.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/model/payment_intent_input_model.dart';
import '../../../data/model/paypal_models/paypal_amount_model.dart';
import '../../../data/model/paypal_models/paypal_items_list_model.dart';
import '../../manager/payment/payment_cubit.dart';
import '../thank_you_view.dart';
import 'custom_button.dart';

class CustomPaymentButtonWithBloc extends StatelessWidget {
  const CustomPaymentButtonWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
        if (state is PaymentFailure) {
          SnackBar snackBar = SnackBar(content: Text(state.failureMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return CustomButton(
            title: "Continue",
            onTap: () {
              if(BlocProvider.of<ChoosePaymentCubit>(context).activeIndex == 0){
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(amount: '500', currency: "USD", customerId: Constants.customerId);
                BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel);
              }else{
                var transactionsData = getTransactionData();
                excecutePaypalPayment(context, transactionsData);
              }

            },
            isLoading: state is PaymentLoading ? true : false);
      },
    );
  }

  void excecutePaypalPayment(BuildContext context, ({PaypalAmountModel amount, PaypalItemsListModel itemsList}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.payPalClientid,
        secretKey: ApiKeys.payPalSecretToken,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.itemsList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")));
          Navigator.pop(context);
        },
        onError: (error) {
          print("onError: $error");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed")));
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
  ({PaypalAmountModel amount, PaypalItemsListModel itemsList})getTransactionData(){
    PaypalAmountModel paypalAmountModel = PaypalAmountModel(total: '100', currency: 'USD', details:Details(shipping: '0', shippingDiscount: 0, subtotal: '100'));
    PaypalItemsListModel paypalItemsListModel = PaypalItemsListModel(items: [Item(quantity: 4, price: '10', name: 'Apple', currency: 'USD',),Item(quantity: 5, price: '12', name: 'Pineapple', currency: 'USD',)]);
    return(amount:paypalAmountModel,itemsList:paypalItemsListModel);
  }
}
