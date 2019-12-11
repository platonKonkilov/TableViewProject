//
//  RaitingControl.swift
//  TableViewProject
//
//  Created by Платон Конкилов on 08.12.2019.
//  Copyright © 2019 Платон Конкилов. All rights reserved.
//

import UIKit

@IBDesignable class RaitingControl: UIStackView {
    
    var rating = 0 {
        didSet {
            updateButtonSelectState()
        }
    }
    
    //  MARK: Properties
    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButton()
        }
    }
    //    MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    // MARK: Button action
    
    @objc func ratingButtonTaper(button: UIButton) {
        guard let index = ratingButtons.firstIndex(of: button) else { return }
        
        let selectedRaiting = index + 1
        
        if selectedRaiting == rating {
            rating = 0
        } else {
            rating = selectedRaiting
        }
    
    
    }
    
    //  MARK: Private Methods
    private func setupButton() {
        for  button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        let bundel = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundel, compatibleWith: self.traitCollection)
        let emptySatar = UIImage(named: "emptySatar", in: bundel, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundel, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
        
            //Create the button
            let button = UIButton()
            //Set the button image
            button.setImage(emptySatar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])

        
            //Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive =  true
            //Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTaper(button:)), for: .touchUpInside)
        
            //Add the button to the stack
            addArrangedSubview(button)
    }
    }
    
    private func updateButtonSelectState() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
