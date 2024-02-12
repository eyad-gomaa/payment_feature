import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:payment_feature_app/features/check_out_feature/data/repo/checkout_repo.dart';

import '../../../data/model/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.repo}) : super(PaymentInitial());
  final CheckOutRepo repo;
  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
    emit(PaymentLoading());
    var data = await repo.makePayment(paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
            (l) => emit(PaymentFailure(failureMessage: l.errMessage)),
            (r) => emit(PaymentSuccess())
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    if (kDebugMode) {
      print(change.toString());
    }
    super.onChange(change);
  }
}
