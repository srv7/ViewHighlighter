//
//  ViewHighlighter.swift
//  ViewHighlighter
//
//  Created by 刘波 on 2019/5/29.
//

import Foundation

class ViewHighlighter {
    private weak var view: UIView?
    private var primaryObject: Any?
    private var highlightingObject: Any?

    var style: HighlightStyle = .none {
        didSet {
            primaryObject = nil
            highlightingObject = nil
        }
    }

    var _isHighlighted: Bool = false
    var isHighlighted: Bool {
        set(value) {
            guard value != _isHighlighted else { return }
            _isHighlighted = value
            _isHighlighted ? highlightView() : unhighlightView()
        }
        
        get { return _isHighlighted }
    }


    init(view: UIView) {
        self.view = view
    }

    func highlightView() {
        guard let view = view else { return }
        switch style {
        case .none: break
        case .transparentMask(let opacity):
            var highlightLayer = highlightingObject as? CALayer
            if highlightLayer == nil {
                highlightLayer = CALayer()
                highlightLayer?.backgroundColor = UIColor.black.cgColor
                highlightLayer?.opacity = opacity ?? 0.36
            }
            
            primaryObject = view.layer.mask
            UIView.animate(withDuration: 0.25) {
                highlightLayer?.frame = view.bounds
                view.layer.mask = highlightLayer
            }

        case .lightBackground(let color):
            if let color = view.layer.backgroundColor {
                primaryObject = UIColor(cgColor: color)
            }
            UIView.animate(withDuration: 0.25) {
                self.view?.layer.backgroundColor = color?.cgColor ?? UIColor(red: 0, green: 0, blue: 0, alpha: 0.18).cgColor
            }
            
        case .solidDarkOverlay(let color, let opacity):
            var overlayLayer  = highlightingObject as? CALayer
            if (overlayLayer == nil) {
                overlayLayer = CALayer()
                overlayLayer!.backgroundColor = color?.cgColor ?? UIColor.black.cgColor
                overlayLayer!.opacity = opacity ?? 0.48
                highlightingObject = overlayLayer
            }
            UIView.animate(withDuration: 0.25) {
                overlayLayer?.frame = view.bounds
                view.layer.addSublayer(overlayLayer!)
            }
            
        case .hollowDarkOverlay(let color, let opacity):
            let maskLayer = CALayer()
            maskLayer.contents = view.snapshot()?.cgImage
            maskLayer.frame = view.bounds
            
            let overLayLayer = CALayer()
            overLayLayer.mask = maskLayer
            overLayLayer.backgroundColor = color?.cgColor ?? UIColor.black.cgColor
            overLayLayer.opacity = opacity ?? 0.48
            
            UIView.animate(withDuration: 0.25) {
                view.layer.addSublayer(overLayLayer)
                overLayLayer.frame = view.bounds
            }
            
            highlightingObject = overLayLayer
        }
    }

    func unhighlightView() {
        guard let view = view else { return }
        switch style {
        case .none: break
        case .transparentMask:
            view.layer.mask = primaryObject as? CALayer
            primaryObject = nil
        case .lightBackground:
            UIView.animate(withDuration: 0.25) {
                self.view?.layer.backgroundColor = (self.primaryObject as? UIColor)?.cgColor
            }
            primaryObject = nil
            
        case .solidDarkOverlay:
            let overlayLayer = highlightingObject as? CALayer
            UIView.animate(withDuration: 0.25) {
                overlayLayer?.removeFromSuperlayer()
            }
        case .hollowDarkOverlay:
            let overlayLayer = highlightingObject as? CALayer
            UIView.animate(withDuration: 0.25) {
                overlayLayer?.removeFromSuperlayer()
            }
            highlightingObject = nil
        }
    }
}
