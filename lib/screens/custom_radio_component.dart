import 'package:flutter/material.dart';
import 'package:game_score/notifiers/user_notifier.dart';
import 'package:game_score/screens/custom_button_component.dart';
import 'package:provider/provider.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({Key? key}) : super(key: key);

  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  String _selectedUserName = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Consumer<UserNotifier>(
        builder: (context, userNotifier, child) => ListView.builder(
          itemCount: userNotifier.listUser.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomButtonComponent(
                isActive: _selectedUserName == userNotifier.listUser[index].name,
                label: userNotifier.listUser[index].name,
                onPressAction: () {
                  setState(() {
                    _selectedUserName = userNotifier.listUser[index].name;
                  });
                });
          },
        ),
      ),
    );
  }
}
