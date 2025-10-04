import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/core/utils/color/app_color.dart';


class AppDialog extends StatelessWidget {
  const AppDialog({super.key,required this.errorMessage,this.icon=Icons.error_outline,this.iconColor=Colors.red});

  final String errorMessage;
  final IconData icon ;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
      child: AlertDialog(
        backgroundColor:AppColor.mainColor,
        icon: Icon(
          icon,
          color: iconColor,
          size:30.sp,
        ),
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor
          ),
        )
        ,),
    );
  }
}
