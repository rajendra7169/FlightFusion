import 'dart:io';

import 'package:flightfusion/styles/styles.dart';
import 'package:flightfusion/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePhotoUpdate extends StatelessWidget {
  const EditProfilePhotoUpdate({super.key, required this.photoPath});

  final String photoPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 80.w,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            padding: EdgeInsets.all(Insets.xs),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: photoPath.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(80.w),
                    child: Image.file(File(photoPath), fit: BoxFit.cover),
                  )
                : Image.asset(AppAsset.image('img_photo_profile.png')),
          ),
          Container(
            width: 24.w,
            height: 24.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              AppAsset.icon('ic_camera.png'),
              color: Colors.blueGrey[200],
            ),
          ),
        ],
      ),
    );
  }
}
