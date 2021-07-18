//
//  ViewController.swift
//  Demo_006
//
//  Created by 鄭淳澧 on 2021/7/14.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 1080 , height: 1920))
    let shadow1ImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 130))
    let card1ImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 130))
    let shadow2ImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 130))
    let card2ImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 130))
    let card3ImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 130))
    let playButton = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 170))
    let playerScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 100))
    let cpuScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 100))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let increaseHeight1 = self.navigationController?.navigationBar.frame.size.height
        let offsetY:CGFloat = 45.0
//        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        //獲取螢幕大小（寬度、高度）
        let fullScreenSize = UIScreen.main.bounds.size
        //設置背景視圖
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 1080, height: 1920))
        backgroundImageView.image = UIImage(named: "background")
        backgroundView.backgroundColor = UIColor.clear
        backgroundView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        backgroundView.addSubview(backgroundImageView)
        
        //設置title框
        let titleImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 180, height: 165))
        titleImageView.image = UIImage(named: "casino")
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.init(red: 248/255, green: 233/255, blue: 233/255, alpha: 1)
        titleLabel.center = CGPoint(x: fullScreenSize.width / 2, y: fullScreenSize.height / 8 + offsetY)
        //title文字
        titleLabel.text = "比大小"
        titleLabel.textAlignment = .center
        //字體參考Helvetica-Light、System Font Regular
        titleLabel.font = UIFont(name: "Helvetica-Light", size: 33)
        titleLabel.textColor = UIColor.brown
        titleLabel.numberOfLines = 2
//        titleLabel.lineBreakMode = .byTruncatingMiddle
        titleLabel.shadowColor = UIColor.black
        titleLabel.shadowOffset = CGSize(width: 1.5, height: 1.5)
       
        //設置第一張牌框
        
        shadow1ImageView.center = CGPoint(x: fullScreenSize.width * 0.5 - 85, y: fullScreenSize.height * 0.5 - 115 + offsetY)
        shadow1ImageView.backgroundColor = UIColor.black
        shadow1ImageView.layer.cornerRadius = 7
        shadow1ImageView.layer.opacity = 0.25
        
        card1ImageView.backgroundColor = UIColor.yellow
        card1ImageView.center = CGPoint(x: fullScreenSize.width * 0.5 - 90, y: fullScreenSize.height * 0.5 - 120 + offsetY)
        card1ImageView.image = UIImage(named: "club14")
        card1ImageView.clipsToBounds = true
        card1ImageView.layer.cornerRadius = 7
//        card1ImageView.layer.shadowColor = CGColor(red: 44 / 255, green: 62 / 255, blue: 80 / 255, alpha: 1)
//        card1ImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
  
        
        
        //設置第二張牌框
        
        shadow2ImageView.center = CGPoint(x: fullScreenSize.width * 0.5 + 95, y: fullScreenSize.height * 0.5 - 115 + offsetY)
        shadow2ImageView.backgroundColor = UIColor.black
        shadow2ImageView.layer.cornerRadius = 7
        shadow2ImageView.layer.opacity = 0.25
        
        card2ImageView.backgroundColor = UIColor.yellow
        card2ImageView.center = CGPoint(x: fullScreenSize.width * 0.5 + 90, y: fullScreenSize.height * 0.5 - 120 + offsetY)
        card2ImageView.image = UIImage(named: "club14")
        card2ImageView.clipsToBounds = true
        card2ImageView.layer.cornerRadius = 7
//        card2ImageView.layer.shadowColor = CGColor(red: 44 / 255, green: 62 / 255, blue: 80 / 255, alpha: 1)
//        card2ImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
      
        
        
        //設置輪播牌組
        
        card3ImageView.backgroundColor = UIColor.clear
        card3ImageView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5 + 20)
        card3ImageView.image = UIImage(named: "")
        //設置圖陣列
        var imgArr = [UIImage]()
        for i in 2...14 {
            imgArr.append(UIImage(named: "club\(i)")!)
        }
        //其實等於
//        let imgArr = [
//            UIImage(named: "card2.jpg")!,
//            UIImage(named: "card3.jpg")!,
//            UIImage(named: "card4.jpg")!,
//            UIImage(named: "card5.jpg")!,
//            UIImage(named: "card6.jpg")!,
//            UIImage(named: "card7.jpg")!,
//            UIImage(named: "card8.jpg")!,
//            UIImage(named: "card9.jpg")!,
//            UIImage(named: "card10.jpg")!,
//            UIImage(named: "card11.jpg")!,
//            UIImage(named: "card12.jpg")!,
//            UIImage(named: "card13.jpg")!,
//            UIImage(named: "card14.jpg")!
//        ]
        card3ImageView.animationImages = imgArr
        card3ImageView.animationDuration = 3
        card3ImageView.animationRepeatCount = 1
