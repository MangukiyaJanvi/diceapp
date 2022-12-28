import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List l1 = [
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
    "assets/images/dice6.png",
  ];
  TextEditingController txtn=TextEditingController();
  List dicelist = [];
  List rndlist = [];
  int i = 0,n =0,z=0,sum=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  style: TextStyle(color: Colors.orange),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)
                    ),
                    label: Text("Enter the number",style: TextStyle(color: Colors.orange)),
                  ),
                  controller: txtn,
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    dicelist.clear();
                    rndlist.clear();
                    n=int.parse(txtn.text);
                    setState(() {
                      sum=0;
                      dicelist.length=n;
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange.shade900)),
                    alignment: Alignment.center,
                    child: Text(
                      "Generate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: dicelist
                        .asMap()
                        .entries
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                l1[rndlist.isEmpty?0:rndlist[e.key]],
                                height: 100,
                                width: 100,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    rndlist.clear();
                    setState(() {
                      var rnd =Random();
                      sum=dicelist.length;
                      for(i=0;i<dicelist.length;i++)
                        {
                          z = rnd.nextInt(6);
                          rndlist.add(z);
                          sum=sum+z;
                        }
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange.shade900)),
                    alignment: Alignment.center,
                    child: Text(
                      "Play",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange.shade900)),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sum of all dice",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade900),
                        ),
                        Text(
                          "$sum",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade900),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
