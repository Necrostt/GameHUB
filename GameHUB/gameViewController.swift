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
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func setDiceNumberToAppear(){
        
    }
    
    
    @IBAction func throwDiceButton(_ sender: UIButton) {
    }
    
    
}
