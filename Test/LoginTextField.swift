//
//  LoginTextField.swift
//  Test
//
//  Created by CHEMIA Georgy on 01.09.2021.
//

import UIKit

class LoginTextField: UnderLineTextField {
    
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
        self.clearButtonMode = .always
    }
    
}
