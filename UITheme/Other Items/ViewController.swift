//
//  ViewController.swift
//  UITheme
//
//  Created by Erik Bean on 2/7/18.
//  Copyright © 2018 Brick Water Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIThemeDelegate {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var page: UIPageControl!
    
    let manager = UITheme.manager

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.forceFailedChange = false
        
    /*  AUTO MANAGED by UITheme
    *
    *  Slide, Progress Bar, Button
    */
// View Theme
        let mvProfile = UIThemeProfile.view(defaultBackground: .white, themeBackground: .black)
        mvProfile.themeTint = UIColor(red: 54/255, green: 124/255, blue: 22/255, alpha: 1)
        mvProfile.defaultTint = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        mvProfile.statusBar = true
        let mvElement = UIThemeElement(element: view, profile: mvProfile)
// Label Theme
        let lProfile = UIThemeProfile.label(defaultTextColor: .black, themeTextColor: .white)
        lProfile.themeTextColor = UIColor(red: 255/255, green: 208/255, blue: 255/255, alpha: 1)
        lProfile.defaultText = "Light Theme"
        lProfile.themeText = "Dark Theme"
        let lElement = UIThemeElement(element: label, profile: lProfile)
// Page Control Theme
        let tcPages = UIColor(red: 237/255, green: 126/255, blue: 77/255, alpha: 1)
        let tPages = UIColor(red: 54/255, green: 124/255, blue: 22/255, alpha: 1)
        let pcProfile = UIThemeProfile.pagecontrol(defaultPagesColor: .black, themePagesColor: tPages, defaultCurrentPageColor: .lightGray, themeCurrentPageColor: tcPages)
        let pcElement = UIThemeElement(element: page, profile: pcProfile)
        
// Fail Object
//        let fProfile = UIThemeProfile.view(defaultBackground: .black, themeBackground: .blue)
//        let fElement = UIThemeElement(element: label, profile: fProfile)
        
// Object Pool
        manager.addToPool([mvElement, lElement, pcElement])
        
// Pool validation
        let validation = manager.validatePool()
        if validation.element != nil {
            print("--------------------------------")
            print("Validation Failed")
            print("Element: \(describing: validation.element?.debugDescription)")
            print("Error: \(validation.error!.localizedDescription)")
            print("--------------------------------")
        } else {
            print("Validation Passed, there are no objects that will fail theaming")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var isenabled = false
    @IBAction func changeTheme() {
        if !manager.isThemeOn {
            manager.enableTheme()
        } else {
            manager.disableTheme()
        }
    }
    
    func themeWillChange() {
        print("Theme Will Change")
    }
    
    func themeDidChange() {
        print("Theme Successfully Changed")
    }
    
    func themeDidNotChange(onElement: UIThemeElement?, error: Error) {
        print("--------------------------------")
        print("Theme Did Not Change!")
        print("Element: \(describing: onElement?.element.debugDescription)")
        print("Error: \(error.localizedDescription)")
        print("--------------------------------")
    }

}
