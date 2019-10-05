import UIKit

protocol LayoutAnchor {
    func constraint(equalTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {}

protocol LayoutDimension {
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(equalTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint

    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint

    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutDimension: LayoutDimension {}

struct LayoutProperty<Anchor: LayoutAnchor> {
    fileprivate let anchor: Anchor
}

final class LayoutProxy {
    lazy var leading = property(with: view.leadingAnchor)
    lazy var trailing = property(with: view.trailingAnchor)
    lazy var top = property(with: view.topAnchor)
    lazy var bottom = property(with: view.bottomAnchor)
    lazy var width = property(with: view.widthAnchor)
    lazy var height = property(with: view.heightAnchor)
    lazy var centerY = property(with: view.centerYAnchor)
    lazy var centerX = property(with: view.centerXAnchor)

    private let view: UIView

    fileprivate init(view: UIView) {
        self.view = view
    }

    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
}

extension LayoutProperty {
    func equal(to otherAnchor: Anchor,
               offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor,
                          constant: constant).isActive = true
    }

    func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }

    func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
}

extension LayoutProperty where Anchor: LayoutDimension {
    func equal(to constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }

    func lessThanOrEqual(to constant: CGFloat) {
        anchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }

    func greaterThanOrEqual(to constant: CGFloat) {
        anchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
    }

    func equal(to dimension: Anchor, multiplier: CGFloat, constant: CGFloat = 0.0) {
        anchor.constraint(equalTo: dimension,
                          multiplier: multiplier,
                          constant: constant).isActive = true
    }

    func greaterThanOrEqual(to dimension: Anchor, multiplier: CGFloat, offsetBy constant: CGFloat = 0.0) {
        anchor.constraint(greaterThanOrEqualTo: dimension,
                          multiplier: multiplier,
                          constant: constant).isActive = true
    }

    func lessThanOrEqual(to dimension: Anchor, multiplier: CGFloat, offsetBy constant: CGFloat = 0.0) {
        anchor.constraint(lessThanOrEqualTo: dimension,
                          multiplier: multiplier,
                          constant: constant).isActive = true
    }
}

extension UIView {
    func addSubview(_ view: UIView, layout: (LayoutProxy) -> Void) {
        addSubview(view)
        view.layout(using: layout)
    }

    func addSubviewAndEdgeToSuperView(_ view: UIView) {
        addSubview(view)
        view.layout {
            $0.top == self.topAnchor
            $0.bottom == self.bottomAnchor
            $0.leading == self.leadingAnchor
            $0.trailing == self.trailingAnchor
        }
    }

    func addSubviewAndEdgeToSuperViewForiOS10(_ view: UIView) {
        addSubview(view)
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        view.layout {
            $0.top == self.topAnchor - statusBarHeight
            $0.bottom == self.bottomAnchor
            $0.leading == self.leadingAnchor
            $0.trailing == self.trailingAnchor
        }
    }

    func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
}

struct ScaledDimension<Anchor: LayoutDimension> {
    let anchor: Anchor
    let multiplier: CGFloat
    let constant: CGFloat

    init(anchor: Anchor, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
    }
}

func + <A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

func + <A: LayoutDimension>(lhs: ScaledDimension<A>, rhs: CGFloat) -> ScaledDimension<A> {
    return ScaledDimension(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: rhs)
}

func - <A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

func - <A: LayoutDimension>(lhs: ScaledDimension<A>, rhs: CGFloat) -> ScaledDimension<A> {
    return ScaledDimension(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: -rhs)
}

func * <A: LayoutDimension>(lhs: A, rhs: CGFloat) -> ScaledDimension<A> {
    return ScaledDimension(anchor: lhs, multiplier: rhs)
}

func / <A: LayoutDimension>(lhs: A, rhs: CGFloat) -> ScaledDimension<A> {
    precondition(rhs != 0, "Dividing an anchor by 0 is impossible.")
    return ScaledDimension(anchor: lhs, multiplier: 1 / rhs)
}

func == <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

func == <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

func == <A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

func == <A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: ScaledDimension<A>) {
    lhs.equal(to: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
}

func >= <A: LayoutAnchor>(lhs: LayoutProperty<A>,
                          rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func >= <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

func >= <A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}

func >= <A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: ScaledDimension<A>) {
    lhs.greaterThanOrEqual(to: rhs.anchor, multiplier: rhs.multiplier, offsetBy: rhs.constant)
}

func <= <A: LayoutAnchor>(lhs: LayoutProperty<A>,
                          rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func <= <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

func <= <A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}

func <= <A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: ScaledDimension<A>) {
    lhs.lessThanOrEqual(to: rhs.anchor, multiplier: rhs.multiplier, offsetBy: rhs.constant)
}
