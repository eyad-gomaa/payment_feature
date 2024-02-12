import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.title,required this.onTap, this.isLoading = false,
  });
  final String title;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20)
        ),
        child:isLoading ? const Center(child: CircularProgressIndicator()) : Center(child: Text(title,style: Styles.styleBold18,)),
      ),
    );
  }
}
