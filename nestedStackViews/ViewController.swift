import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBordersOfHierarchy(withRootView: view)
    }

    @IBAction private func buttonWasTapped() {
        UIView.animate(withDuration: 1) {
            self.innerView.isHidden = !self.innerView.isHidden
        }
    }

    @IBOutlet private var innerView: UIView!

}

private func setBordersOfHierarchy(withRootView view: UIView) {
    if !(view.layer is CATransformLayer) {
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 0.5
    }
    view.subviews.forEach { setBordersOfHierarchy(withRootView: $0) }
}

