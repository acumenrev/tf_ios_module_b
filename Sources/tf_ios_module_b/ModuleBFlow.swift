//
//  File.swift
//  
//
//  Created by AL-TVO163 on 20/06/2023.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift
import UIKit
import tf_ios_app_flows

public class ModuleBFlow : IFlowB {
    public var root: Presentable {
        return self.rootViewController
    }
    
    
    
    
    private let rootViewController = UINavigationController()
    
    public var appService: String
    
    public init(appService: String) {
        self.appService = appService
    }
    
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let bStep = step as? FlowBStepper else { return .none }
        
        switch bStep {
        case .profile:
            return navigateToProfileScreen()
        case .updateProfileSuccess:
            return navigateToUpdateProfileSuccess()
        case .updateProfileWithPayload(let data):
            return navigatToUpdateProfileWithPayload(payload: data)
        }
        
        return .none
    }
    
    private func navigateToProfileScreen() -> FlowContributors {
        guard let vc = ProfileViewController.instantiate(viewModel: ProfileViewModel()) else { return .none }
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func navigateToUpdateProfileSuccess() -> FlowContributors {
        guard let vc = ProfileUpdateViewController.initVC(viewModel: ProfileUpdateViewModel()) else { return .none }
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func navigatToUpdateProfileWithPayload(payload : String) -> FlowContributors {
        guard let vc = ProfileUpdateViewController.initVC(viewModel: ProfileUpdateViewModel()) else { return .none }
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
}

public class ModuleBStepper : Stepper {
    public init() {}
    public let steps = PublishRelay<Step>()
    
    public var initialStep: Step {
        return FlowBStepper.profile
    }
}
