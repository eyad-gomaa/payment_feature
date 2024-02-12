import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_feature_app/core/utils/api_service.dart';
import 'package:payment_feature_app/features/check_out_feature/data/model/EphemeralKeyModel.dart';
import '../../features/check_out_feature/data/model/payment_intent_model/payment_intent_model.dart';
import '../../features/check_out_feature/data/model/payment_intent_input_model.dart';
import 'api_keys.dart';
import 'constants.dart';

class StripeService {
  ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.StripeSecretToken,
        );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey({required customerId}) async {
    var response = await apiService.post(
        body: {"customer": customerId},
        url: "https://api.stripe.com/v1/ephemeral_keys",
        token: ApiKeys.StripeSecretToken,
        headers: {
          "Authorization" : "Bearer ${ApiKeys.StripeSecretToken}",
          "Stripe-Version" : "2023-10-16"
        },
        stripeVersion: "2023-10-16");
    EphemeralKeyModel ephemeralKeyModel =
        EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future initPaymentSheet(
      {required String paymentIntentClientSecret,
      required String ephemeralKeySecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            customerEphemeralKeySecret: ephemeralKeySecret,
            customerId: Constants.customerId,
            merchantDisplayName: "Eyad"));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: Constants.customerId);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await displayPaymentSheet();
  }
}
