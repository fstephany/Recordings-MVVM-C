import AVFoundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let splitViewController = window!.rootViewController as! UISplitViewController
        splitViewController.delegate = self
        splitViewController.preferredDisplayMode = .allVisible
        coordinator = Coordinator(splitViewController)
        return true
    }

    func splitViewController(_: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto _: UIViewController) -> Bool {
        guard let topAsDetailController = (secondaryViewController as? UINavigationController)?.topViewController as? PlayViewController else { return false }
        if topAsDetailController.viewModel.recording.value == nil {
            // Don't include an empty player in the navigation stack when collapsed
            return true
        }
        return false
    }

    func application(_: UIApplication, shouldSaveApplicationState _: NSCoder) -> Bool {
        return true
    }

    func application(_: UIApplication, shouldRestoreApplicationState _: NSCoder) -> Bool {
        return true
    }
}
