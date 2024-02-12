

import 'package:flutter_bloc/flutter_bloc.dart';

import 'choose_payment_state.dart';

class ChoosePaymentCubit extends Cubit<ChoosePaymentState> {
  ChoosePaymentCubit() : super(ChoosePaymentInitial());
  int activeIndex = 0;
  void changePaymentMethod({required int currentIndex}){
    activeIndex = currentIndex;
    emit(ChangePaymentMethodSuccess());
}
bool isActiveMethod({required int currentIndex}){
  if(activeIndex == currentIndex){
    return true;
  }else{
    return false;
  }
}
}
