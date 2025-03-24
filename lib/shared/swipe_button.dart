import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class WizhSwipeButton extends StatelessWidget {
  const WizhSwipeButton({super.key, required this.text, required this.onSwipe});

  final String text;
  final Function()? onSwipe;

  @override
  Widget build(BuildContext context) {
    return SwipeButton(
      thumbPadding: EdgeInsets.all(size4),
      thumb: Icon(Icons.chevron_right, color: WizhColor.springWood),
      elevationThumb: size4,
      elevationTrack: size4,
      activeTrackColor: WizhColor.darkLava,
      activeThumbColor: WizhColor.lightBeaver,
      onSwipe: onSwipe,
      child: Text(
        text,
        style: TextStyle(color: WizhColor.springWood, fontSize: size16),
      ),
    );
  }
}
