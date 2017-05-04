//
//  ViewController2.swift
//  Game
//
//  Created by Артем Сулейманов on 03.05.17.
//  Copyright © 2017 Артем Сулейманов. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    let pers1i: UIImage = UIImage(named: "WU5cvgwpfDg.jpg" )!
    let pers1v: UIImageView = UIImageView ()
    let pers2i: UIImage = UIImage(named: "uuUOZr1hrds.jpg")!
    let pers2v: UIImageView = UIImageView ()
    func pers1_view (){
        pers1v.image = pers1i
        pers1v.frame.size.width = 40
        pers1v.frame.size.height = 40
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
    
    @IBAction func Go(_ sender: UIButton) {
        var a=kubik_go()
    }
    
    func pers2_view (){
        pers2v.image = pers2i
        pers2v.frame.size.width = 40
        pers2v.frame.size.height = 40
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