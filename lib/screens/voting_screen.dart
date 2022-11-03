import 'package:flutter/material.dart';
import 'package:themole/globaldata/players.dart';
import 'package:themole/screens/score_screen.dart';
import 'package:themole/widgets/itemlistview.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  int indexs = 0;
  int? istapped;
  List<bool> values = playerObj.map((e) => false).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: indexs < playerObj.length
            ? Column(
                children: [
                  Text('Please Vote ' + playerObj[indexs].name),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.3,
                          15,
                          MediaQuery.of(context).size.width * 0.3,
                          0),
                      child: ListView.builder(
                        itemCount: playerObj.length,
                        itemBuilder: (context, index) {
                          if (playerObj[indexs].name != playerObj[index].name) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    istapped = index;
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    color: istapped == index
                                        ? Colors.green
                                        : Colors.grey,
                                    child: Text(playerObj[index].name)));
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: (() {
                        if (playerObj[indexs].isMole) {
                        } else {
                          if (playerObj[istapped!].isMole) {
                            playerObj[indexs].score =
                                playerObj[indexs].score + 1;
                          } else {
                           playerObj.firstWhere((element) => element.isMole).score +=1 ;
                          }
                        }

                        setState(() {
                          indexs++;

                          values = playerObj.map((e) => false).toList();
                        });
                      }),
                      child: Text('Confirm'))
                ],
              )
            : Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text('Mole is ' +
                            playerObj
                                .firstWhere((element) => element.isMole)
                                .name),
                        Text('Please Guess The Word')
                      ],
                    ),
                  ),
                  Expanded(child: ItemShowScreen()),
                  Container(
                    child: Center(
                      child: TextButton(
                          onPressed: (() {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return ScoreScreen();
                              },
                            ));
                          }),
                          child: Text('Confirm')),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
