import 'package:flutter/material.dart';
import '../../../../core/utils/color/app_color.dart';



AppBar customAppBar ({required String screenTittle,required context}){
  return AppBar(
    leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 24,
          color: AppColor.textColor,
        )),
    title: Text(
      screenTittle,
      style: TextStyle(
          color: AppColor.textColor,
          fontSize: 20
      ),
    ),
    centerTitle: true,
  );
}
