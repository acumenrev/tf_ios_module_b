//
//  SceneDelegate.swift
//  DemoFlowB
//
//  Created by AL-TVO163 on 20/06/2023.
//

import UIKit
import tf_ios_module_b
import RxSwift
import RxCocoa
import RxFlow
import tf_ios_app_flows
import URLNavigator

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let disposeBag = DisposeBag()
    let coordinator = FlowCoordinator()
    private var appNavigator: NavigatorProtocol?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        /*
        let navigator = Navigator()
        ModuleBRouter.initialize(navigator: navigator)
        if let vc = ProfileViewController.instantiate(viewModel: .init()) {
            vc.navigator = navigator
            window?.rootViewController = UINavigationController.init(rootViewController: vc)
        }
        
        self.appNavigator = navigator
         */
        
        self.coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
            print("will navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)
        
        self.coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            print("did navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)
        
        
        
        let nav = UINavigationController()
        let moduleBFlow = ModuleBFlow(appService: "Service", rootVC: nav)
        self.coordinator.coordinate(flow: moduleBFlow, with: ModuleBStepper())
        print("setup coordinator")
        weak var weakSelf = self
        Flows.use(moduleBFlow, when: .created) { root in
            print("Flow init with root view controller: \(root)")
            weakSelf?.window?.rootViewController = nav
            weakSelf?.window?.makeKeyAndVisible()
            print("Flow finish")
        }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

