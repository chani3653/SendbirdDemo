import UIKit

extension IntroViewController: UIPageViewControllerDataSource {

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {

        guard let index = pages.firstIndex(of: viewController),
              index > 0 else { return nil }

        return pages[index - 1]
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {

        guard let index = pages.firstIndex(of: viewController),
              index < pages.count - 1 else { return nil }

        return pages[index + 1]
    }
}

// MARK: - UIPageViewControllerDelegate

extension IntroViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard completed,
              let currentVC = viewControllers?.first,
              let index = pages.firstIndex(of: currentVC) else { return }

        pageControl.currentPage = index
    }
}



