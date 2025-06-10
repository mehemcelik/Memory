
class Game2{
  final String cardbackside = "images/cardbackside2.png";
  List<String>? gameImg;


  final List<String> cards_list = [
    "images/number-1.png",
    "images/number-5.png",
    "images/number-4.png",
    "images/number-3.png",
    "images/number-2.png",
    "images/number-6.png",
    "images/number-4.png",
    "images/number-6.png",
    "images/number-3.png",
    "images/number-1.png",
    "images/number-5.png",
    "images/number-2.png",

  ];

  List<Map<int,String>> matchCheck = [];

  final cardCount = 12;

  void initGame(){
    gameImg = List.generate(cardCount, (index) => cardbackside);
  }
}