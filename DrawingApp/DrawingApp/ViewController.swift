//
//  ViewController.swift
//  DrawingApp
//
//  Created by Colin Quelle on 3/1/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var undoButton: UIButton!
    @IBOutlet var redButton: UIButton!
    @IBOutlet var blackButton: UIButton!
    
    var draw = Draw();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(draw);
        view.bringSubviewToFront(undoButton);
        view.bringSubviewToFront(redButton);
        view.bringSubviewToFront(blackButton);
        
        draw.frame = view.frame;
        draw.backgroundColor = UIColor.white;
    }
    
    @IBAction func undoPress(_sender: UIButton){
        draw.undo();
    }
    
    @IBAction func redPress(_sender: UIButton){
        draw.setLineColor(color: UIColor.red);
    }
    
    @IBAction func blackPress(_sender: UIButton){
        draw.setLineColor(color: UIColor.black);
    }
}
