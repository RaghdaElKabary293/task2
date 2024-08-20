import 'package:flutter/material.dart';

class task2 extends StatefulWidget {
  const task2({super.key});

  @override
  State<task2> createState() => _task2State();
}

class _task2State extends State<task2> {

  static int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Slider"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage("assets/$index.jpg"),
                    fit: BoxFit.cover,
                )
              ),
            ),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(index>1)
                        index--;
                      else
                        index=3;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_left,
                      size: 70,
                    ),
                  ),
                ),

                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.pause,
                    size: 70,
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(index<3)
                        index++;
                      else
                        index = 1;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_right,
                      size: 70,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
