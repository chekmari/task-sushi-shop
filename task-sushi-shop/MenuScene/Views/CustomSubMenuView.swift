// MARK: - Custom Sub Menu View 

import UIKit

class CustomSubMenuView: UIView {

    private let name = UILabel.nameText()
    private let сomposition = UILabel.composition()
    private let cost = UILabel.cost()
    private var weight = UILabel.weight()
    private let imageView = UIImageView.subMenu()
   
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = Resources.SetColor.black()?.cgColor
        layer.cornerRadius = 12
    
        addView(name)
        addView(сomposition)
        addView(cost)
        addView(imageView)
        addView(weight)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

// MARK: - Set Constraints

extension CustomSubMenuView {
    
    public func sendToCell(name: String,
                           сomposition: String,
                           cost: String,
                           weight: String?,
                           spicy: String?,
                           image: String) {
        
        let url = URL(string: "\(Network.URLs.image.rawValue)\(image)")
        
        self.name.text = name
        self.сomposition.text = сomposition
        self.cost.text = cost + " ₽"
        self.imageView.kf.setImage(with: url)
        
        if weight == nil {
            self.weight.text = ""
        } else {
            self.weight.text = "/ " + (weight ?? "")
        }

    }
    
}

// MARK: - Set Contraints

extension CustomSubMenuView {
    
    private func setConstraints() {

        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.trailing.leading.equalToSuperview().inset(8)
            make.height.equalToSuperview().dividedBy(8)
        }
        
    
        сomposition.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
            make.top.equalTo(name.snp.bottom).inset(10)
            make.bottom.equalTo(cost.snp.top).inset(10)
        }
        
        cost.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.top)
            make.leading.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        weight.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.top)
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.leading.equalTo(cost.snp.trailing).offset(6)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
