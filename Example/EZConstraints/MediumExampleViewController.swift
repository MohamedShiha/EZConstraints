
import UIKit
import EZConstraints

class MediumExampleViewController: UIViewController {

    // MARK: Views
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var forgotPwButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private var constraint: EZConstraint!

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        layoutWithEZConstraints()
//        layoutWithAutoLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        constraint.constant = view.safeAreaInsets.top + 56
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        constraint.constant = view.safeAreaInsets.top + 56
    }
    
    // MARK: Setup UI
    
    private func setupAppearance() {
        
        usernameTF.attributedPlaceholder = NSAttributedString(string: "Username",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        usernameTF.layer.cornerRadius = 8
        passwordTF.layer.cornerRadius = 8
        loginButton.layer.cornerRadius = 8
    }
    
    private func layoutWithEZConstraints() {
        
        // This is how it looks like when using EZConstraints
        
        [ logoLabel, usernameTF, passwordTF,
          loginButton ].edgesToSuperView(including: [.left, .right], insets: .left(24) + .right(24))

        constraint = logoLabel.layoutTopToSafeArea(constant: 24)
        
        usernameTF.layBelow(logoLabel, constant: 40)
        passwordTF.layBelow(usernameTF, constant: 16)
        forgotPwButton.layBelow(passwordTF, constant: 8)
        forgotPwButton.alignLeft(with: passwordTF, constant: 8)
        loginButton.layBelow(forgotPwButton, constant: 24)
        [ usernameTF, passwordTF, loginButton ].heightAnchor(.equal, constant: 40)
    }
    
    private func layoutWithAutoLayout() {
        
        // This is how it looks like when using the standard NSLayoutConstraint
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        forgotPwButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        constraint = logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24)
        
        NSLayoutConstraint.activate([
            
            constraint,
            logoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            usernameTF.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 40),
            usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            usernameTF.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 40),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            
            forgotPwButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40),
            forgotPwButton.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor, constant: 8),
            
            loginButton.topAnchor.constraint(equalTo: forgotPwButton.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

