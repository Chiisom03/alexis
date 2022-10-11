import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PngAsset extends StatelessWidget {
  const PngAsset(
    this.image, {
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$image.png',
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}

class SvgAsset extends StatelessWidget {
  const SvgAsset(
    this.svg, {
    Key? key,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  final String svg;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/$svg.svg',
      color: color,
      width: width,
      height: height,
    );
  }
}
