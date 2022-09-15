import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class WeatherPlaceHolder extends StatelessWidget {



  Widget build(BuildContext context) {
      return   Skeleton(
        isLoading: true,
        skeleton: SkeletonListView(),
        child: SizedBox(
            child: SkeletonListTile(
              verticalSpacing: 10,
              leadingStyle: SkeletonAvatarStyle(
                  width: 64, height: 64,   borderRadius: BorderRadius.circular(8)),

              subtitleStyle: SkeletonLineStyle(
                  height: 12,
                  maxLength: 200,
                  randomLength: true,
                  borderRadius: BorderRadius.circular(12)),
              hasSubtitle: true,
            ),
           height: 100),
      );

  }
  }


