import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themole/globaldata/players.dart';
import 'package:themole/globaldata/random_choice.dart';
import 'package:themole/widgets/itemlistview.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int index = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: 
          index>=playerList.length ?
          ItemShowScreen():
          counter % 2 == 0
              ? Column(
                  children: [
                    Text('Are You ${playerList[index]}'),
                    TextButton(
                        onPressed: (() {
                          setState(() {
                            
                            counter++;
                          });
                        }),
                        child: Text('yes'))
                  ],
                )
              : Column(
                  children: [
                    Text(playerObj[index].isMole?'You are The Mole':'Your Word is $randomChoiceItem'),
                    TextButton(
                        onPressed: (() {
                          setState(() {
                            counter++;
                            index++;
                          });
                        }),
                        child: Text('confirm'))
                  ],
                ),
        ),
      ),
    );
  }
}
