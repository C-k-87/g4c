import 'package:flutter/material.dart';

class ProfPic extends StatefulWidget {
  final String? url;
  final Image? diskImage;
  const ProfPic({super.key, required this.url, this.diskImage});

  @override
  State<ProfPic> createState() => _ProfPicState();
}

class _ProfPicState extends State<ProfPic> {
  @override
  Widget build(BuildContext context) {
    if (widget.url != null) {
      return Image.network(
        widget.url!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('asset_lib/images/prof_pic_default.png');
        },
      );
    } else if (widget.diskImage != null) {
      return widget.diskImage!;
    } else {
      return Image.asset('asset_lib/images/prof_pic_default.png');
    }
  }
}
