import 'package:flutter/material.dart';
import '../../../../core/utils/color/app_color.dart';


class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.fillColor,
      appBar: AppBar(
        backgroundColor: AppColor.fillColor,
        title: Text(
          "Explant Finder ",
        style: TextStyle(
          color: AppColor.textColor,
          fontSize: 18,
        fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.upload_file,
              color: AppColor.secondColor,
              size: 100,
            ),
            Text(
              "Browser to Upload ",
              style: TextStyle(
                  color: AppColor.textColor,
                  fontSize:15,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text(
              "only Scv Files ",
              style: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }
}
