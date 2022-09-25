import 'package:flutter/material.dart';
import 'package:game_score/notifiers/user_notifier.dart';
import 'package:game_score/screens/add_new_user_widget.dart';
import 'package:game_score/screens/add_round_widget.dart';
import 'package:game_score/screens/table_widget.dart';
import 'package:game_score/utils/common.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game Score'.toUpperCase(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _addNewRound(context),
            _displayListUsers(),
            const TableWidget(),
          ],
        ),
      ),
      floatingActionButton: const AddNewUserWidget(),
    );
  }

  Widget _addNewRound(context) {
    return ElevatedButton(
      onPressed: () => _onClickAddNewRoundButton(context),
      child: const Text('Add new round'),
    );
  }

  void _onClickAddNewRoundButton(context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  const AddRoundWidget(),
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

  Widget _displayListUsers() {
    return Consumer<UserNotifier>(
        builder: (_, userNotifier, child) => ListView.builder(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: userNotifier.listUser.length,
            itemBuilder: (BuildContext context, int index) {
              final user = userNotifier.listUser[index];
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('${user.name} - ${user.score}')),
              );
            }));
  }
}
