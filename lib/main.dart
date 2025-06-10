//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:memorygame/matching_system.dart';
import 'package:memorygame/play2.dart';
import 'package:memorygame/play3.dart';
import 'package:memorygame/play4.dart';
import 'package:memorygame/score_system.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  String buttonName = "PLAY";
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Memory Matching Game"),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.blue[300],
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "User Name",
                      hintStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30),
                  fixedSize: const Size(200, 75),
                  side: const BorderSide(width: 3, color: Color.fromARGB(255, 6, 125, 221)),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Play();
                      },
                    ),
                  );
                },
                child: Text(buttonName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Memory Matching Game"),
        ),
      ),
      body: Center(
        child: Container(
            color: Colors.blueAccent,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 30),
                    fixedSize: const Size(200, 75),
                    side: const BorderSide(width: 3, color: Color.fromARGB(255, 7, 80, 140)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Cardmatching();
                        },
                      ),
                    );
                  },
                  child: const Text("8-Card"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 30),
                    fixedSize: const Size(200, 75),
                    side: const BorderSide(width: 3, color: Color.fromARGB(255, 246, 100, 148)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Cardmatching2();
                        },
                      ),
                    );
                  },
                  child: const Text("12-Card"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 30),
                    fixedSize: const Size(200, 75),
                    side: const BorderSide(width: 3, color: Color.fromARGB(255, 236, 215, 23)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Cardmatching3();
                        },
                      ),
                    );
                  },
                  child: const Text("16-Card"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 30),
                    fixedSize: const Size(200, 75),
                    side: const BorderSide(width: 3, color: Color.fromARGB(255, 46, 17, 212)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Cardmatching4();
                        },
                      ),
                    );
                  },
                  child: const Text("20-Card"),
                ),
              ],
            )),
      ),
    );
  }
}

class Cardmatching extends StatefulWidget {
  const Cardmatching({super.key});

  @override
  State<Cardmatching> createState() => _CardmatchingState();
}

class _CardmatchingState extends State<Cardmatching> {
  Game _game = Game();

  int tries = 0;
  int unpcard = 8;
  int score = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1EBD39),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                "8-Card",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                scoreBoard("Unpaired Cards", "$unpcard"),
                scoreBoard("Score", "$score"),
              ],
            ),
            SizedBox(
              height: screen_width,
              width: screen_width,
              child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(_game.cards_list[index]);
                      setState(() {
                        tries++;
                        _game.gameImg![index] = _game.cards_list[index];
                        _game.matchCheck.add({index: _game.cards_list[index]});
                      });
                      if (_game.matchCheck.length == 2) {
                        if (_game.matchCheck[0].values.first ==
                            _game.matchCheck[1].values.first) {
                          print("true");
                          score += 100;
                          unpcard -= 2;
                          _game.matchCheck.clear();
                          if (unpcard == 0) {
                            tries -= 8;
                            score -= tries;
                          }
                        } else {
                          print("false");
                          Future.delayed(
                            Duration(milliseconds: 500),
                            () {
                              print(_game.gameImg);
                              setState(
                                () {
                                  _game.gameImg![_game.matchCheck[0].keys
                                      .first] = _game.cardbackside;
                                  _game.gameImg![_game.matchCheck[1].keys
                                      .first] = _game.cardbackside;
                                  _game.matchCheck.clear();
                                },
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFBFF00),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
