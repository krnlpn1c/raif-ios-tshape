//
//  ViewController.swift
//  Test
//
//  Created by CHEMIA Georgy on 15.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    let loginField = LoginTextField()
    let passwordField = PasswordTextField()
    let enterButton = UIButton()
    let accountOpenDescription = UILabel()
    let anotherAccountOpenDescriptions = [
        "Не получилось",
        "Попробуйте снова",
        "Что-то оно не хочет",
        "Нажмите по-сильнее",
        "Чего-то оно не это",
        "Закрыто слишком сильно",
        "Почти открылся"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let contentView = UIStackView()
        contentView.axis = NSLayoutConstraint.Axis.vertical
        contentView.distribution  = UIStackView.Distribution.fill
        contentView.alignment = UIStackView.Alignment.center
        contentView.spacing = 30.0
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -30),
            contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -40)
        ])
        
        let logoContainer = UIView()
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(logoContainer)
        logoContainer.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        logoContainer.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        let logo = UIView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.backgroundColor = .yellow
        logoContainer.addSubview(logo)
        logo.heightAnchor.constraint(equalTo: logoContainer.heightAnchor).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        contentView.setCustomSpacing(70.0, after: logoContainer)

        loginField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(loginField)
        loginField.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        loginField.heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        passwordField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(passwordField)
        passwordField.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        loginField.addTarget(self, action: #selector(checkEnterButtonClickabilty), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(checkEnterButtonClickabilty), for: .editingChanged)
        
        enterButton.setTitle("Войти", for: .normal)
        enterButton.titleLabel?.font = .systemFont(ofSize: 14)
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.backgroundColor = #colorLiteral(red: 0.9891842008, green: 0.9515443444, blue: 0.6417338252, alpha: 1)
        enterButton.isEnabled = false
        enterButton.layer.cornerRadius = 7
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(enterButton)
        enterButton.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        contentView.setCustomSpacing(5 , after: enterButton)
        enterButton.addTarget(self, action: #selector(onClickEnter), for: .touchUpInside)
        
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgotPasswordButton.setTitle("Жаль!", for: .selected)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 10)
        forgotPasswordButton.setTitleColor(.gray, for: .normal)
        contentView.addArrangedSubview(forgotPasswordButton)
        forgotPasswordButton.addTarget(self, action: #selector(onClickForgotPassword), for: .touchUpInside)
        contentView.setCustomSpacing(30.0 , after: forgotPasswordButton)

        let accountOpenView = ShadowedView()
        accountOpenView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(accountOpenView)
        accountOpenView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        accountOpenView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        accountOpenView.layer.cornerRadius = 15
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAccountOpenTap))
        accountOpenView.addGestureRecognizer(tapGesture)
        
        let accountOpenIcon = UIImageView(image: UIImage(systemName: "note.text.badge.plus"))
        accountOpenView.addSubview(accountOpenIcon)
        accountOpenIcon.translatesAutoresizingMaskIntoConstraints = false
        accountOpenIcon.centerYAnchor.constraint(equalTo: accountOpenView.centerYAnchor).isActive = true
        accountOpenIcon.leftAnchor.constraint(equalTo: accountOpenView.leftAnchor, constant: 20).isActive = true
        accountOpenIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        accountOpenIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let accountOpenTitle = UILabel()
        accountOpenTitle.translatesAutoresizingMaskIntoConstraints = false
        accountOpenTitle.font = .systemFont(ofSize: 14)
        accountOpenTitle.textColor = .black
        accountOpenTitle.text = "Открыть счет"
        accountOpenView.addSubview(accountOpenTitle)
        accountOpenTitle.leftAnchor.constraint(equalTo: accountOpenView.leftAnchor, constant: 70).isActive = true
        accountOpenTitle.topAnchor.constraint(equalTo: accountOpenView.topAnchor, constant: 25).isActive = true

        accountOpenDescription.translatesAutoresizingMaskIntoConstraints = false
        accountOpenDescription.font = .systemFont(ofSize: 12)
        accountOpenDescription.textColor = .gray
        accountOpenDescription.text = "Получите реквизиты через\n5 минут"
        accountOpenDescription.numberOfLines = 2
        accountOpenView.addSubview(accountOpenDescription)
        accountOpenDescription.leftAnchor.constraint(equalTo: accountOpenView.leftAnchor, constant: 70).isActive = true
        accountOpenDescription.topAnchor.constraint(equalTo: accountOpenView.topAnchor, constant: 45).isActive = true

        let spacer = UIView()
        contentView.addArrangedSubview(spacer)
        
        let bottomLabel = UILabel()
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.font = .systemFont(ofSize: 9)
        bottomLabel.textColor = .black
        bottomLabel.text = "© 2003-2021 АО «Райффайзенбанк», t-shape_ruacmg"
        contentView.addArrangedSubview(bottomLabel)
    }

    @objc func onClickForgotPassword(sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @objc func onClickEnter(sender: UIButton) {
        if (loginField.text?.caseInsensitiveCompare("admin") == .orderedSame && passwordField.text == "1234") {
            showAlert(title: "Ура! Вы запомнили пароль", message: "Но дальше не пустим", buttonTitle: "Красивое..")
        } else {
            showAlert(title: "Не удалось войти", message: "Введите логин admin и пароль 1234", buttonTitle: "Повторить ввод")
        }
    }
    
    @objc func checkEnterButtonClickabilty(){
        if ((loginField.text ?? "").isEmpty || (passwordField.text ?? "").isEmpty) {
            enterButton.backgroundColor = #colorLiteral(red: 0.9891842008, green: 0.9515443444, blue: 0.6417338252, alpha: 1)
            enterButton.isEnabled = false
        } else {
            enterButton.backgroundColor = #colorLiteral(red: 0.9872645736, green: 0.8566381931, blue: 0, alpha: 1)
            enterButton.isEnabled = true
        }
    }
    
    @objc func handleAccountOpenTap() {
        var description = accountOpenDescription.text
        while (description == accountOpenDescription.text) {
            description = anotherAccountOpenDescriptions.randomElement()
        }
        accountOpenDescription.text = description
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

class ShadowedView: UIView {
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 25.0
    private var fillColor: UIColor = .white
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
          
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = fillColor.cgColor

            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            shadowLayer.shadowOpacity = 0.1
            shadowLayer.shadowRadius = 30

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
