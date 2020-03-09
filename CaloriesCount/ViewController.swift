//
//  ViewController.swift
//  CaloriesCount
//
//  Created by Lukius Jonathan on 03/03/20.
//  Copyright © 2020 Lukius Jonathan. All rights reserved.
//

import UIKit
extension UIButton{
    
    func pulstate(){
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

extension UIViewController{
    
    func HideKeyboard(){
        let Tap:UIGestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
               
               view.addGestureRecognizer(Tap)
    }
    @objc func DismissKeyboard(){
           view.endEditing(true)
       }
}


class ViewController: UIViewController, UITextFieldDelegate {
    let impact = UIImpactFeedbackGenerator()

    
    @IBOutlet weak var listmakanan1: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var listmakanan3: UILabel!

    
    
    @IBOutlet weak var listmakanan2: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var round_submit: UIButton!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var makanan: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var genderTextField: UITextField!
    
//    var ageText = ""

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        round_submit.layer.cornerRadius = 20.0
        round_submit.layer.masksToBounds = true
        
        ageTextField.delegate=self
        weightTextField.delegate=self
        heightTextField.delegate=self
        
        self.HideKeyboard()
        
//        activity.isHidden=true
        
    
        genderTextField.addTarget(self, action: #selector(checkGenderError(gendertextfield:)), for: .editingChanged)
        
        
    }
    
   
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "1234567890"
        let allowedCharacterSets = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSets.isSuperset(of: typedCharacterSet)
        
        return true
    }
    
    
    @IBAction func pulsebutton(_ sender: UIButton) {
        sender.pulstate()
    }
    @IBAction func submit_generate(_ sender: Any) {
        
        self.impact.impactOccurred()

        
        DismissKeyboard()
        
        let a = Double(ageTextField.text!)
        let w = Double(weightTextField.text!)
        let h = Double(heightTextField.text!)
        let g = genderTextField.text!
        
        let age = ageTextField.text
        let weight = weightTextField.text
        let height = heightTextField.text
        let gender = genderTextField.text
        
        
        

        if (age!.isEmpty || weight!.isEmpty || height!.isEmpty || gender!.isEmpty){
            let myAlert = UIAlertController(title: "Alert", message: "All fields are required to fill in!", preferredStyle:
                .alert)
            let action = UIAlertAction(title: "Ok!", style: .cancel, handler: nil)
            
            myAlert.addAction(action)
            self.present(myAlert,animated: true,completion: nil)
            return
        }
        else if (gender! != "M" && gender! != "F" && gender! != "m" && gender! != "f"){
            let myAlert = UIAlertController(title: "Alert", message: "Please input valid gender!", preferredStyle:
                .alert)
            let action = UIAlertAction(title: "Ok!", style: .cancel, handler: nil)

            myAlert.addAction(action)
            self.present(myAlert,animated: true,completion: nil)
            return
        }
        
        let hitungkaloricowo = Kelas(height:h!, weight: w!, age: a!)
        let hitungkaloricewe = Kelas2(height:h!, weight: w!, age: a!)
        let cowo = Int(hitungkaloricowo.hitungberattinggicowo())
        let cewe = Int(hitungkaloricewe.hitungberattinggicewe())
                
        if g == "F" || g=="f" || g=="female" || g=="Female" || g=="FEMALE" {
            result.text = String(Int(hitungkaloricewe.hitungberattinggicewe()))
            if (cewe < 1000 && cewe > 800 )  {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\nHalf Bowl of Raisin Cereal = 200 calories"
                 listmakanan2.text="LUNCH\nSalad with Oil and Vinegar Dressing = 350 calories"
                 listmakanan3.text="DINNER\n1/4 plate of Fish with 1/4 Plate of Brown Rice with 1/3 Plate of Spinach = 500 calories"
                
             }
             
             else if (cewe < 1200 && cewe > 1000 ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\nA Bowl of raisin cereal = 300 calories"
                 listmakanan2.text="LUNCH\nFried Rice with sunny side up= 500 calories"
                 listmakanan3.text="DINNER\nVeggie Burger with meat only= 400 calories"
             }
                 
             else if (cewe < 1400 && cewe > 1200  ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\n3/4 Cup Yogurt +1 Cup Blueberries + 2 Hard Boiled Eggs = 350 calories"
                 listmakanan2.text="LUNCH\nSalad with chicken breast and mayo sauce= 550 calories"
                 listmakanan3.text="DINNER\nCarbonara Spaghetti with shrimp= 400 calories"
             }
                
            
             else if (cewe < 1600 && cewe > 1400  ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\nAvocado & Aragula Omelet = 344 calories"
                 listmakanan2.text="LUNCH\nRoasted Veggie and Beef salad= 578 calories"
                 listmakanan3.text="DINNER\nZuchinni Noodles with Avocado Pesto&Shrimp = 450 calories"

             }
                
                 
             else if (cewe < 1800 && cewe > 1600  ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\n1/2 Cup Dry Oatmeal with 1 Medium Banana and Cinnamon = 445 calories"
                 listmakanan2.text="LUNCH\n1 Cup Baby Carrots with 2 Hard Boiled Eggs and Chicken Breast = 566 calories"
                 listmakanan3.text="DINNER\n5 Strips Bacon with 2 Cups Lettuce+2 hard Boiled Eggs+Medium Banana and Avocado = 680 calories"
             }
                 
             else if (cewe < 2000 && cewe > 1800  ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\nTurkey and cheese omelet with 2 buttered toast = 626 calories"
                 listmakanan2.text="LUNCH\nHummus and veggies sandwich = 532 calories"
                 listmakanan3.text="DINNER\n2 roll chicken wraps = 736 calories"
             }
                 
             else if (cewe < 2200 && cewe > 2000  ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\n2 Shakes Raspeberies and Blueberies smoothies = 603 calories"
                 listmakanan2.text="LUNCH\n2 chicken salad sandwich with 1 serving of yogurt and banana = 736 calories"
                 listmakanan3.text="DINNER\nBasic chicken salad with spicy garlic brocoli and cheese = 790 calories"
             }
                
             else if (cewe < 2400 && cewe > 2200  ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\nEggs with bacon and cheese + 1 glass of chocolate milk = 630 calories"
                 listmakanan2.text="LUNCH\n2 servings of Turkey and Swiss Sandwich = 870 calories"
                 listmakanan3.text="DINNER\n1 bowl of High Protein Chicken Alfredo = 835 calories"
             }
                
             else if (cewe < 2600 && cewe > 2400  ) {
                 makanan.text="List of Food You Need to Eat :"
                 listmakanan1.text=""
                 listmakanan2.text=""
                 listmakanan3.text=""
                 listmakanan1.text="BREAKFAST\n2 servings of Poached eggs in Spinach = 769 calories"
                 listmakanan2.text="LUNCH\n2 Portion of Tuna Salad Wrap with Veggies = 712 calories"
                 listmakanan3.text="DINNER\n2 servings of Chicken and Beef with Easy Chili and garlic green beans = 1005 calories"
             }
            else {
                       listmakanan1.text=""
                       listmakanan2.text=""
                       listmakanan3.text=""
                       listmakanan1.text="WRITE VALID HEIGHT AND WEIGHT"
                   }
            
        }
        else if g  == "M" || g=="m" || g=="male" || g=="Male" || g=="MALE"{
            result.text = String(Int(hitungkaloricowo.hitungberattinggicowo()))
             if (cowo < 1000 && cowo > 800){
                    makanan.text="List of Food You Need to Eat :"
                    listmakanan1.text=""
                               listmakanan2.text=""
                               listmakanan3.text=""
                               listmakanan1.text="BREAKFAST\nHalf Bowl of Raisin Cereal = 200 calories"
                               listmakanan2.text="LUNCH\nSalad with Oil and Vinegar Dressing = 350 calories"
                               listmakanan3.text="DINNER\n1/4 plate of Fish with 1/4 Plate of Brown Rice with 1/3 Plate of Spinach = 500 calories"
                    }
                else if (cowo < 1200 && cowo > 1000){
                makanan.text="List of Food You Need to Eat :"
                listmakanan1.text=""
                listmakanan2.text=""
                listmakanan3.text=""
                listmakanan1.text="BREAKFAST\nA Bowl of raisin cereal = 300 calories"
                listmakanan2.text="LUNCH\nFried Rice with sunny side up= 500 calories"
                listmakanan3.text="DINNER\nVeggie Burger with meat only= 400 calories"
                }
            else if (cowo < 1400 && cowo > 1200){
                               makanan.text="List of Food You Need to Eat :"
                               listmakanan1.text=""
                               listmakanan2.text=""
                               listmakanan3.text=""
                               listmakanan1.text="BREAKFAST\n3/4 Cup Yogurt +1 Cup Blueberries + 2 Hard Boiled Eggs = 350 calories"
                               listmakanan2.text="LUNCH\nSalad with chicken breast and mayo sauce= 550 calories"
                               listmakanan3.text="DINNER\nCarbonara Spaghetti with shrimp= 400 calories"
                               }
                else if  (cowo < 1600 && cowo > 1400){
                               makanan.text="List of Food You Need to Eat :"
                               listmakanan1.text=""
                               listmakanan2.text=""
                               listmakanan3.text=""
                               listmakanan1.text="BREAKFAST\nAvocado & Aragula Omelet = 344 calories"
                               listmakanan2.text="LUNCH\nRoasted Veggie and Beef salad= 578 calories"
                               listmakanan3.text="DINNER\nZuchinni Noodles with Avocado Pesto&Shrimp = 450 calories"

                           }
                       
                else if (cowo < 1800 && cowo > 1600){
                    makanan.text="List of Food You Need to Eat :"
                    listmakanan1.text=""
                    listmakanan2.text=""
                    listmakanan3.text=""
                    listmakanan1.text="BREAKFAST\n1/2 Cup Dry Oatmeal with 1 Medium Banana and Cinnamon = 445 calories"
                    listmakanan2.text="LUNCH\n1 Cup Baby Carrots with 2 Hard Boiled Eggs and Chicken Breast = 566 calories"
                    listmakanan3.text="DINNER\n5 Strips Bacon with 2 Cups Lettuce+2 hard Boiled Eggs+Medium Banana and Avocado = 680 calories"
                }
                else if  (cowo < 2000 && cowo > 1800){
                    makanan.text="List of Food You Need to Eat :"
                    listmakanan1.text=""
                    listmakanan2.text=""
                    listmakanan3.text=""
                    listmakanan1.text="BREAKFAST\nTurkey and cheese omelet with 2 buttered toast = 626 calories"
                    listmakanan2.text="LUNCH\nHummus and veggies sandwich = 532 calories"
                    listmakanan3.text="DINNER\n2 roll chicken wraps = 736 calories"
                }
                else if (cowo < 2200 && cowo > 2000){
                               makanan.text="List of Food You Need to Eat :"
                               listmakanan1.text=""
                               listmakanan2.text=""
                               listmakanan3.text=""
                               listmakanan1.text="BREAKFAST\n2 Shakes Raspeberies and Blueberies smoothies = 603 calories"
                               listmakanan2.text="LUNCH\n2 chicken salad sandwich with 1 serving of yogurt and banana = 736 calories"
                               listmakanan3.text="DINNER\nBasic chicken salad with spicy garlic brocoli and cheese = 790 calories"
                           }
                else if  (cowo < 2400 && cowo > 2200){
                               makanan.text="List of Food You Need to Eat :"
                               listmakanan1.text=""
                               listmakanan2.text=""
                               listmakanan3.text=""
                               listmakanan1.text="BREAKFAST\nEggs with bacon and cheese + 1 glass of chocolate milk = 630 calories"
                               listmakanan2.text="LUNCH\n2 servings of Turkey and Swiss Sandwich = 870 calories"
                               listmakanan3.text="DINNER\n1 bowl of High Protein Chicken Alfredo = 835 calories"
                           }
                else if (cowo < 2600 && cowo > 2400){
                    makanan.text="List of Food You Need to Eat :"
                    listmakanan1.text=""
                    listmakanan2.text=""
                    listmakanan3.text=""
                    listmakanan1.text="BREAKFAST\n2 servings of Poached eggs in Spinach = 769 calories"
                    listmakanan2.text="LUNCH\n2 Portion of Tuna Salad Wrap with Veggies = 712 calories"
                    listmakanan3.text="DINNER\n2 servings of Chicken and Beef with Easy Chili and garlic green beans = 1005 calories"
                }
            else {
                       listmakanan1.text=""
                       listmakanan2.text=""
                       listmakanan3.text=""
                       listmakanan1.text="WRITE VALID HEIGHT AND WEIGHT"
                   }
        
        }
        
//        if (cowo==cowo || cewe==cewe) {
//            let myAlert = UIAlertController(title: "Alert", message: "Please input another number, you have entered that number!", preferredStyle:
//                           .alert)
//                       let action = UIAlertAction(title: "Ok!", style: .cancel, handler: nil)
//
//                       myAlert.addAction(action)
//                       self.present(myAlert,animated: true,completion: nil)
//                       return
//        }
        }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var vc = segue.destination as! HalTiga
//        vc.finalAge = self.ageText
//    }
//
    @objc func checkGenderError (gendertextfield : UITextField){
        if (gendertextfield.text?.count ?? 0>1){
            errorLabel.text = "Please enter valid gender!"
        }else{
            errorLabel.text = ""
        }
    }
    
//    @objc func Clicked(){
//        let ab = ViewController ()
//        ab.modalPresentationStyle = .fullScreen
//        self.present(ab, animated: true, completion: nil)
//    }
//

}

