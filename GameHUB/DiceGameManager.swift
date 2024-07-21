import Foundation

struct DiceGameManager {
    
    var _playerNumber: Int = 2
    var _dicesToPlay: Int?
    var _roundsToPlay: Int?
   var playerNumber: Int {
       return _playerNumber
   }
//    ForceUnwrap usado pois o safeUnwrap foi garantido na linha 88, liberando o acesso ao botão Jogar. variaveis dicesToPlay e roundsToPlay serão usadas apenas no metodo prepare, que  é condicionado ao uso do botao Jogar.
   fileprivate var dicesToPlay: Int{
       return _dicesToPlay!
   }
   fileprivate var roundsToPlay: Int{
       return _roundsToPlay!
   }
   
   
    //    metodo para selecionar configurações por lançamento de dado
        func diceSelector() -> Int{
    //        cria objeto a partir da struct DiceGame para acesso ao método throwDice
            let dice = DiceGame()
            return dice.throwDice()
        }
    
    
}
