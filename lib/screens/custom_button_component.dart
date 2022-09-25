import 'package:flutter/material.dart';

class CustomButtonComponent extends StatelessWidget {
  final dynamic onPressAction;
  final String label;
  final bool isActive;
  const CustomButtonComponent({
    required this.isActive,
    required this.label,
    required this.onPressAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              isActive ? Colors.lightGreen : Colors.white,
            ),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: const BorderSide(color: Colors.lightGreen),
              ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return Colors.lightGreenAccent;
              },
            ),
          ),
          onPressed: onPressAction,
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.lightGreen,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
