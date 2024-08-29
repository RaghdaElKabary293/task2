import 'package:flutter/material.dart';
import '../data/items_model.dart';
import 'mytext.dart';

class myCard extends StatelessWidget {
  myCard({super.key, required this.items});

  ItemsModel? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 150,
              child: Image.asset('${items?.image}')),
          Divider(color: Colors.black, thickness: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              myText(data: "${items?.name}"),
              myText(
                data: "${items?.color}",
              ),
            ],
          )
        ],
      ),
    );
  }
}
