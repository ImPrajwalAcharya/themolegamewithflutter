import 'package:flutter/material.dart';

import 'package:themole/globaldata/players.dart';
import 'package:themole/globaldata/random_choice.dart';
import 'package:themole/main.dart';
import 'package:themole/screens/catrgories_screen.dart';
import 'package:themole/screens/welcome_screen.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    if (moleAns == randomChoiceItem) {
      playerObj.firstWhere((element) => element.isMole).score += 5;
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Center(
              child: Text('The Word Was $randomChoiceItem'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Name'),
                Text('Score'),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: playerObj.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(playerObj[index].name),
                    Text(playerObj[index].score.toString())
                  ],
                );
              },
            )),
            TextButton(
                onPressed: (() {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) {
                        // playerObj.clear();
                        // playerList.clear();
                        // moleAns = '';

                        return CategoryScreen();
                      }),
                    ),
                  );
                }),
                child: Text('Replay'))
          ],
        ),
      ),
    );
  }
}
