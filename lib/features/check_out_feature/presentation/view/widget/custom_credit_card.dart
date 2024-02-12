// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'custom_button.dart';

class CustomCreditCardWidget extends StatefulWidget {
  const CustomCreditCardWidget({Key? key, required this.formKey,required this.autoValidateMode}) : super(key: key);
  final GlobalKey <FormState> formKey;
  final AutovalidateMode autoValidateMode;

  @override
  State<CustomCreditCardWidget> createState() => _CustomCreditCardWidgetState();
}
class _CustomCreditCardWidgetState extends State<CustomCreditCardWidget> {
  String cardNumber = "";
      String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (p0){},
        ),
        CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (model){
              cardHolderName = model.cardHolderName;
              expiryDate = model.expiryDate;
              cardNumber = model.cardNumber;
              cvvCode = model.cvvCode;
              showBackView = model.isCvvFocused;
              setState(() {
              });
            },
            formKey: widget.formKey,
          autovalidateMode: widget.autoValidateMode,
        ),
      ],
    );
  }
}
