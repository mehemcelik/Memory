
class Game{
  final String cardbackside = "images/cardbackside.png";
  List<String>? gameImg;


  final List<String> cards_list = [
    "images/number-1.png",
    "images/number-2.png",
    "images/number-3.png",
    "images/number-4.png",
    "images/number-1.png",
    "images/number-2.png",
    "images/number-3.png",
    "images/number-4.png",
  ];

  List<Map<int,String>> matchCheck = [];

  final cardCount = 8;

  void initGame(){
    gameImg = List.generate(cardCount, (index) => cardbackside);
  }
}