//
//  ViewController2.swift
//  Game
//
//  Created by Артем Сулейманов on 03.05.17.
//  Copyright © 2017 Артем Сулейманов. All rights reserved.
//

import UIKit
var kubik=0
var kubik2=0
var pers1win: Bool=false
var pers2win: Bool=false

class ViewController2: UIViewController {
    let pers1i: UIImage = UIImage(named: "WU5cvgwpfDg.jpg" )!
    let pers1v: UIImageView = UIImageView ()
    let pers2i: UIImage = UIImage(named: "uuUOZr1hrds.jpg")!
    let pers2v: UIImageView = UIImageView ()
    var x:[Int]=[0,40,80,120,160,200,240,280,280,240,200,160,120,80,40,0,0,40,80,120,160,200,240,280,80,240,200,160,120,80,40,0,0,40,80,120,160,200,240,280,280,240,200,160,120,80,40,0,0,40,80,120,160,200,240,280,280,240,200,160,120,80,40,0]
    var y: [Int]=[300,300,300,300,300,300,300,300,260,260,260,260,260,260,260,260,220,220,220,220,220,220,220,220,180,180,180,180,180,180,180,180,140,140,140,140,140,140,140,140,100,100,100,100,100,100,100,100,60,60,60,60,60,60,60,60,20,20,20,20,20,20,20,20]
    
    @IBOutlet weak var hod1: UILabel!
    @IBOutlet weak var hod2: UILabel!
    @IBOutlet weak var go: UIButton!
    
    func pers1_view (){
        pers1v.image = pers1i
        pers1v.frame.size.width = 40
        pers1v.frame.size.height = 40
        UIView.animate(withDuration: 0.8, animations:{
            self.pers1v.frame.origin.x=CGFloat(self.x[kubik])
            self.pers1v.frame.origin.y=CGFloat(self.y[kubik])
        })
        view.addSubview(pers1v)
        
    }
    @IBOutlet weak var kub_img: UIImageView!
    
    func kubik_go() -> Int {
        let k=Int(arc4random_uniform(6)+1)
        let kub_num: String="kub"+String(k)+".png"
        let ki:UIImage = UIImage(named: kub_num)!
        kub_img.image=ki
        view.addSubview(kub_img)
        return k
        
    }
    
    func pers2go (){
        kubik2+=kubik_go()
        hod2.text="Sirny:\(kubik2)"
        if(kubik2<63){
            pers2_view()
    }
        else
        {
            if (pers2win != true)
            {
                kubik2=63
                pers2_view()
                pers2win=true
            }
            else
            {
                kubik2=0
                pers2_view()
                kubik=0
                pers1_view()
                pers2win=false
                hod1.text="Sickovich:\(kubik2)"
            }
        }

        hod2.text="Sirny:\(kubik2)"
        go.isEnabled=true
    }
    
    @IBAction func Go(_ sender: UIButton) {
       kubik+=kubik_go()
        if(kubik<63){
            if (kubik2 != 63)
            {
            pers1_view()
            go.isEnabled=false
            _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController2.pers2go), userInfo: nil, repeats: false)
        }
            else
            {
                kubik=0
                pers1_view()
                kubik2=0
                pers2_view()
                pers1win=false
                hod2.text="Sirny:\(kubik2)"
                pers2win=false
            }
        }
        else
        {
            if (pers1win != true)
            {
               kubik=63
                pers1_view()
                pers1win=true
            }
            else
            {
                kubik=0
                pers1_view()
                kubik2=0
                pers2_view()
                pers1win=false
                hod2.text="Sirny:\(kubik2)"
            }
        }
        hod1.text="Sickovich:\(kubik)"
       
        
    }
    
    
    func pers2_view (){
        pers2v.image = pers2i
        pers2v.frame.size.width = 40
        pers2v.frame.size.height = 40
        UIView.animate(withDuration: 0.8, animations:{
            self.pers2v.frame.origin.x=CGFloat(self.x[kubik2])
            self.pers2v.frame.origin.y=CGFloat(self.y[kubik2])
        })
        view.addSubview(pers2v)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pers2_view ()
        pers1_view ()
                // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        // Dispose of any resources that can be recreated.
    }
    
    
}
