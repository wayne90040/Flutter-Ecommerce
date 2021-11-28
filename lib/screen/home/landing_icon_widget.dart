
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';

class LandingIconWidget extends StatelessWidget {

  final String iconSrc;
  final String iconText;
  final GestureTapCallback onTapped;

  const LandingIconWidget({
    Key? key,
    required this.iconSrc,
    required this.iconText,
    required this.onTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(50),
      child: GestureDetector(
        onTap: onTapped,
        child: Column(
            children: [
              AspectRatio(  // 寬高比
                aspectRatio: 1,
                child: Container(
                  child: Image.network(iconSrc, fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 5),
              Text(iconText, textAlign: TextAlign.center)
            ]
        ),
      ),
    );
  }
}
