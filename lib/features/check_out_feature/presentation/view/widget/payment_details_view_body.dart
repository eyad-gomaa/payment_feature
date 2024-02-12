import 'package:flutter/material.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/custom_button.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/payment_method_listview.dart';
import '../thank_you_view.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  GlobalKey <FormState> formKey = GlobalKey();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCardWidget(formKey: formKey, autoValidateMode: autoValidateMode,),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
                child: CustomButton(title: 'finish',onTap: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThankYouView(),));
                  }else{
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                })),
          ),
        )
      ]
    );
  }
}
