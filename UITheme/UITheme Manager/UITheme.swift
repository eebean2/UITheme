//
//  File.swift
//  UITheme
//
//  Created by Erik Bean on 2/7/18.
//  Copyright © 2018 Brick Water Studios. All rights reserved.
//

import UIKit

class UITheme {
    
    /// UITheme Manager
    public static let manager = UITheme()
    private init() {}
    
    /// UIThemeObject Pool
    private var elementPool = [UIThemeElement]()
    
    //MARK: -Theme Options and Checks
    public weak var delegate: UIThemeDelegate?
    /// Check if dark mode is enabled
    public private(set) var isDarkMode = false
    /// Auto-update the status bar
    public var statusBarAutoUpdate = true
    
    //MARK: -Methods
    
    public func poolContains(element: UIThemeElement) -> Bool {
//        if elementPool.contains(element) {
//            return true
//        } else {
//            return false
//        }
        return false
    }
    
    func addToPool(element: UIThemeElement) {
        
    }
    
    func remove(element: UIThemeElement) {
        
    }
    
    public func enableTheme() throws {
//        for element in elementPool {
//            switch element {
//            case is UIView:
//                break
//            default:
//                break
//            }
//        }
        
        
        
        
        
        
//  This is an additional switch attempt
//
//
//        for e in elementPool {
//            switch e.elementType {
//                case
//            }
//
//
//            if e.elementType == .uninit {
//                throw NSError(domain: "UIThemeError", code: 000, userInfo: [NSLocalizedDescriptionKey: "UIThemeElement has not been configured correctly, please call UIThemeElement.[elementtype] to configure this element."])
//            } else {
//                switch e.elementType {
//                    case
//                }
//            }
//        }
    }
}

@objc public protocol UIThemeDelegate: class {
    @objc optional func themeWillChange()
    @objc optional func themeDidNotChange(error: Error)
    @objc optional func themeDidChange()
}

public enum UIThemePreset {
    case hombrew
    case dark
    case light
}

public class UIThemeElement: NSObject {
    public typealias ThemeElement<T: UIThemeElementProtocol> = T

    public init(element: ThemeElement<UIView>, profile: UIThemeProfile) {
        self.element = element
        self.profile = profile
    }

    public var element: ThemeElement<UIView>
    public var profile: UIThemeProfile
}

