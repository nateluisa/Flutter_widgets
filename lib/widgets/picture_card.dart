import 'package:flutter/material.dart';

class MyPictureCard extends StatelessWidget {
  const MyPictureCard({
    Key? key,
    this.elevation,
    this.shadowColor,
    this.shape,
    this.color,
    this.onTap,
    this.decoration, this.bundle, required this.image,
  }) : super(key: key);

  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? color;
  final GestureTapCallback? onTap;
  final Decoration? decoration;
  final AssetBundle? bundle;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      color: color,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('bundle'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }
}

// BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// image: const DecorationImage(
// image: AssetImage("assets/images/recebimento.png"),
// fit: BoxFit.cover,
// alignment: Alignment.topCenter,
// ),
// ),
