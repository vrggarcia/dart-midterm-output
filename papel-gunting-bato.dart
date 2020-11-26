import 'dart:io';
import 'dart:math';

enum Move { papel, gunting, bato }
void main() {
  final rng = Random();
  int yourscore=0;
  int aiscore=0;
  
  print("Papel-Gunting-Bato");
  print("How many rounds do you want to play?");
  int roundCount= int.parse(stdin.readLineSync());
  
  for(int i=1; i<=roundCount; i++) {  
    String round = i.toString(); 
    
    print("\nRound " + round);
    
    stdout.write('Papel, Gunting, Bato! What is your Pick? (Q for Quit)\n');
    final input = stdin.readLineSync();
    
    if (input == 'Papel' || input=='papel' || input=='PAPEL'|| input == 'Gunting' || input=='gunting' || input=='GUNTING' || input == 'Bato' || input=='bato' || input=='BATO') {
      var playerMove;
      if (input == 'Bato' || input=='bato' || input=='BATO') {
        var result = Move.bato;
        playerMove = "Bato";
      } else if (input == 'Papel'|| input=='papel' || input=='PAPEL') {
        var result = Move.papel;
        playerMove = "Papel";
      } else if (input == 'Gunting'|| input=='gunting' || input=='GUNTING') {
        var result = Move.gunting;  
        playerMove = "Gunting" ;
      }
      else{
          return;
      }
      
      final random = rng.nextInt(3);
      var aiMove;
    if(random==0){
        var result = Move.bato;
        aiMove= "Bato";
    }
    else if (random==1){
        var result = Move.papel;
        aiMove= "Papel";
    }
    else{
        var result = Move.gunting;
        aiMove= "Gunting";
    }
      
      print('You: $playerMove');
      print('Bot: $aiMove');
      
      if (playerMove == aiMove) {
        print("Result: It's a tie\n");
          
      } else if (playerMove == "Bato" && aiMove == "Gunting"){
         yourscore+=1; 
        print("You Win!\n");
      } else if (playerMove == "Gunting" && aiMove == "Papel") {
         yourscore+=1; 
         print("You Win!\n");
      } else if (playerMove == "Papel" && aiMove == "Bato") {
         yourscore+=1; 
         print("You Win!\n");
      } else {  
         aiscore+=1; 
         print("You lose!\n");
      }
    } else if (input == 'Q') {
      break;
    } else {
      print('Result: Invalid input\n');
    }
  }
  print("You: $yourscore Bot: $aiscore");
   if(yourscore==aiscore){
          print("Its a tie!");
      }
      else if(yourscore>aiscore){
          print("You win.");
      }
      else{
          print("You lose.");
      }
  
}
