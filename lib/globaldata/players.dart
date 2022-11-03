import 'dart:math';

import 'package:themole/models/player_model.dart';

List<String> playerList = [];

List<Player> playerObj = [];

void makePlayers() {
  playerList.forEach((element) {
    playerObj.add(Player(name: element));
  });

  playerObj.forEach((element) {
    print(element.name + "  " + element.isMole.toString());
  });
}

void makemole() {
  playerObj.forEach((element) {
    element.isMole = false;
  });
  int index = Random().nextInt(playerList.length);
  playerObj[index].isMole = true;
}
