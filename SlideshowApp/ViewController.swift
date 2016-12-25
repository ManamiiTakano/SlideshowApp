//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 高野 眞奈美 on 2016/12/17.
//  Copyright © 2016年 manami.takano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var img: UIImageView!
 
    /// 表示している画像の番号
    var dispImageNo = 0
    var timer: Timer!
    var changecStartStopBtn = true
    let imageNameArray = ["01.jpg","02.jpg","03.jpg",]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if changecStartStopBtn {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.displayImage), userInfo: nil, repeats: true)
            changecStartStopBtn = false
        }else{
            // stopボタンを押す時
            timer.invalidate()
            timer = nil
            changecStartStopBtn = true
            go.isEnabled = true
            back.isEnabled = true
            startStop.setTitle("再生", for: .normal)
        }
        
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        let name = imageNameArray[dispImageNo]
        resultViewController.imageName = name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayImage() {
         // 表示している画像の番号を1増やす
        dispImageNo += 1
        if dispImageNo > 2 {
            dispImageNo = 0
            // 範囲より上を指している場合、最初の画像を表示
            let name = imageNameArray[dispImageNo]
            // 画像を読み込み
            img.image = UIImage(named: name)
        }else{
             // 範囲より上を指している場合、最初の画像を表示
            let name = imageNameArray[dispImageNo]
            // 画像を読み込み
            img.image = UIImage(named: name)
        }
    }

    func displayImageBack() {
        dispImageNo -= 1
        
        if dispImageNo < 0 {
            dispImageNo = 2
            let name = imageNameArray[dispImageNo]
            img.image = UIImage(named: name)
        }else{
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[dispImageNo]
             // 画像を読み込
            img.image = UIImage(named: name)
        }
    }
   
    func startStopbtn(){
        //startボタンを押す時
        if changecStartStopBtn {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.displayImage), userInfo: nil, repeats: true)
            changecStartStopBtn = false
            go.isEnabled = false
            back.isEnabled = false
            startStop.setTitle("停止", for: .normal)
            //.text
        }else{
            // stopボタンを押す時
            timer.invalidate()
            timer = nil
            changecStartStopBtn = true
            go.isEnabled = true
            back.isEnabled = true
            startStop.setTitle("再生", for: .normal)
        }
    }

    @IBAction func go(_ sender: Any) {
        displayImage()
    }
    @IBAction func back(_ sender: Any) {
        displayImageBack()
    }
    @IBAction func startStop(_ sender: Any) {
        startStopbtn()
    }
    @IBAction func onTapimg(_ sender: Any) {
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {        
    }
}
