//
//  DeliveryViewController.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 12.12.2023.
//

import UIKit

private enum State {
    case closed
    case open
}

extension State {
    var opposite: State {
        switch self {
        case .open:
            return .closed
        case .closed:
            return .open
        }
    }
}

class DeliveryViewController: UIViewController {
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        setConstraints()
        popupView.addGestureRecognizer(tapRecognizer)
    }
    
    private var bottomConstraint = NSLayoutConstraint()
    
    private func layout(){
        view.addSubview(popupView)
        
        popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 440)
        bottomConstraint.isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private var currentState: State = .closed
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        //recognizer.addTarget(self, action: #selector(popupViewTapped(recognizer: recognizer:)))
        return recognizer
    }()
    
    @objc private func popupViewTapped(recognizer: UITapGestureRecognizer){
        
    }
    

}

extension DeliveryViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            
        ])
    }
}
