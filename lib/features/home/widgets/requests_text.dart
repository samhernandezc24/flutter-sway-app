import 'package:flutter/material.dart';
import 'package:flutter_sway_app/core/constants/app_colors.dart';

class RequestsText extends StatelessWidget {
  const RequestsText({
    Key? key,
    required this.requests,
    this.color = AppColors.secondaryColor,
  }) : super(key: key);

  final int requests;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var colorToUse =
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? color
            : AppColors.whiteColor;
    return Row(
      children: <Widget>[
        Text(
          '$requests',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: colorToUse),
        ),
      ],
    );
  }
}
