import UIKit



class settingsViewController: UIViewController {

    @IBOutlet weak var diceNumberImageView: UIImageView!
    @IBOutlet weak var roundNumberImageView: UIImageView!
    @IBOutlet weak var playerNumberSelect: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    private var diceGameManager = DiceGameManager()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onPlayerNumberSelect()
     
    }
    
    func onPlayerNumberSelect(){
//        closure - Define a ação a ser realizada ao selecionar a opção do menu
        let optionClosure = { (action: UIAction) in
                print("Pop-up action")
//            armazena a seleção do usuario numa variavel para que a info seja enviada para a próxima ViewController
            self._playerNumber = Int(action.title) ?? 0
            print(self._playerNumber)
            }
//            Popula o menu com as opções desejadas
            playerNumberSelect.menu = UIMenu(children: [
                UIAction(title: "2", handler: optionClosure),
                UIAction(title: "3", handler: optionClosure),
                UIAction(title: "4", handler: optionClosure),
                UIAction(title: "5", handler: optionClosure),
                UIAction(title: "6", handler: optionClosure),
            ])
            playerNumberSelect.showsMenuAsPrimaryAction = true
    }
    

    
//    metodo para atualizar a imageView com o dado respectivo ao lançamento
    func updateDiceImageView(this imageView: UIImageView) -> Int{
        let throwResult = diceGameManager.diceSelector()
        imageView.image = UIImage(named: "dado" + String(throwResult))
        
//        Retorna o resultado do lançamento do dado para popular os parâmetros do jogo,
//        numero de dados e rounds a serem jogados
        return throwResult
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVC = segue.destination as? gameViewController else {return}
        gameVC.numberOfPlayers = _playerNumber
        gameVC.dicesToPlay = _dicesToPlay ?? 0
        gameVC.roundsToPlay = _roundsToPlay ?? 0
    }
    
   
    
    @IBAction func defineSettingsBtn(_ sender: UIButton) {
//        Lança os dados para definir os parâmetros de numero de dados e numero de rounds a serem jogados e atualiza a ImageView com os respetivos dados
        _dicesToPlay =  updateDiceImageView(this: diceNumberImageView)
        _roundsToPlay =  updateDiceImageView(this: roundNumberImageView)
        
//        Torna as ImageViews visíveis
        diceNumberImageView.isHidden = false
        roundNumberImageView.isHidden = false
//      torna o botão Jogar visivel apenas se os parâmetros forem definidos
        guard let _dicesToPlay else {return}
        guard let _roundsToPlay else {return}
        guard _playerNumber != 0 else {return}
//        guard  case _dicesToPlay ,  case _roundsToPlay, _playerNumber != 0 else {return}
        playButton.isHidden = false
        
        settingsButton.isHidden = true
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
    }
    
}
