//
//  LoginDepan.swift
//  CaloriesCount
//
//  Created by Lukius Jonathan on 06/03/20.
//  Copyright © 2020 Lukius Jonathan. All rights reserved.
//

import UIKit
extension UIButton{
    
    func touchstate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration=0.1
        pulse.fromValue=0.95
        pulse.toValue=0.7
        pulse.autoreverses=false
        pulse.initialVelocity=0.5
        pulse.damping=0.5
        
        layer.add(pulse, forKey: nil)
    }
}

class LoginDepan: UIViewController {
    let impact = UIImpactFeedbackGenerator()

    @IBOutlet weak var touchlabel: UIButton!
    
    @IBOutlet weak var hitungindong: UILabel!
    @IBOutlet weak var kentang: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchlabel.layer.cornerRadius=20.0
        touchlabel.layer.masksToBounds=true
        playKentang()
        playhitungin()
        
        // Do any additional setup after loading the view.
    }
    
    func playKentang(){
        kentang.frame.origin.y -= 500
        UIView.animate(withDuration: 2.0, animations: {
            self.kentang.frame.origin.y += 520
        },completion: nil)
        
    }
    
    func playhitungin()  {
        hitungindong.frame.origin.y -= 100
        UIView.animate(withDuration: 2.0, animations: {
            self.hitungindong.frame.origin.y += 110
        },completion: nil)
    }
    

    func keatas(){
        UIView.animate(withDuration: 0.3, animations: {
            self.touchlabel.frame.origin.y -= 100
        },completion: nil)
        
    }
    @IBAction func touchpulse(_ sender: UIButton) {
        sender.touchstate()
        self.impact.impactOccurred()

    }
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
