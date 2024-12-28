import 'package:clinex/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MySectionHeading extends StatelessWidget {
  const MySectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'See All ',
    this.textColor,
    this.showActionButton = true,
    this.onPressed,
  });
  final String title,buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleMedium!.apply(color: textColor,fontWeightDelta: 2,fontSizeFactor: 1.2),maxLines: 1,overflow: TextOverflow.ellipsis,),
        if(showActionButton) TextButton(onPressed: onPressed,style: TextButton.styleFrom(foregroundColor: Colors.blue), child: Text(buttonTitle,style: TextStyle(color: primaryColor,))),
      ],
    );
  }
}