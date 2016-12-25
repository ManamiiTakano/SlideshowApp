//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 高野 眞奈美 on 2016/12/17.
//  Copyright © 2016年 manami.takano. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var dispImageNo = 0
    
    // 拡大画像を表示するビュー
    @IBOutlet weak var imageView: UIImageView!
    
    // ViewControllerから画像パスを受け取る変数
    var imageName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = imageName {
            self.imageView.image = UIImage(named: name)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
