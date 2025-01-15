import UIKit

class LoginViewController: UIViewController {
    private let loginController = LoginController()
    
    private let loginImage: UIImage? = {
        if let url = URL(string: "https://cdn-icons-png.flaticon.com/512/3471/3471737.png"),
           let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            return image
        } else {
            return UIImage(named: "placeholder")
        }
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Sign In"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private let emailLabel: UILabel = {
       let label = UILabel()
       label.textColor = .systemOrange
       label.text = "Email"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 13)
       return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordLabel: UILabel = {
       let label = UILabel()
       label.textColor = .systemOrange
       label.text = "Password"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 13)
       return label
    }()
    
    private let hiddenPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return button
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemGray
        button.isEnabled = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupActions()
    }
    
    private func setupLayout() {
        imageView.image = loginImage
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView = hiddenPasswordButton
        
        [imageView, emailTextField, mainLabel, emailLabel, passwordLabel, passwordTextField, enterButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            mainLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -50),
            mainLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -5),
            emailLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -5),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            enterButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            enterButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setupActions() {
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        enterButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        hiddenPasswordButton.addTarget(self, action: #selector(hiddenPassword), for: .touchUpInside)
    }
    
    @objc private func hiddenPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        hiddenPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func textChanged() {
        loginController.updateEmail(emailTextField.text ?? "")
        loginController.updatePassword(passwordTextField.text ?? "")

        if loginController.canLogin() {
            enterButton.isEnabled = true
            enterButton.backgroundColor = .systemOrange
        } else {
            enterButton.isEnabled = false
            enterButton.backgroundColor = .lightGray
        }
    }

    @objc private func loginTapped() {
        let orderViewController = OrderViewController()
        navigationController?.pushViewController(orderViewController, animated: true)
    }

}
