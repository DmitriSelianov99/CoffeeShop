//
//  ParentViewController.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 14.12.2023.
//
// https://www.swiftkickmobile.com/building-better-app-animations-swift-uiviewpropertyanimator/

import UIKit
import UIKit.UIGestureRecognizerSubclass

// MARK: - State

private enum State {
    case closed
    case open
}

extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}

// MARK: - View Controller

class DeliveryViewController: UIViewController {
    
    // MARK: - Constants
    
    private let popupOffset: CGFloat = 272
    
    // MARK: - Views
    
    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "defaultImage")
        return imageView
    }()
    
    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private lazy var popupView = DeliveryView()
    
    private lazy var closedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reviews"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var openTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reviews"
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.heavy)
        label.textColor = .black
        label.textAlignment = .center
        label.alpha = 0
        label.transform = CGAffineTransform(scaleX: 0.65, y: 0.65).concatenating(CGAffineTransform(translationX: 0, y: -15))
        return label
    }()
    
    private lazy var reviewsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "defaultImage")
        return imageView
    }()
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        popupView.addGestureRecognizer(panRecognizer)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Layout
    
    private var bottomConstraint = NSLayoutConstraint()
    
    private func layout() {
        
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentImageView)
        contentImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overlayView)
        overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        overlayView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: popupOffset)
        bottomConstraint.isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 322).isActive = true
        
    }
    
    // MARK: - Animation
    
    /// Текущее состояние анимации. Эта переменная изменяется только после завершения анимации.
    private var currentState: State = .closed
    
    /// Все работающие в данный момент аниматоры.
    private var runningAnimators = [UIViewPropertyAnimator]()
    
    /// Прогресс каждого аниматора. Этот массив параллелен массиву `runningAnimators`.
    private var animationProgress = [CGFloat]()
    
    private lazy var panRecognizer: InstantPanGestureRecognizer = {
        let recognizer = InstantPanGestureRecognizer()
        recognizer.addTarget(self, action: #selector(popupViewPanned(recognizer:)))
        return recognizer
    }()
    
    /// Анимирует переход, если анимация еще не запущена.
    private func animateTransitionIfNeeded(to state: State, duration: TimeInterval) {
        
        // убедитесь, что массив animators пуст (что подразумевает необходимость создания новых анимаций)
        guard runningAnimators.isEmpty else { return }
        
        // аниматор для перехода
        let transitionAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
            switch state {
            case .open:
                self.bottomConstraint.constant = 0
                self.popupView.layer.cornerRadius = 20
                self.overlayView.alpha = 0.5
                self.closedTitleLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6).concatenating(CGAffineTransform(translationX: 0, y: 15))
                self.openTitleLabel.transform = .identity
            case .closed:
                self.bottomConstraint.constant = self.popupOffset
                self.popupView.layer.cornerRadius = 0
                self.overlayView.alpha = 0
                self.closedTitleLabel.transform = .identity
                self.openTitleLabel.transform = CGAffineTransform(scaleX: 0.65, y: 0.65).concatenating(CGAffineTransform(translationX: 0, y: -15))
            }
            self.view.layoutIfNeeded()
        })
        
        // блок завершения перехода
        transitionAnimator.addCompletion { position in
            
            // обновите состояние
            switch position {
            case .start:
                self.currentState = state.opposite
            case .end:
                self.currentState = state
            case .current:
                ()
            }
            
            // вручную сбросьте положения ограничений
            switch self.currentState {
            case .open:
                self.bottomConstraint.constant = 0
            case .closed:
                self.bottomConstraint.constant = self.popupOffset
            }
            
            // удалите все запущенные аниматоры
            self.runningAnimators.removeAll()
            
        }
        
        // аниматор для заголовка, который переходит в режим просмотра
        let inTitleAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn, animations: {
            switch state {
            case .open:
                self.openTitleLabel.alpha = 1
            case .closed:
                self.closedTitleLabel.alpha = 1
            }
        })
        inTitleAnimator.scrubsLinearly = false
        
        // аниматор для названия, которое исчезает из поля зрения
        let outTitleAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeOut, animations: {
            switch state {
            case .open:
                self.closedTitleLabel.alpha = 0
            case .closed:
                self.openTitleLabel.alpha = 0
            }
        })
        outTitleAnimator.scrubsLinearly = false
        
        // запустите всех аниматоров
        transitionAnimator.startAnimation()
        inTitleAnimator.startAnimation()
        outTitleAnimator.startAnimation()
        
        // следите за всеми работающими аниматорами
        runningAnimators.append(transitionAnimator)
        runningAnimators.append(inTitleAnimator)
        runningAnimators.append(outTitleAnimator)
        
    }
    
    @objc private func popupViewPanned(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            
            // запустите анимацию
            animateTransitionIfNeeded(to: currentState.opposite, duration: 1)
            
            // приостановите все анимации, так как следующим событием может быть изменение панорамирования
            runningAnimators.forEach { $0.pauseAnimation() }
            
            //следите за прогрессом каждого аниматора
            animationProgress = runningAnimators.map { $0.fractionComplete }
            
        case .changed:
            
            // переменная настройка
            let translation = recognizer.translation(in: popupView)
            var fraction = -translation.y / popupOffset
            
            // отрегулируйте фракцию для текущего состояния и обратного состояния
            if currentState == .open { fraction *= -1 }
            if runningAnimators[0].isReversed { fraction *= -1 }
            
            // примените новую фракцию
            for (index, animator) in runningAnimators.enumerated() {
                animator.fractionComplete = fraction + animationProgress[index]
            }
            
        case .ended:
            
            // переменная настройка
            let yVelocity = recognizer.velocity(in: popupView).y
            let shouldClose = yVelocity > 0
            
            // если движения нет, продолжите все анимации и завершите досрочно
            if yVelocity == 0 {
                runningAnimators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }
                break
            }
            
            // отмените анимацию в зависимости от ее текущего состояния и движения панорамирования
            switch currentState {
            case .open:
                if !shouldClose && !runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
                if shouldClose && runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
            case .closed:
                if shouldClose && !runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
                if !shouldClose && runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
            }
            
            // продолжить все анимации
            runningAnimators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }
            
        default:
            ()
        }
    }
    
}

// MARK: - InstantPanGestureRecognizer

/// Жест панорамирования, который переходит в состояние `began` при касании вместо ожидания события перемещения касанием.
class InstantPanGestureRecognizer: UIPanGestureRecognizer {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if (self.state == UIGestureRecognizer.State.began) { return }
        super.touchesBegan(touches, with: event)
        self.state = UIGestureRecognizer.State.began
    }
    
}
