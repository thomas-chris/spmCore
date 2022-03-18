import UIKit

public class TestView: UIView, Instantiatable {
    
    
}

public protocol Instantiatable: UIView {
    static func instantiate() -> Self
}

public extension Instantiatable {
    static func instantiate() -> Self {
        let nib = UINib(nibName: String(describing: Self.self), bundle: Bundle.module)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
    
    static func instantiate(into container: UIView) -> Self {
        let view = instantiate()
        view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(view)
        view.constraint(edgesTo: container)
        return view
    }
}

extension UIView {
    public func constraint(edgesTo otherView: UIView, insets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            topAnchor.constraint(equalTo: otherView.topAnchor, constant: insets.top),
            leftAnchor.constraint(equalTo: otherView.leftAnchor, constant: insets.left),
            rightAnchor.constraint(equalTo: otherView.rightAnchor, constant: -insets.right),
            bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: -insets.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
