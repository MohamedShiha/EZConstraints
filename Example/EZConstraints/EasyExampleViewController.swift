
import UIKit
import EZConstraints

class EasyExampleViewController: UIViewController {

    // MARK: Views
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boxView.layer.cornerRadius = 8
        layoutWithEZConstraints()
//        layoutWithAutoLayout()
    }

    // MARK: Layout Views
    
    private func layoutWithEZConstraints() {
        
        // This is how it looks like when using EZConstraints
        
        segmentedControl.layoutTopInSuperView(constant: 200)
        
        [boxView, segmentedControl].centerHorizontally()
        boxView.layoutBelow(segmentedControl, constant: 40)
        boxView.squareSizeWith(sideLengthOf: 120)
        
        imageView.centerOrigin()
        imageView.sizeAnchor(CGSize(width: 30, height: 30))
    }
    
    private func layoutWithAutoLayout() {
        
        // This is how it looks like when using the standard NSLayoutConstraint
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        boxView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
         
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            boxView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 40),
            boxView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boxView.widthAnchor.constraint(equalToConstant: 120),
            boxView.heightAnchor.constraint(equalToConstant: 120),
            
            imageView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
