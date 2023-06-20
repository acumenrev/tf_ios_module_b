//
//  File.swift
//  
//
//  Created by AL-TVO163 on 20/06/2023.
//

import Foundation
import tf_ios_app_flows
import URLNavigator


public struct ModuleBRouter {
    public static func initialize(navigator: NavigatorProtocol) {
        navigator.register(ModuleBRoutes.profile.rawValue) { url, values, context in
            guard let vc = ProfileViewController.instantiate(viewModel: ProfileViewModel()) else { return nil }
            vc.navigator = navigator
            return vc
        }
        
        navigator.register(ModuleBRoutes.profileUpdateResult.rawValue) { url, values, context in
            guard let vc = ProfileUpdateViewController.initVC(viewModel: ProfileUpdateViewModel()) else { return nil }
            var message : String = ""
            if let dContext = context as? [String: Any] {
                message = (dContext["message"] as? String) ?? ""
            }
            print("open profule update result with message: \(message)")
            vc.navigator = navigator
            return vc
        }
    }
    
}

