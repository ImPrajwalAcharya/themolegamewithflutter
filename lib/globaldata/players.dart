import 'dart:math';

import 'package:themole/models/player_model.dart';

List<String> playerList = [];

List<Player> playerObj = [];

void makePlayers() {
  print(playerList.length);
  int index = Random().nextInt(playerList.length);
  print(index);
  playerList.forEach((element) {
    playerObj.add(Player(name: element));
  });
  playerObj[index].isMole = true;
  playerObj.forEach((element) {
    print(element.name +"  "+ element.isMole.toString());
  });
}
