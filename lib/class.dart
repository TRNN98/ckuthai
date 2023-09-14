import 'package:appbase/class/sizes.dart';
import 'package:flutter/material.dart';

class Texty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Text('This works'));
  }
}

class MyExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/hbg3.png');
    var image = new Image(image: assetsImage, width: 48.0, height: 48.0);
    return new Container(child: image);
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  // Widget build(BuildContext context) {
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    bool tabletMode = rect. width > 600;
    print(rect.width);

    final double innerCircleRadius = tabletMode == true ? 300 : 130;
    Path path = Path();
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
        rect.height + 15, rect.width / 2 - (tabletMode == true ? 160 : 60), rect.height + 50);
    path.cubicTo(
        rect.width / 2 - 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + (tabletMode == true ? 160 : 60),
        rect.height + 50);
        
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
        rect.height + 15, rect.width , rect.height);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}
// }



class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-40);
    path.quadraticBezierTo(size.width / 4, size.height,
        size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}





 // Padding(
          //   padding: const EdgeInsets.only(bottom: 2.0),
          //   child: ClipPath(
          //     // clipper: ClippingClass(),
          //     child: Container(
          //       width: MediaQuery.of(context).size.width,
          //       height: displayHeight(context) * 0.25,
          //       decoration: BoxDecoration(
          //           image: DecorationImage(
          //         fit: BoxFit.fill,
          //         image: AssetImage("assets/imgs/hbg3.png"),
          //       )),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: 0.0,
          //   left: 0.0,
          //   right: 0.0,
          //   child: AppBar(
          //     backgroundColor: Colors.transparent,
          //     elevation: 0.0,
          //   ),
          // ),
          // Container(
          //     alignment: Alignment.topCenter,
          //     padding: const EdgeInsets.only(top: 60),
          //     child: Image.asset('assets/imgs/loan.png',
          //         width: tabletMode == true
          //             ? displayWidth(context) * 0.2
          //             : displayWidth(context) * 0.3,
          //         height: tabletMode == true
          //             ? displayWidth(context) * 0.2
          //             : displayWidth(context) * 0.3)),
