import 'package:flutter/material.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class WizhChip extends StatelessWidget {
  const WizhChip({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.text,
    this.isDense = true,
    this.prefixWidget,
  });

  final bool selected;
  final Function(bool) onSelected;
  final String text;
  final Widget? prefixWidget;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: EdgeInsets.symmetric(horizontal: size8, vertical: size4),
      avatar: prefixWidget,
      label: Text(
        text,
        style: TextStyle(
          color: selected ? WizhColor.isabelline : WizhColor.eerieBlack,
          fontSize: size12,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(size12),
      ),
      selectedColor: WizhColor.beaver,
      showCheckmark: false,
      onSelected: onSelected,
      backgroundColor: WizhColor.whiteSmoke,
      selected: selected,
      visualDensity: VisualDensity(horizontal: 0, vertical: isDense ? -4 : 0),
    );
  }
}
