import 'package:flutter/material.dart';
import 'package:game_score/screens/custom_radio_component.dart';

class AddRoundWidget extends StatelessWidget {
  const AddRoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CustomRadio(),
      ],
    );
  }
}
