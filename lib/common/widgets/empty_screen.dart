
import 'package:aim_construction_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImage.emptyImg,),
    );
  }
}
