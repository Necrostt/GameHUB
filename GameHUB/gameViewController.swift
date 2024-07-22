import UIKit

class gameViewController: UIViewController {
    
    
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var leftImageStack: UIStackView!
    @IBOutlet weak var rightImageStack: UIStackView!
    
    @IBOutlet var leftImageViews: [UIImageView]!
    @IBOutlet var rightImageViews: [UIImageView]!
    
    
    private var diceGameManager = DiceGameManager()
//    cria uma lista com cada jogador de acordo com o numero de jogadores previamente definido
    var playerList: [Int] = []
//    armazena o index do atual jogador em jogo
    var currentPlayerIndex: Int = 0
    var totalRounds: Int = 0
    
    
    var numberOfPlayers: Int {
        get {
            return self.diceGameManager.playerNumber
        }
        set (newValue){
            self.diceGameManager.playerNumber =  newValue
        }
    }
    var dicesToPlay: Int {
        get {
            return self.diceGameManager.dicesToPlay
        }
        set (newValue) {
            self.diceGameManager.dicesToPlay = newValue
        }
    }
    var roundsToPlay: Int {
        get {
            return self.diceGameManager.roundsToPlay
        }
        set (newValue) {
            self.diceGameManager.roundsToPlay = newValue
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        showRoundsToPlay()
        showPlayerToPlay()
        hideImageStacks()
        
        showRoundsToPlay(roundNumber: roundsToPlay)
        createPlayerList()
        showPlayerToPlay(playerNumber: playerList[0])
        
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //    metodo controla o numero de ImageViews que aparecem baseado no numero de dados a serem jogados
    func setDicesToAppear(){
        switch dicesToPlay {
        case 0:
            leftImageStack.isHidden = true
            rightImageStack.isHidden = true
        case 1:
            leftImageStack.isHidden = true
            rightImageViews[0].isHidden = true
            rightImageViews[2].isHidden = true
        case 2:
            leftImageStack.isHidden = true
            rightImageViews[1].isHidden = true
        case 3:
            rightImageStack.isHidden = true
        case 4:
            rightImageViews[1].isHidden = true
            leftImageViews[1].isHidden = true
        case 5:
            rightImageViews[2].isHidden = true
        default:
            return
        }
    }
    
    //    Verifica o estado das imageStackViews, se estiverem hidden, torna-as visiveis
    func checkStackViewHiddenState(){
        if leftImageStack.isHidden, rightImageStack.isHidden{
            leftImageStack.isHidden = false
            rightImageStack.isHidden = false
        }
    }
    
    //    oculta as imagestacks
    func hideImageStacks(){
        leftImageStack.isHidden = true
        rightImageStack.isHidden = true
    }
    //    mostra a rounds label com o numero de rodadas a serem jogadas
    func showRoundsToPlay(roundNumber: Int = 0){
        roundsLabel.text = "Rounds: \(roundNumber)"
    }
    
    //    mostra a player label com o jogador a jogar no momento
    func showPlayerToPlay(playerNumber: Int = 0){
        
        playerLabel.text = "Jogador: \(playerNumber)"
    }
    //    cria uma lista com os jogadores a jogar
    func createPlayerList(){
        for number in 1...numberOfPlayers{
            playerList.append(number)
            print(playerList)
        }
    }
    
    
    
    func updateGameLabels() {
//        usa o index do atual jogador em jogo para mostrar na tela o seu respectivo numero
        let currentPlayer = playerList[currentPlayerIndex]
        showPlayerToPlay(playerNumber: currentPlayer)
        showRoundsToPlay(roundNumber: roundsToPlay)
    }
    
    
    func resetGame() {
        currentPlayerIndex = 0
        roundsToPlay = diceGameManager.roundsToPlay
        hideImageStacks()
        updateGameLabels()
    }
    
    func updateRoundsToPlayLabel(rounds: Int){
        var showRound = rounds
        if showRound > 0 {
            showRound -= 1
            showRoundsToPlay(roundNumber: rounds)
            
        }
        
    }
    
    @IBAction func throwDiceButton(_ sender: UIButton) {
//       var totalRounds = roundsToPlay
//        let fixedTotalRounds = totalRounds
        var control = 0
        
        if roundsToPlay >= 0 {
            roundsToPlay -= 1
            showRoundsToPlay(roundNumber: roundsToPlay)
            
        }
        if roundsToPlay == -1 {
            if currentPlayerIndex < playerList.count - 1{
                print(playerList.count)
                print(currentPlayerIndex)
                currentPlayerIndex += 1
                showPlayerToPlay(playerNumber: playerList[currentPlayerIndex])
                showRoundsToPlay(roundNumber: totalRounds)
                roundsToPlay = totalRounds
                print(control)
            } else if currentPlayerIndex == playerList.count - 1, roundsToPlay == -1 {
                control = 1
                showRoundsToPlay(roundNumber: 0)
            }
            
            if control == 1 {
                performSegue(withIdentifier: "highScoreSegue", sender: nil)
            }
        }
        
                
        
        
    }
}
