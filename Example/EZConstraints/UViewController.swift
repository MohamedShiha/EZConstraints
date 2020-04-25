
import UIKit

class UViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapEasyBtn(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "easy") as? EasyExampleViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func didTapMediumBtn(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "medium") as? MediumExampleViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
