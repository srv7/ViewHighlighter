//
//  ViewController.swift
//  ViewHighlighter
//
//  Created by srv7 on 05/29/2019.
//  Copyright (c) 2019 srv7. All rights reserved.
//

import UIKit
import ViewHighlighter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v = TouchHighlightView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        v.backgroundColor = .red
        v.hl.highlightStyle = .solidDarkOverlay(color: .cyan, opacity: 0.5)
        view.addSubview(v)
        
        let v2 = TouchHighlightView(frame: CGRect(x: 20, y: 20 , width: 60, height: 60))
        v2.hl.highlightStyle = .lightBackground(color: .lightGray)
        v2.backgroundColor = .blue
        v.addSubview(v2)
        
        view.hl.highlightStyle = .lightBackground(color: UIColor.red)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.hl.isHighlighted = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.hl.isHighlighted = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.hl.isHighlighted = false
    }

}

