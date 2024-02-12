
import 'package:flutter/material.dart';

@immutable
abstract class ChoosePaymentState {}

class ChoosePaymentInitial extends ChoosePaymentState {}
class ChangePaymentMethodSuccess extends ChoosePaymentState {}
