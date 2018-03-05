//
//  ViewController.swift
//  UITheme
//
//  Created by Erik Bean on 2/7/18.
//  Copyright © 2018 Brick Water Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var page: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var isenabled = false
    @IBAction func changeTheme() {
        
/*  AUTO MANAGED by UITheme
 *
 *  Slide, Progress Bar, Button (unsupported)
 */
        
// View Theme
        let mvProfile = UIThemeProfile.view(defaultBackground: .white, themeBackground: .black)
        mvProfile.themeTint = UIColor(red: 54/255, green: 124/255, blue: 22/255, alpha: 1)
        mvProfile.defaultTint = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        mvProfile.statusBar = true
// Label Theme
        let lProfile = UIThemeProfile.label(defaultTextColor: .black, themeTextColor: .white)
        lProfile.themeTextColor = UIColor(red: 255/255, green: 208/255, blue: 255/255, alpha: 1)
        lProfile.defaultText = "Light Theme"
        lProfile.themeText = "Dark Theme"
// Page Control Theme
        let tcPages = UIColor(red: 237/255, green: 126/255, blue: 77/255, alpha: 1)
        let tPages = UIColor(red: 54/255, green: 124/255, blue: 22/255, alpha: 1)
        let pcProfile = UIThemeProfile.pagecontrol(defaultPagesColor: .black, themePagesColor: tPages, defaultCurrentPageColor: .lightGray, themeCurrentPageColor: tcPages)
        
        if !isenabled {
            do {
                try view.enableTheme(profile: mvProfile)
                try label.enableTheme(profile: lProfile)
                try page.enableTheme(profile: pcProfile)
                isenabled = true
            } catch {
                print("Error enabling theme")
            }
        } else {
            do {
                try view.disableTheme(profile: mvProfile)
                try label.disableTheme(profile: lProfile)
                try page.disableTheme(profile: pcProfile)
                isenabled = false
            } catch {
                print("Error disabling theme")
            }
        }
    }

}
