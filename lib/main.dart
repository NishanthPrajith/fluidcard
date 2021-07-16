import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int turns = 0;
  bool check = false;
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Random random = new Random();
    final children = <Widget>[];

    for (var i = 0; i < 5; i++) {
      children.add(new AnimatedContainer(
        duration: Duration(milliseconds: 1300),
        margin: EdgeInsets.only(top: 150, left: random.nextDouble() * 220),
        width: (check ? 0 : 80),
        height: 80,
        color: Color(0xff3733a3)
      ));
    }

    for (var i = 0; i < 8; i++) {
      children.add(new AnimatedContainer(
        duration: Duration(milliseconds: 1300),
        margin: EdgeInsets.only(top: 150, right: random.nextDouble() * 220),
        width: (check ? 0 : 80),
        height: 80,
        color: Color(0xff3733a3)
      ));
    }

    return Scaffold(
      body: Container (
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Remember Words',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Spacer(
              flex: 2
            ),
            Expanded(
              flex: 14,
              child: Container (
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack (
                  alignment: Alignment.center,
                  children: [
                    Stack (
                      children : children,
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      margin: EdgeInsets.fromLTRB(40, (check ? 370 : 0), 40, 0),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Container (
                        alignment: Alignment.bottomCenter,
                        width: double.maxFinite,
                        height: 150,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xff3733a3)
                      ),
                        child: Column (
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text (
                              "An armchair",
                              style: TextStyle (
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              )
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text (
                              "Mi papa compro un sillon y una mesa de centro para la sala.",
                              textAlign: TextAlign.center,
                              style: TextStyle (
                                fontSize: 15,
                                color: Colors.white
                              )
                            )
                          ]
                        )
                      )
                    ),
                    AnimatedContainer(
                      width: double.maxFinite,
                      height: 300,
                      duration: Duration(seconds: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xff3733a3)
                      ),
                      margin: EdgeInsets.fromLTRB(40, 0, 40, (check ? 220 : 28)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Un sillon",
                            style: TextStyle (
                              color: Colors.white,
                              fontSize: 37,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Row (
                            children: [
                              Spacer(
                                flex: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  onPressed: () {
                                    print("speak");
                                  },
                                  icon: Icon(
                                    Icons.volume_up,
                                    size: 22,
                                    color: Color(0xff7372c3)
                                  )
                                ),
                              ),
                              Expanded (
                                flex: 4,
                                child: Text(
                                  "see-yohn",
                                  style: TextStyle (
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  ),
                                )
                              ),
                              Spacer(
                                flex: 5,
                              ),
                            ]
                          ),
                        ]
                      )
                    ),
                    AnimatedContainer(
                      width: 56,
                      height: 56,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(top: (check ? 75 : 270)),
                      duration: Duration(seconds: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 60.0,
                            spreadRadius: 0.0,
                          )
                        ],
                        color: Colors.white
                      ),
                      child: RotatedBox (
                        quarterTurns: turns,
                        child: IconButton(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(0),
                          onPressed: () => {
                            setState(() {
                              turns = (turns + 2) % 4;
                              check = !check;
                              print(check);
                            })
                          }, 
                          icon: Icon (
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                          )
                        )
                      )
                    ),
                  ],
                ),
              )
            ),
            Spacer(
              flex: 2
            ),
            Expanded (
              flex: 1,
              child: Text(
                '4 / 10',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Spacer(
              flex: 1
            ),
            
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
