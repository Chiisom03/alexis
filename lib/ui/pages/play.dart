import 'package:alexis/ui/components/images.dart';
import 'package:alexis/ui/components/text_widgets.dart';
import 'package:alexis/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaySongPage extends StatefulWidget {
  const PlaySongPage({Key? key}) : super(key: key);

  @override
  State<PlaySongPage> createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgAsset('menu', width: 24.w),
              const Center(child: SvgAsset('search')),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 30.6.h),
            regularText(
              'Recommended for you',
              color: AppColors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumComponent extends ConsumerWidget {
  const AlbumComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(children: const [
        PngAsset('Bump'),
        PngAsset('Bump'),
      ]),
    );
  }
}
