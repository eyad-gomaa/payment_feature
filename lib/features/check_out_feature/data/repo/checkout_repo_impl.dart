import 'package:dartz/dartz.dart';

import 'package:payment_feature_app/core/errors/failures.dart';

import 'package:payment_feature_app/features/check_out_feature/data/model/payment_intent_input_model.dart';

import '../../../../core/utils/stripe_service.dart';
import 'checkout_repo.dart';

class CheckOutRepoImpl implements CheckOutRepo{
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    try {
      await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

}