//        card3ImageView.startAnimating()
        
        //設置播放按鈕
       
        playButton.backgroundColor = .clear
        playButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5 + 120 - 30)
        playButton.setImage(UIImage(named: "chip"), for: .normal)
        //button文字
//        playButton.setTitle("發牌", for: .normal)
//        playButton.setTitleColor(UIColor.white, for: .normal)
        
        playButton.isEnabled = true
        playButton.addTarget(self, action: #selector(self.shuffle), for: .touchUpInside)
        
        //設置PLAYER
        let playerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 100))
        playerLabel.text = "Player"
        playerLabel.textColor = .white
        playerLabel.center = CGPoint(x: fullScreenSize.width * 0.5 - 90, y: fullScreenSize.height * 0.5 + 200)
        playerLabel.textAlignment = .center
        playerLabel.font = UIFont(name: "System Font Regular", size: 28)
        
        //設置PLAYER SCORE
        
        playerScoreLabel.text = "0"
        playerScoreLabel.textColor = .white
        playerScoreLabel.center = CGPoint(x: fullScreenSize.width * 0.5 - 90, y: fullScreenSize.height * 0.5 + 255)
        playerScoreLabel.textAlignment = .center
        playerScoreLabel.font = UIFont(name: "System Font Regular", size: 45)
        //設置CPU
        let cpuLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 100))
        cpuLabel.text = "CPU"
        cpuLabel.textColor = .white
        cpuLabel.center = CGPoint(x: fullScreenSize.width * 0.5 + 90, y: fullScreenSize.height * 0.5 + 200)
        cpuLabel.textAlignment = .center
        cpuLabel.font = UIFont(name: "System Font Regular", size: 28)
        //設置CPU SCORE
        
        cpuScoreLabel.text = "0"
        cpuScoreLabel.textColor = .white
        cpuScoreLabel.center = CGPoint(x: fullScreenSize.width * 0.5 + 90, y: fullScreenSize.height * 0.5 + 255)
        cpuScoreLabel.textAlignment = .center
        cpuScoreLabel.font = UIFont(name: "System Font Regular", size: 45)
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(titleImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(shadow1ImageView)
        self.view.addSubview(shadow2ImageView)
        self.view.addSubview(card1ImageView)
        self.view.addSubview(card2ImageView)
        self.view.addSubview(card3ImageView)
        self.view.addSubview(playButton)
        self.view.addSubview(playerLabel)
        self.view.addSubview(playerScoreLabel)
        self.view.addSubview(cpuLabel)
        self.view.addSubview(cpuScoreLabel)
   
        
    }

//    extension CALayer {
//        func roundCorners(radius: CGFloat) {
//            self.cornerRadius = radius
//        }
//    }
    
    @objc func clickButton() {
        if self.backgroundView.backgroundColor!.isEqual(UIColor.cyan) {
            self.backgroundView.backgroundColor = UIColor.white
        }else {
            self.backgroundView.backgroundColor = UIColor.cyan
        }
    }
    
    var count = 0
    @objc func play() {
        if (count >= 0 && count % 2 == 0) {
            print("play imgArr auto play")
            self.card3ImageView.startAnimating()
            self.playButton.setTitle("停止", for: .normal)
            count += 1
        }else if (count % 2 == 1) {
            print("stop imgArr manual stop")
            self.card3ImageView.stopAnimating()
            self.playButton.setTitle("播放", for: .normal)
            count += 1
        }else {
            print("fatal error.")
        }
        print(count)
    }
    
    var counter = 0
    var c:Int = 0
    var d:Int = 0

    @objc func shuffle() {
        let a = Int.random(in: 2...14)
        let b = Int.random(in: 2...14)
        self.card1ImageView.image = UIImage(named: "club\(a)")
        self.card2ImageView.image = UIImage(named: "club\(b)")
        
        if a > b {
            c += 1
            self.playerScoreLabel.text = "\(c)"
        }else if a < b {
            d += 1
            self.cpuScoreLabel.text = "\(d)"
        }else {
            print("平局")
        }
        
        counter += 1
        print(counter)
    }
    
    struct ViewControllerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> ViewController {
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        }
        
        func updateUIViewController(_ uiViewController: ViewController, context: Context) {
            
        }
        
        typealias UIViewControllerTyper = ViewController
    }
    
    struct ViewControllerView_Previews: PreviewProvider {
        static var previews: some View {
            ViewControllerView()
                .previewDevice("iPhone 11 Pro")
        }
    }
    
    
}

