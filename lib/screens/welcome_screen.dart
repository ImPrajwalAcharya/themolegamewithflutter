import 'package:flutter/material.dart';
import 'package:themole/globaldata/players.dart';
import 'package:themole/screens/catrgories_screen.dart';
import 'package:themole/widgets/playersform.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int itemcount = 3;
  final _form = GlobalKey<FormState>();
  final List<TextEditingController> _playername = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
                color: Colors.white,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Icon(Icons.cabin)),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.topCenter,
                  color: Colors.blue,
                  child: Scaffold(
                    floatingActionButton: FloatingActionButton(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.brown,
                      child: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _playername.add(TextEditingController());
                          itemcount++;
                        });
                      },
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                    body: Form(
                        key: _form,
                        child: ListView.builder(
                            itemCount: itemcount,
                            itemBuilder: ((context, index) {
                              return Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 24),
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: TextFormField(
                                      controller: _playername[index],
                                      decoration: InputDecoration(
                                          hintText: 'Enter your name'),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: (() {
                                      if (itemcount > 3) {
                                        setState(() {
                                          int i = 0;
                                          _playername.forEach((element) {
                                            if (i >= index ||
                                                itemcount < i + 1) {
                                              _playername[index].text =
                                                  _playername[index + 1].text;
                                            }
                                            i++;
                                            //
                                          });
                                          itemcount--;
                                          _playername[itemcount].clear();
                                        });
                                      }
                                    }),
                                    icon: Icon(Icons.delete_outline),
                                  )
                                ],
                              );
                            }))),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.brown,
              child: Center(
                  child: TextButton(
                child: Text('PLAY'),
                onPressed: () {
                  playerList.clear();

                  _playername.forEach((element) {
                    playerList.add(element.text);
                  });
                  makePlayers();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) {
                        return CategoryScreen();
                      }),
                    ),
                  );
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}
