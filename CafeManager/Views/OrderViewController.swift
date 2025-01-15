import UIKit

class OrderViewController: UIViewController {
    
    let loginController = LoginController()
    
    private let fioLabel: UILabel = {
       let label = UILabel()
       label.textColor = .systemOrange
       label.text = "ФИО"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 15)
       return label
    }()
    
    private let fioTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ФИО"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let guestLabel: UILabel = {
       let label = UILabel()
       label.textColor = .systemOrange
       label.text = "Количество гостей"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 15)
       return label
    }()
    
    private let guestTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите количество"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let tableLabel: UILabel = {
       let label = UILabel()
       label.textColor = .systemOrange
       label.text = "Номер стола"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 15)
       return label
    }()
    
    private let tableTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите номер"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let bronLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemOrange
        label.text = "Бронировали стол?"
        return label
    }()
    
    private let bronSwitch: UISwitch = {
        let switch1 = UISwitch()
        return switch1
    }()
    
    private let payedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemOrange
        label.text = "Была предоплата?"
        return label
    }()
    
    private let payedSwitch: UISwitch = {
        let switch1 = UISwitch()
        return switch1
    }()
    
    private let vipLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemOrange
        label.text = "VIP комната?"
        return label
    }()
    
    private let vipSwitch: UISwitch = {
        let switch1 = UISwitch()
        return switch1
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выставить счет", for: .normal)
        button.backgroundColor = .systemGray
        button.isEnabled = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var alertBill: UIAlertController = {
        let alert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let actionBill = UIAlertAction(title: "Чек", style: .default) { [weak self] _ in
            let сheckViewController = CheckViewController()
            self?.navigationController?.pushViewController(сheckViewController, animated: true)
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionBill)
        
        return alert
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cafe Mario"
        view.backgroundColor = .white
        setupLayout()
        setupActions()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupLayout() {
        [fioLabel, fioTextField, guestLabel, tableLabel, guestTextField, tableTextField, enterButton, bronLabel, bronSwitch, payedLabel, payedSwitch, vipLabel, vipSwitch].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            fioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            fioLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -270),
            
            fioTextField.leadingAnchor.constraint(equalTo: fioLabel.leadingAnchor),
            fioTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            fioTextField.topAnchor.constraint(equalTo: fioLabel.bottomAnchor, constant: 10),
            
            guestLabel.leadingAnchor.constraint(equalTo: fioLabel.leadingAnchor),
            guestLabel.topAnchor.constraint(equalTo: fioTextField.bottomAnchor, constant: 30),
            
            guestTextField.leadingAnchor.constraint(equalTo: fioTextField.leadingAnchor),
            guestTextField.trailingAnchor.constraint(equalTo: fioTextField.trailingAnchor),
            guestTextField.topAnchor.constraint(equalTo: guestLabel.bottomAnchor, constant: 10),
            
            tableLabel.leadingAnchor.constraint(equalTo: fioLabel.leadingAnchor),
            tableLabel.topAnchor.constraint(equalTo: guestTextField.bottomAnchor, constant: 30),
            
            tableTextField.leadingAnchor.constraint(equalTo: fioTextField.leadingAnchor),
            tableTextField.trailingAnchor.constraint(equalTo: fioTextField.trailingAnchor),
            tableTextField.topAnchor.constraint(equalTo: tableLabel.bottomAnchor, constant: 10),
            
            bronLabel.leadingAnchor.constraint(equalTo: tableLabel.leadingAnchor),
            bronLabel.topAnchor.constraint(equalTo: tableTextField.bottomAnchor, constant: 100),
            
            bronSwitch.trailingAnchor.constraint(equalTo: tableTextField.trailingAnchor),
            bronSwitch.centerYAnchor.constraint(equalTo: bronLabel.centerYAnchor),
            
            payedLabel.leadingAnchor.constraint(equalTo: tableLabel.leadingAnchor),
            payedLabel.topAnchor.constraint(equalTo: bronLabel.bottomAnchor, constant: 40),
            
            payedSwitch.trailingAnchor.constraint(equalTo: tableTextField.trailingAnchor),
            payedSwitch.centerYAnchor.constraint(equalTo: payedLabel.centerYAnchor),
            
            vipLabel.leadingAnchor.constraint(equalTo: tableLabel.leadingAnchor),
            vipLabel.topAnchor.constraint(equalTo: payedLabel.bottomAnchor, constant: 40),
            
            vipSwitch.trailingAnchor.constraint(equalTo: tableTextField.trailingAnchor),
            vipSwitch.centerYAnchor.constraint(equalTo: vipLabel.centerYAnchor),
            
            enterButton.leadingAnchor.constraint(equalTo: tableTextField.leadingAnchor),
            enterButton.trailingAnchor.constraint(equalTo: tableTextField.trailingAnchor),
            enterButton.topAnchor.constraint(equalTo: vipLabel.bottomAnchor, constant: 100),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setupActions() {
        fioTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        guestTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        tableTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        enterButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc private func textChanged() {
        loginController.updateFio(fioTextField.text ?? "")
        let guestNumber = Int(guestTextField.text ?? "") ?? 0
        loginController.updateGuest(guestNumber)
        let tableNumber = Int(tableTextField.text ?? "") ?? 0
        loginController.updateTable(tableNumber)

        if loginController.canBill() {
            enterButton.isEnabled = true
            enterButton.backgroundColor = .systemOrange
        } else {
            enterButton.isEnabled = false
            enterButton.backgroundColor = .lightGray
        }
    }
    
    @objc private func loginTapped() {
        present(alertBill, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
