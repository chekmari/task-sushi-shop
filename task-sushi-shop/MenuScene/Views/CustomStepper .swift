import UIKit
import SnapKit

final class CustomStepper: UIControl {
    
    
    var currentValue = 0 {
        didSet {
            currentValue = currentValue > 0 ? currentValue : 0
            currentStepValueLabel.text = "\(currentValue)"
        }
    }
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        
        button.setTitleColor(Resources.SetColor.white(), for: .normal)
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var currentStepValueLabel: UILabel = {
        var label = UILabel()
        
        label.textColor = Resources.SetColor.white()
        label.text = "\(currentValue)"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 18, weight: UIFont.Weight.bold)
        
        return label
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitleColor(Resources.SetColor.white(), for: .normal)
        
        return button
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        
        return stackView
    }()
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    
    private func setupViews() {
        
        backgroundColor = Resources.SetColor.abbey()
        layer.cornerRadius = 16
        
        addView(horizontalStackView)
        horizontalStackView.addArrangedSubview(decreaseButton)
        horizontalStackView.addArrangedSubview(currentStepValueLabel)
        horizontalStackView.addArrangedSubview(increaseButton)

    }
    
    private func setContraints() {
        
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
    }
    
    //MARK: - Actions
    
    @objc private func buttonAction(_ sender: UIButton) {
        
        switch sender {
        case decreaseButton:
            currentValue -= 1
        case increaseButton:
            
            if currentValue != 10 
            {
                currentValue += 1
            } 
            else if currentValue == 9
            {
                currentValue += 1
                increaseButton.setTitleColor(.systemGray, for: .normal)
            }
            
        default:
            break
        }
        sendActions(for: .touchUpInside)
        sendActions(for: .valueChanged)
    }
}

