import UIKit



class settingsViewController: UIViewController {

    @IBOutlet weak var diceNumberImageView: UIImageView!
    @IBOutlet weak var roundNumberImageView: UIImageView!
    @IBOutlet weak var playerNumberSelect: UIButton!
    
     var playerNumber: String = "2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onPlayerNumberSelect()
     
    }
    
    func onPlayerNumberSelect(){
//        closure - Define a ação a ser realizada ao selecionar a opção do menu
        let optionClosure = { (action: UIAction) in
                print("Pop-up action")
//            armazena a seleção do usuario numa variavel para que a info seja enviada para a próxima ViewController
            self.playerNumber = action.title
            print(self.playerNumber)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    
    @IBAction func defineSettingsBtn(_ sender: UIButton) {
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
    }
    
}
