//
//  ViewController.swift
//  DrawingApp
//
//  Created by Colin Quelle on 3/1/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var draw = Draw();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(draw);
        draw.frame = view.frame;
        draw.backgroundColor = UIColor.blue;
    }


}

