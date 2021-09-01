//
//  AuthorizationViennaExtension.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Vienna

// MARK: - ChipCell

extension ChipCell: AuthorizationModelCell {
  func configure(with model: AuthorizationCellModel) {
    guard let chipModel = model as? AuthorizationCollectionChipModel else {
      return
    }
    setText(chipModel.text)
    updateView(isEnabled: chipModel.isEnabled, isSelected: chipModel.isSelected)
  }
}
