import 'package:flutter/cupertino.dart';

class ScreenPadding extends StatelessWidget {
  const ScreenPadding({super.key,required this.widget});
  final Widget widget ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      child: widget,
    );
  }
}
