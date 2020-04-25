//
//    EZConstraints_Superview.swift
//
//    Copyright (c) 2020 Mohamed Shiha <mohamedshiha15@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.
//

public extension UIView {
    
//    @available(iOS 8.0, *)
//    func layoutInSuperView(including includedEdges: [LayoutEdge], insets: EZInsets) {
//
//        if includedEdges.contains(.top) {
//            layoutTopInSuperView(constant: insets.top)
//        }
//
//        if includedEdges.contains(.left) {
//            layoutLeftInSuperView(constant: insets.left)
//        }
//
//        if includedEdges.contains(.bottom) {
//            layoutBottomInSuperView(constant: insets.bottom)
//        }
//
//        if includedEdges.contains(.right) {
//            layoutRightInSuperView(constant: insets.right)
//        }
//    }
    
    @available(iOS 8.0, *)
    func edgesToSuperView(including includedEdges: [LayoutEdge], insets: EZInsets) {
        
        if includedEdges.contains(.top) {
            layoutTopInSuperView(constant: insets.top)
        }
        
        if includedEdges.contains(.left) {
            layoutLeftInSuperView(constant: insets.left)
        }
        
        if includedEdges.contains(.bottom) {
            layoutBottomInSuperView(constant: insets.bottom)
        }
        
        if includedEdges.contains(.right) {
            layoutRightInSuperView(constant: insets.right)
        }
    }
    
    @available(iOS 11.0, *)
    func edgesToSuperviewSafeArea(including includedEdges: [LayoutEdge], insets: EZInsets) {

        if includedEdges.contains(.top) {
            layoutTopToSafeArea(constant: insets.top)
        }
        
        if includedEdges.contains(.left) {
            layoutLeftToSafeArea(constant: insets.left)
        }
        
        if includedEdges.contains(.bottom) {
            layoutBottomToSafeArea(constant: insets.bottom)
        }
        
        if includedEdges.contains(.right) {
            layoutRightToSafeArea(constant: insets.right)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutTopToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layoutTopInSuperView(priority: p, relation, multiplier: m, constant: c + insets.top, isActive)
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutLeftToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layoutTopInSuperView(priority: p, relation, multiplier: m, constant: c + insets.left, isActive)
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutBottomToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layoutTopInSuperView(priority: p, relation, multiplier: m, constant: -c - insets.bottom, isActive)
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutRightToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layoutTopInSuperView(priority: p, relation, multiplier: m, constant: -c - insets.right, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutTopInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .top, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .top, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutLeftInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .leading, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .leading, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutBottomInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .bottom, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .bottom, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
     func layoutRightInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .trailing, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .trailing, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerHorizontally(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerX, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .centerX, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerVertically(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerY, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .centerY, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    func centerOrigin(translatedBy point: CGPoint = .zero) {
        let superview = getSuperview()
        EZConstraint.create(item: self, attribute: .centerX, relatedBy: .equal, priority: .required, toItem: superview, attribute: .centerX, multiplier: 1, constant: point.x, true)
        EZConstraint.create(item: self, attribute: .centerY, relatedBy: .equal, priority: .required, toItem: superview, attribute: .centerY, multiplier: 1, constant: point.x, true)
    }
    
     func getSuperview() -> UIView {
        guard let superview = superview else {
            invalidSuperviewException(viewDebugInfo: debugDescription)
        }
        return superview
    }
}

fileprivate func invalidSuperviewException(viewDebugInfo: String, _ isActive: Bool = true) -> Never {
    fatalError("Unable to activate constraint(s) because \(viewDebugInfo) has no superview in the view hierarchy.")
}

public extension Array where Element == UIView {
    
//    @available(iOS 8.0, *)
//    func layoutInSuperView(including includedEdges: [LayoutEdge], insets: EZInsets) {
//        forEach { (view) in
//            view.layoutInSuperView(including: includedEdges, insets: insets)
//        }
//    }
    
    @available(iOS 8.0, *)
    func edgesToSuperView(including includedEdges: [LayoutEdge], insets: EZInsets) {
        forEach { (view) in
            view.edgesToSuperView(including: includedEdges, insets: insets)
        }
    }
    
    @available(iOS 11.0, *)
    func edgesToSuperviewSafeArea(including includedEdges: [LayoutEdge], insets: EZInsets) {
        forEach { (view) in
            view.edgesToSuperviewSafeArea(including: includedEdges, insets: insets)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutTopToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constraintViews { (view) -> EZConstraint in
            return view.layoutTopToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutLeftToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constraintViews { (view) -> EZConstraint in
            return view.layoutLeftToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutBottomToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constraintViews { (view) -> EZConstraint in
            return view.layoutBottomToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layoutRightToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constraintViews { (view) -> EZConstraint in
            return view.layoutRightToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutTopInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constraintViews { (view) -> EZConstraint in
            return view.layoutTopInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }

    @available(iOS 8.0, *)
    @discardableResult
     func layoutLeftInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constraintViews { (view) -> EZConstraint in
            return view.layoutLeftInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }

    @available(iOS 8.0, *)
    @discardableResult
    func layoutBottomInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constraintViews { (view) -> EZConstraint in
            return view.layoutBottomInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }

    @available(iOS 8.0, *)
    @discardableResult
    func layoutRightInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constraintViews { (view) -> EZConstraint in
            return view.layoutRightInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerHorizontally(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraints {
        
        return constraintViews { (view) -> EZConstraint in
            return view.centerHorizontally(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerVertically(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraints {
        
        return constraintViews { (view) -> EZConstraint in
            return view.centerVertically(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    func centerOrigin(translatedBy point: CGPoint = .zero) {
        forEach { (view) in
            view.centerOrigin(translatedBy: point)
        }
    }
}
