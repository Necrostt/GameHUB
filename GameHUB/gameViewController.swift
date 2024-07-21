import UIKit

class gameViewController: UIViewController {
    
    @IBOutlet weak var leftImageStack: UIStackView!
    @IBOutlet weak var rightImageStack: UIStackView!
    
    @IBOutlet var leftImageViews: [UIImageView]!
    @IBOutlet var rightImageViews: [UIImageView]!
    
    
    
    
    var numberOfPlayers: Int = 0
    var dicesToPlay: Int = 0
    var roundsToPlay: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
       
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        setDicesToAppear()
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
    
    
    @IBAction func throwDiceButton(_ sender: UIButton) {
    }
    
    
}
