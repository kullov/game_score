import 'package:flutter/material.dart';
import 'package:game_score/models/user.dart';
import 'package:game_score/notifiers/user_notifier.dart';
import 'package:provider/provider.dart';

class AddNewUserWidget extends StatefulWidget {
  const AddNewUserWidget({Key? key}) : super(key: key);

  @override
  State<AddNewUserWidget> createState() => _AddNewUserWidgetState();
}

class _AddNewUserWidgetState extends State<AddNewUserWidget> {
  final _nameControllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onClickAddButton,
      child: const Text('Add new user'),
    );
  }

  void _onClickAddButton() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _nameControllerText,
                            maxLength: 100,
                            autofocus: true,
                            decoration: const InputDecoration(
                              // border: InputBorder.none,
                              hintText: 'Nhập tên người chơi',
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return _isInValidName();
                            },
                          ),
                          SizedBox(
                            // width: 320.0,
                            child: ElevatedButton(
                              onPressed: () => _handleAddUser(ctx),
                              child: const Text(
                                "Thêm",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 14.0,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.close, color: Colors.lightGreen),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  _isInValidName() {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    bool isContain = userNotifier.listUser
        .any((u) => u.name == _nameControllerText.text.trim());
    if (_nameControllerText.text.isEmpty) {
      return 'Không được để trống tên!';
    }
    if (isContain) {
      return 'Tên bị trùng, vui lòng nhập tên khác!';
    }
    return null;
  }

  _handleAddUser(ctx) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    if (_isInValidName() != null) {
      return;
    }

    userNotifier.addNewUser(
      User(
        name: _nameControllerText.text,
        score: 0,
      ),
    );
    setState(() {
      _nameControllerText.clear();
    });
    Navigator.pop(ctx);
  }
}
