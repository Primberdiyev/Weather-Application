import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
              'assets/images/image_1.png',
              width: MediaQuery.of(context).size.width * 0.65,
            );
    
  }
}