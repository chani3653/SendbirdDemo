import UIKit

class ThirdIntroPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goToMainPage(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "hasCompletedIntro")

        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }

        window.rootViewController = mainVC
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
    }
}
