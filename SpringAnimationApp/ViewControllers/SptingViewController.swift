//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Ярослав Кочкин on 30.09.2023.
//

import UIKit
import SpringAnimation

final class SptingViewController: UIViewController {

    
    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var springButton: SpringButton!
    @IBOutlet var infoTextView: UITextView!
    
    private var totalText: String = ""
    private var nextAnimate = AnimationPreset.allCases.first
    private let animations = AnimationPreset.allCases
    private let animationCurves = AnimationCurve.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springAnimationView.layer.cornerRadius = 10
        springAnimationView.layer.shadowOpacity = 0.5
        springAnimationView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        springAnimationView.layer.shadowRadius = 10
        updeteTextView()

    }
    
    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        updateAnimateView()
        updeteTextView()
        springButton.setTitle(nextAnimate?.rawValue, for: .normal)
    }
    
    private func updateAnimateView() {
        springAnimationView.animation = nextAnimate?.rawValue ?? "pop"
        springAnimationView.curve = animationCurves.shuffled().first?.rawValue ?? "easeIn"
        springAnimationView.force = CGFloat.random(in: 1...2)
        springAnimationView.duration = CGFloat.random(in: 1...2)
        springAnimationView.delay = CGFloat.random(in: 0.3...1)
        springAnimationView.animate()
        
        nextAnimate = animations.shuffled().first
    }
    
    private func updeteTextView() {
        totalText = ""
        totalText += "animation = \"\(springAnimationView.animation)\"\n"
        totalText += "curve = \"\(springAnimationView.curve)\"\n"
        totalText += String(format: "force = %.2f\n", Double(springAnimationView.force))
        totalText += String(format: "duration = %.2f\n", Double(springAnimationView.duration))
        totalText += String(format: "delay = %.2f\n", Double(springAnimationView.delay))

        infoTextView.text = totalText
    }
}
