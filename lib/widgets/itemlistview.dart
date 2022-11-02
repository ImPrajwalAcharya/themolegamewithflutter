import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themole/globaldata/random_choice.dart';

class ItemShowScreen extends StatelessWidget {
  const ItemShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Expanded(
          
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 2,),
                itemCount: randomChoiceCategory!.items.length,
            itemBuilder: (context, index) {
              return Container(child: Text(randomChoiceCategory!.items[index]));
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.1,
          child: TextButton(onPressed: () {
            
          }, child: Text('Proceed')),
        )
        
      ],
    );
  }
}
