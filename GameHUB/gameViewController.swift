import UIKit

class gameViewController: UIViewController {
    
    
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var leftImageStack: UIStackView!
    @IBOutlet weak var rightImageStack: UIStackView!
    
    @IBOutlet var leftImageViews: [UIImageView]!
    @IBOutlet var rightImageViews: [UIImageView]!
    
    
    private var diceGameManager = DiceGameManager()
    
    var playerList: [Int] = []
    var playerIndex: Int = 0
    
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
        
        showRoundsToPlay(roundNumber: diceGameManager.dicesToPlay)
        showPlayerToPlay(playerNumber: diceGameManager.playerNumber)
        createPlayerList()
        
        
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
        switch diceGameManager.dicesToPlay {
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
        for number in 1...diceGameManager.playerNumber{
            playerList.append(number)
        }
    }
    
    
    
    func updateGameLabels() {
        let currentPlayer = playerList[playerIndex]
        showPlayerToPlay(playerNumber: currentPlayer)
        showRoundsToPlay(roundNumber: diceGameManager.roundsToPlay)
    }
    
    
    func resetGame() {
        playerIndex = 0
        diceGameManager.roundsToPlay = roundsToPlay
        hideImageStacks()
        updateGameLabels()
    }
    
    
    @IBAction func throwDiceButton(_ sender: UIButton) {
        
        if diceGameManager.roundsToPlay > 0 {
            checkStackViewHiddenState()
            setDicesToAppear()
            diceGameManager.roundsToPlay -= 1
            showRoundsToPlay(roundNumber: diceGameManager.roundsToPlay)
        } else {
                performSegue(withIdentifier: "highScoreSegue", sender: nil)
            }
        
        
        
    }
}
