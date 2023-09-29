// MARK: - Sub Menu Cell

import UIKit

class SubMenuCell: UICollectionViewCell {
    
    static var idSubMenuCell = "idSubMenuCell"
    
    private let subMenuView = CustomSubMenuView()
    private var button: UIButton!
    private var stepper = CustomStepper()
    
    // MARK: - Initialize

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.opacity = 0
        layer.cornerRadius = 12
        
        button = UIButton.cellButton(with: self, and: #selector(buttonPressed))
        stepper.addTarget(self, action: #selector(stepperChange), for: .valueChanged)
        
        
        addView(subMenuView)
        addView(stepper)
        addView(button)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action methods
    
    @objc
    private func buttonPressed() {
        button.isHidden = true
        stepper.currentValue += 1
    }
    
    @objc
    private func stepperChange() {
        
        if stepper.currentValue == 0 {
            button.isHidden = false
        }
        
    }
    
}

// MARK: - Set Constraints

extension SubMenuCell {
    
    private func setConstraints() {
        
        subMenuView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(25)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(14)
            make.height.equalTo(50)
        }
        
        stepper.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(14)
            make.height.equalTo(50)
        }
        
    }
    
}
