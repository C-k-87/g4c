import 'package:flutter/material.dart';

Image setImage(String type) {
  switch (type) {
    case "artistic":
      return const Image(
          image: AssetImage('asset_lib/images/personalityimages/A_Txt.png'),
          fit: BoxFit.scaleDown);
    case "conventional":
      return const Image(
          image: AssetImage('asset_lib/images/personalityimages/C_Txt.png'),
          fit: BoxFit.scaleDown);
    case "enterprising":
      return const Image(
          image: AssetImage('asset_lib/images/personalityimages/E_Txt.png'),
          fit: BoxFit.scaleDown);
    case "investigative":
      return const Image(
          image: AssetImage('asset_lib/images/personalityimages/I_Txt.png'),
          fit: BoxFit.scaleDown);
    case "realistic":
      return const Image(
          image: AssetImage('asset_lib/images/personalityimages/R_Txt.png'),
          fit: BoxFit.scaleDown);
    case "social":
      return const Image(
          image: AssetImage('asset_lib/images/personalityimages/S_Txt.png'),
          fit: BoxFit.scaleDown);
    default:
      return const Image(
          image: AssetImage('asset_lib/images/personalityimages/S_Txt.png'));
  }
}
