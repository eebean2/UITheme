//
//  File.swift
//  UITheme
//
//  Created by Erik Bean on 2/7/18.
//  Copyright © 2018 Brick Water Studios. All rights reserved.
//

import UIKit

public enum UIThemeError: Error {
    case wrongProfileType
    case unsupportedType
}

extension UIThemeError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongProfileType:
            return NSLocalizedString("Profile does not match Theme Object, please check profile type!", comment: "")
        case .unsupportedType:
            return NSLocalizedString("This object is not supported.", comment: "")
        }
    }
}

class UITheme {
    
    /// UITheme Manager
    public static let manager = UITheme()
    private init() {}
    
    /// UIThemeObject Pool
    private var elementPool = [UIThemeElement]()
    
    //MARK: -Theme Options and Checks
    public weak var delegate: UIThemeDelegate?
    /// Check if dark mode is enabled
    public private(set) var isThemeOn = false
    /// Time at which everything animates
    public var animationTime: TimeInterval = 0.5
    
    //MARK: -Methods
    
    public func poolContains(_ element: UIThemeElement) -> Bool {
        if elementPool.contains(element) {
            return true
        } else {
            return false
        }
    }
    
    func addToPool(_ element: UIThemeElement) {
        elementPool.append(element)
    }
    
    func addToPool(_ elements: [UIThemeElement]) {
        elementPool.append(contentsOf: elements)
    }
    
    func remove(_ element: UIThemeElement) {
        elementPool.remove(at: elementPool.index(of: element)!)
    }
    
    public func enableTheme(animated: Bool = true) throws {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animated {
            t = animationTime
        }
        UIView.animate(withDuration: t, animations: {
            UIView.animate(withDuration: t) {
                for element in self.elementPool {
                    try? element.enableTheme(animated: false)
                }
            }
        }) { (_) in
            self.isThemeOn = true
            self.delegate?.themeDidChange!()
        }
    }
    
    public func disableTheme(animated: Bool = true) throws {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animated {
            t = animationTime
        }
        UIView.animate(withDuration: t, animations: {
            for element in self.elementPool {
                try? element.disableTheme(animated: false)
            }
        }) { (_) in
            self.isThemeOn = false
            self.delegate?.themeDidChange!()
        }
    }
}

@objc public protocol UIThemeDelegate: class {
    @objc optional func themeWillChange()
    
// TODO: Subsitute above throws for didNotChange.
//       Must include a backup call to disable/
//       enable theme to revert changes.
    
//    @objc optional func themeDidNotChange(error: Error)
    @objc optional func themeDidChange()
}

// TODO: Add preset themes
//public enum UIThemePreset {
//    case hombrew
//    case dark
//    case light
//}

