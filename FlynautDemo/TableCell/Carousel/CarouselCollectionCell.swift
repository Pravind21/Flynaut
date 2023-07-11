//
//  CarouselCell.swift
//  FlynautDemo
//
//  Created by Pravin Deshmukh on 08/07/23.
//

import Foundation
import UIKit
import ScalingCarousel


class CarouselCollectionCell: ScalingCarouselCell{
   

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var buttonContainer: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setupCarousalView(data : CellDataModal){
      
        buttonContainer?.addCorner(radius:35.5)
        imageView?.addCorner(radius: 50)
        imageView.image = UIImage(named: data.image)
        buttonContainer.backgroundColor = UIColor.init(r: 102, g: 116, b: 141,alpha: 0.9)
        //setupGradientLayer()
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = buttonContainer.bounds
        gradientLayer.colors = [
            UIColor(r: 255, g: 255, b: 255, alpha: 0.64)!.cgColor,
            UIColor(r: 255, g: 255, b: 255, alpha: 0.14)!.cgColor,
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        buttonContainer.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}

extension UIView {

    func addCorner(radius : CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}





