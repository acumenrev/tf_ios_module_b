//
//  ProfileViewController.swift
//  
//
//  Created by AL-TVO163 on 20/06/2023.
//

import UIKit
import RxSwift
import RxFlow
import RxCocoa
import Reusable
import tf_ios_app_flows
import URLNavigator

public class ProfileViewModel  : Stepper, ViewModel {
    public let steps: PublishRelay<Step> = PublishRelay<Step>()
    
    public init() {
        
    }
    
    func navigateToUpdateProfile() {
        steps.accept(FlowBStepper.updateProfileSuccess)
    }
}

public class ProfileViewController : UIViewController, StoryboardBased, ViewModelBased {
    public var viewModel: ProfileViewModel!
    
    typealias ViewModelType = ProfileViewModel
    
    public var navigator : NavigatorProtocol?
    
    public static func instantiate(viewModel : ProfileViewModel) -> ProfileViewController? {
        let storyboard = UIStoryboard.init(name: "Profile", bundle: .module)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return nil }
        vc.viewModel = viewModel
        vc.title = "Login"
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func btnClicked(_ sender : Any) {
        viewModel.navigateToUpdateProfile()
//        navigator?.push(ModuleBRoutes.profileUpdateResult.rawValue, context: ["message": "Update profile success"], from: .none, animated: true)
    }
}
