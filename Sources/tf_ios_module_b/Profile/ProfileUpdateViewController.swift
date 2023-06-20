//
//  ProfileUpdateViewController.swift
//  
//
//  Created by AL-TVO163 on 20/06/2023.
//

import UIKit
import RxSwift
import RxFlow
import RxCocoa
import Reusable

class ProfileUpdateViewModel : Stepper, ViewModel {
    let steps: PublishRelay<Step> = PublishRelay<Step>()
    
    public init() {
        
    }
}

class ProfileUpdateViewController: UIViewController, ViewModelBased {
    typealias ViewModelType = ProfileUpdateViewModel
    
    public var viewModel: ProfileUpdateViewModel!
    
    public static func initVC(viewModel : ProfileUpdateViewModel) -> ProfileUpdateViewController? {
        let storyboard = UIStoryboard.init(name: "Profile", bundle: .module)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ProfileUpdateViewController") as? ProfileUpdateViewController else { return nil }
        vc.viewModel = viewModel
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
