import 'package:flutter/material.dart';
import 'package:memorygame/matching3.dart';
import 'package:memorygame/score_system.dart';

class Cardmatching3 extends StatefulWidget {
  const Cardmatching3({super.key});

  @override
  State<Cardmatching3> createState() => _CardmatchingState();
}

class _CardmatchingState extends State<Cardmatching3> {
  Game3 _game = Game3();

  int tries = 0;
  int unpcard = 16;
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
      backgroundColor: Color(0xFFC70003),
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
                "16-Card",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 2.0,),
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
                    crossAxisCount: 4,
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
                            _game.matchCheck
                                .add({index: _game.cards_list[index]});
                          });
                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              print("true");
                              score += 100;
                              unpcard -= 2;
                              _game.matchCheck.clear();
                              if (unpcard == 0){
                                tries -= 16;
                                score -= tries;
                              }
                            } else {
                              print("false");
                              Future.delayed(Duration(milliseconds: 500), () {
                                print(_game.gameImg);
                                setState(() {
                                  _game.gameImg![_game.matchCheck[0].keys
                                      .first] = _game.cardbackside;
                                  _game.gameImg![_game.matchCheck[1].keys
                                      .first] = _game.cardbackside;
                                  _game.matchCheck.clear();
                                });
                              });
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 117, 255, 62),
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image: AssetImage(_game.gameImg![index]),
                                  fit: BoxFit.cover)),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}