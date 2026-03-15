import UIKit

class IntroViewController: UIPageViewController {
    
    lazy var pages: [UIViewController] = {
        return [
            storyboard!.instantiateViewController(withIdentifier: "FirstIntroPage"),
            storyboard!.instantiateViewController(withIdentifier: "SecondIntroPage"),
            storyboard!.instantiateViewController(withIdentifier: "ThirdIntroPage")
        ]
    }()

    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = .lightGray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self

        setViewControllers([pages[0]], direction: .forward, animated: true)

        pageControl.numberOfPages = pages.count
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func goToMain() {
//        UserDefaults.standard.set(true, forKey: "hasCompletedIntro")
        UserDefaults.standard.set(false, forKey: "hasCompletedIntro")

        let mainStoryboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController")

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }

        window.rootViewController = mainVC
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
    }
}
