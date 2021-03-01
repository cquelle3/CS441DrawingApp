//
//  Draw.swift
//  DrawingApp
//
//  Created by Colin Quelle on 3/1/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit

class Draw: UIView {
    
    var lineColor = UIColor.black;
    
    //stores each point in a line drawn by the user
    var line = [CGPoint]();
    
    //stores each line drawn by the user
    var lines = [[CGPoint]]();
    
    var lineColors = [CGColor]();
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        //gets current graphics on screen
        let context = UIGraphicsGetCurrentContext();
        
        //loops through all past lines drawn and renders their points
        for (i, currLine) in lines.enumerated(){
            for(j, point) in currLine.enumerated(){
                if(j == 0){
                    context?.move(to: point);
                }
                else{
                    context?.addLine(to: point);
                }
            }
            context?.setStrokeColor(lineColors[i]);
            context?.strokePath();
        }
        
        //loops through the current line being drawn and renders all of its points
        for(index, point) in line.enumerated(){
            if(index == 0){
                context?.move(to: point);
            }
            else{
                context?.addLine(to: point);
            }
        }
        
        context?.setStrokeColor(lineColor.cgColor);
        
        //displays line on screen
        context?.strokePath();
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //gets current point that users finger is on on the screen
        guard let point = touches.first?.location(in: nil) else {return};
        print(point);
        
        //adds each point to the line array (a line is formed from serveral points)
        line.append(point);
        
        //updates the display to show new lines
        setNeedsDisplay();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //adds line to array of drawn lines to render later
        lines.append(line);
        lineColors.append(lineColor.cgColor);
        
        //removes all points from current line variable to free up variable for a future line
        line.removeAll();
    }
    
    func undo(){
        if(lines.count > 0){
            lineColors.removeLast();
            lines.removeLast();
            setNeedsDisplay();
        }
    }
    
    func setLineColor(color: UIColor){
        lineColor = color;
    }
}
