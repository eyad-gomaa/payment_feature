import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_feature_app/core/utils/styles.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/payment_info_item.dart';
import 'package:payment_feature_app/features/check_out_feature/presentation/view/widget/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: const Color(0xFFEDEDED),
          borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 66,left: 20,right: 20,bottom: 20),
        child: Column(
          children: [
            Text("Thank You",style: Styles.style22,),
            Text("Your transaction was successful",style: Styles.style18,),
            const SizedBox(
              height: 10,
            ),
            const PaymentInfoItem(title: "Date",info: "01/24/2023",),
            const SizedBox(
              height: 10,
            ),
            // ignore: prefer_interpolation_to_compose_strings
            PaymentInfoItem(title: "Time",info: DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),),
            const SizedBox(
              height: 10,
            ),
            const PaymentInfoItem(title: "To",info: "Sam Louis",),
            const SizedBox(
              height: 10,
            ),
            const Divider(thickness: 2,height: 20,),
            const TotalPrice(totalPrice: "\$50.97"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width :MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
                child: Row(
                  children: [
                    SvgPicture.asset("Assets/Images/master_card.svg"),
                    const SizedBox(width: 23,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Credit Card',style: Styles.style18,),
                        Text('Mastercard **78',style: Styles.style16,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.barcode,size: 70,),
                Container(
                  width: 113,
                  height: 58,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text(
                      "Paid",
                      style: Styles.style22.copyWith(color: Colors.green),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * 0.2)/2)-39,
            )
          ],
        ),
      ),
    );
  }
}


