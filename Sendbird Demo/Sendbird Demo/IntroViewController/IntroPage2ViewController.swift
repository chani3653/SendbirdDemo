import UIKit

class SecondIntroPageViewController: UIViewController {

    @IBOutlet weak var profileImageContainerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUI()
    }

    func setUI() {
        // 이미지뷰: 원형으로 잘라내기
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2

        // 컨테이너: 원형 그림자
        profileImageContainerView.layer.cornerRadius = profileImageContainerView.frame.height / 2
        
        profileImageContainerView.layer.shadowColor = UIColor.black.cgColor
        profileImageContainerView.layer.shadowOpacity = 0.3
        profileImageContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        profileImageContainerView.layer.shadowRadius = 8
    }
}
