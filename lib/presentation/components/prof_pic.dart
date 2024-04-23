import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfPic extends StatefulWidget {
  final String? url;
  final Uint8List? image;
  const ProfPic({super.key, this.url, this.image});

  @override
  State<ProfPic> createState() => _ProfPicState();
}

class _ProfPicState extends State<ProfPic> {
  @override
  Widget build(BuildContext context) {
    if (widget.url != null && widget.url != '') {
      return CachedNetworkImage(fit: BoxFit.fill, imageUrl: widget.url!);
    } else if (widget.image != null) {
      return Image(image: MemoryImage(widget.image!));
    } else {
      return Image.asset('asset_lib/images/prof_pic_default.png');
    }
  }
}
