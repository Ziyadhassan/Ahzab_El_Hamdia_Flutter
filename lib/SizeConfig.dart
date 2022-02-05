// import 'package:flutter/widgets.dart';
// // from below link
// // https://github.com/dancamdev/effectively_scale_UI_according_to_different_screen_sizes/blob/master/lib/SizeConfig.dart
// class SizeConfig {
//   late static MediaQueryData _mediaQueryData;
//   late static double screenWidth;
//   late static double screenHeight;
//   late static double blockSizeHorizontal;
//   late static double blockSizeVertical;
//   late static double _safeAreaHorizontal;
//   late static double _safeAreaVertical;
//   late static double safeBlockHorizontal;
//   late static double safeBlockVertical;
//
//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//     blockSizeHorizontal = screenWidth / 100;
//     blockSizeVertical = screenHeight / 100;
//
//     _safeAreaHorizontal = _mediaQueryData.padding.left +
//         _mediaQueryData.padding.right;
//     _safeAreaVertical = _mediaQueryData.padding.top +
//         _mediaQueryData.padding.bottom;
//     safeBlockHorizontal = (screenWidth -
//         _safeAreaHorizontal) / 100;
//     safeBlockVertical = (screenHeight -
//         _safeAreaVertical) / 100;
//   }
// }
