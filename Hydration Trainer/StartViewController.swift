//
//  StartViewController.swift
//  Hydration Trainer
//
//  Created by Ian Kohlert on 2016-10-25.
//  Copyright © 2016 Ian Kohlert. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        //        view.addSubview(blurEffectView)
        blurEffectView.alpha = 0.9
        view.insertSubview(blurEffectView, at: 0)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Look at segue for how I do this
    
    @IBAction func startDay(_ sender: AnyObject) {
        UserDefaults.standard.set("Start", forKey: "startDay")
//        print(UserDefaults.standard.object(forKey: "startDay") ?? <#default value#>)
        self.dismiss(animated: true, completion: nil)
    }
}
