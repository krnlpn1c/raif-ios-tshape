//
//  PasswordTextField.swift
//  Test
//
//  Created by CHEMIA Georgy on 01.09.2021.
//

import UIKit

class PasswordTextField: UnderLineTextField {
    let iconBtn = UIButton()
    
    init() {
        super.init(frame: CGRect.zero)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    private func setUp() {
        self.font = .systemFont(ofSize: 12)
        self.isSecureTextEntry = true
        iconBtn.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        iconBtn.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        iconBtn.tintColor = .lightGray
        iconBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        iconBtn.imageView?.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        iconBtn.addTarget(self, action: #selector(toggleHiddenText), for: .touchUpInside)
        
        self.rightView = iconBtn
        self.rightViewMode = .always
        iconBtn.alpha = 0.6
    }
    
    @objc func toggleHiddenText(_ sender: Any) {
        isSecureTextEntry.toggle()
        iconBtn.isSelected.toggle()
    }
}
