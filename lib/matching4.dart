
class Game4{
  final String cardbackside = "images/cardbackside4.png";
  List<String>? gameImg;

  final List<String> cards_list = [
    "images/number-5.png",
    "images/number-7.png",
    "images/number-9.png",
    "images/number-4.png",
    "images/number-1.png",
    "images/number-6.png",
    "images/number-8.png",
    "images/number-2.png",
    "images/number-3.png",
    "images/number-10.png",
    "images/number-1.png",
    "images/number-6.png",
    "images/number-7.png",
    "images/number-5.png",
    "images/number-4.png",
    "images/number-3.png",
    "images/number-2.png",
    "images/number-9.png",
    "images/number-8.png",
    "images/number-10.png",
  ];

  List<Map<int,String>> matchCheck = [];

  final cardCount = 20;

  void initGame(){
    gameImg = List.generate(cardCount, (index) => cardbackside);
  }
}