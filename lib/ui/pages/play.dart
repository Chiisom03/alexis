import 'package:alexis/data.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgAsset('menu', width: 24.w),
              const Center(child: SvgAsset('search')),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.6.h),
                    regularText(
                      'Recommended for you',
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 24.sp,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 300.h,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        itemCount: albumImage.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, idx) => AlbumComponent(
                          albumImage[idx],
                          title: albumTitle[idx],
                          subtitle: albumSubtitle[idx],
                        ),
                        separatorBuilder: (_, __) => SizedBox(width: 20.w),
                      ),
                    ),
                    SizedBox(height: 42.h),
                    regularText(
                      'Your Playlist',
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 24.sp,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 300.h,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, idx) => const AlbumComponent(
                          'Bump',
                          title: 'Monsters Go Bump',
                          subtitle: 'ERIKA RECINOS',
                        ),
                        separatorBuilder: (_, __) => SizedBox(width: 20.w),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.w),
            child: Row(
              children: [
                Container(
                  height: 60.7.h,
                  width: 60.7.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Bump.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    regularText('Chaff & Dust', color: AppColors.white),
                    regularText('RYAN GRIGDRY', color: AppColors.grey),
                  ],
                ),
                const Spacer(),
                SvgAsset(
                  'Play',
                  color: AppColors.white,
                  height: 40.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AlbumComponent extends ConsumerWidget {
  final String image;
  final String title;
  final String subtitle;
  const AlbumComponent(this.image,
      {required this.title, required this.subtitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200.w,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            image: DecorationImage(
              image: AssetImage('assets/images/$image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        regularText(
          title,
          color: AppColors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 5.h),
        regularText(
          subtitle,
          color: AppColors.grey,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
