import 'package:flutter/material.dart';
import '../utlis/dimensions.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget mobilescreenLayout;
  final Widget webscreenLayout;
  const ResponsiveLayoutScreen({
    Key? key,
    required this.mobilescreenLayout,
    required this.webscreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth > WebScreensize){
        return webscreenLayout;
      }
      return mobilescreenLayout;
    });
  }
}
