// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
        title ?? " ",
        style: Styles.style25
    ),
    centerTitle: true,
    leading: Center(
        child: SvgPicture.asset("Assets/Images/Arrow1.svg")
    ),
  );
}