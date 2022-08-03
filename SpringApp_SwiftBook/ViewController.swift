//
//  ViewController.swift
//  SpringApp_SwiftBook
//
//  Created by Сергей Бабич on 04.08.2022.
//

import UIKit
import Spring

class ViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var animationButton: UIButton!
    
    // MARK: - Properties
    
    let animations = Spring.AnimationPreset.allCases
    let curves = Spring.AnimationCurve.allCases
    
    var animationCounter = 0
    var curvesCounter = 0
    
    // MARK: - Private methods
    
    private func setupLabels(force: CGFloat, duration: CGFloat, delay: CGFloat) {
        presetLabel.text = "Preset: \(animations[animationCounter])"
        curveLabel.text = "Curve: \(curves[curvesCounter])"
        forceLabel.text = "Force: \(String(format: "%.2f", force))"
        durationLabel.text = "Duration: \(String(format: "%.2f", duration))"
        delayLabel.text = "Delay: \(String(format: "%.2f", delay))"
    }
    
    private func checkAnimationCounter() {
        if animationCounter < 26 {
            animationCounter += 1
        } else {
            animationCounter = 0
        }
    }
    
    private func checkCurveCounter() {
        if curvesCounter < 28 {
            curvesCounter += 1
        } else {
            curvesCounter = 0
        }
    }
    
    private func setupAnimation() {
        let force = CGFloat.random(in: 0...2)
        let duration = CGFloat.random(in: 0...2)
        let delay = CGFloat.random(in: 0...1)
        
        animationView.animation = "\(animations[animationCounter].rawValue)"
        animationView.curve = "\(curves[curvesCounter].rawValue)"
        animationView.force = force
        animationView.duration = duration
        animationView.delay = delay
        animationView.animate()
        setupLabels(force: force, duration: duration, delay: delay)
    }

    // MARK: - Actions
    
    @IBAction func animationButtonDidTap(_ sender: UIButton) {
        setupAnimation()
        checkAnimationCounter()
        animationButton.setTitle("Run \(animations[animationCounter])", for: .normal)
        checkCurveCounter()
    }
}

