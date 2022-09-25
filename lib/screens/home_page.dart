import 'package:flutter/material.dart';
import 'package:game_score/notifiers/user_notifier.dart';
import 'package:game_score/screens/add_new_user_widget.dart';
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
            _displayListUsers(),
            const TableWidget(),
          ],
        ),
      ),
      floatingActionButton: const AddNewUserWidget(),
    );
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
