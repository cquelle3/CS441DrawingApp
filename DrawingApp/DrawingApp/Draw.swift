//
//  Draw.swift
//  DrawingApp
//
//  Created by Colin Quelle on 3/1/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit

class Draw: UIView {
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        NSLog("Did a redraw of the draw");
        
        //gets current graphics on screen
        let context = UIGraphicsGetCurrentContext();

        let point1 = CGPoint(x: 0, y: 0);
        let point2 = CGPoint(x: 300, y: 300)
        
        context?.move(to: point1);
        context?.addLine(to: point2);
        
        //displays line on screen
        context?.strokePath();
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return};
        print(point);
    }
}
