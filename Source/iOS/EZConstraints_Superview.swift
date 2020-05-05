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

    @available(iOS 8.0, *)
    func edgesToSuperView(including includedEdges: [LayoutEdge] = [.top, .left, .bottom, .right], insets: EZInsets = .zero) {
        
        if includedEdges.contains(.top) {
            layTopInSuperView(constant: insets.top)
        }
        
        if includedEdges.contains(.left) {
            layLeftInSuperView(constant: insets.left)
        }
        
        if includedEdges.contains(.bottom) {
            layBottomInSuperView(constant: insets.bottom)
        }
        
        if includedEdges.contains(.right) {
            layRightInSuperView(constant: insets.right)
        }
    }
    
    @available(iOS 11.0, *)
    func edgesToSuperviewSafeArea(including includedEdges: [LayoutEdge] = [.top, .left, .bottom, .right], insets: EZInsets = .zero) {

        if includedEdges.contains(.top) {
            layTopToSafeArea(constant: insets.top)
        }
        
        if includedEdges.contains(.left) {
            layLeftToSafeArea(constant: insets.left)
        }
        
        if includedEdges.contains(.bottom) {
            layBottomToSafeArea(constant: insets.bottom)
        }
        
        if includedEdges.contains(.right) {
            layRightToSafeArea(constant: insets.right)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layTopToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layTopInSuperView(priority: p, relation, multiplier: m, constant: c + insets.top, isActive)
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layLeftToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layLeftInSuperView(priority: p, relation, multiplier: m, constant: c + insets.left, isActive)
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layBottomToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layBottomInSuperView(priority: p, relation, multiplier: m, constant: c + insets.bottom, isActive)
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layRightToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        let insets = getSuperview().safeAreaInsets
        return layRightInSuperView(priority: p, relation, multiplier: m, constant: c + insets.right, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layTopInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .top, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .top, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layLeftInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .leading, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .leading, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layBottomInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .bottom, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .bottom, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
     func layRightInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .trailing, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .trailing, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerHorizontally(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, xOffset x: CGFloat = 0, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerX, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .centerX, multiplier: m, constant: x, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerVertically(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, yOffset y: CGFloat = 0, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerY, relatedBy: relation, priority: p, toItem: getSuperview(), attribute: .centerY, multiplier: m, constant: y, isActive)
    }
    
    @available(iOS 8.0, *)
    func center(offset point: CGPoint = .zero) {
        let superview = getSuperview()
        EZConstraint.create(item: self, attribute: .centerX, relatedBy: .equal, priority: .required, toItem: superview, attribute: .centerX, multiplier: 1, constant: point.x, true)
        EZConstraint.create(item: self, attribute: .centerY, relatedBy: .equal, priority: .required, toItem: superview, attribute: .centerY, multiplier: 1, constant: point.y, true)
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
    
    @available(iOS 8.0, *)
    func edgesToSuperView(including includedEdges: [LayoutEdge] = [.top, .left, .bottom, .right], insets: EZInsets = .zero) {
        forEach { (view) in
            view.edgesToSuperView(including: includedEdges, insets: insets)
        }
    }
    
    @available(iOS 11.0, *)
    func edgesToSuperviewSafeArea(including includedEdges: [LayoutEdge] = [.top, .left, .bottom, .right], insets: EZInsets = .zero) {
        forEach { (view) in
            view.edgesToSuperviewSafeArea(including: includedEdges, insets: insets)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layTopToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constrainViews { (view) -> EZConstraint in
            return view.layTopToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layLeftToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constrainViews { (view) -> EZConstraint in
            return view.layLeftToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layBottomToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constrainViews { (view) -> EZConstraint in
            return view.layBottomToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func layRightToSafeArea(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        return constrainViews { (view) -> EZConstraint in
            return view.layRightToSafeArea(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layTopInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constrainViews { (view) -> EZConstraint in
            return view.layTopInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }

    @available(iOS 8.0, *)
    @discardableResult
     func layLeftInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constrainViews { (view) -> EZConstraint in
            return view.layLeftInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }

    @available(iOS 8.0, *)
    @discardableResult
    func layBottomInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constrainViews { (view) -> EZConstraint in
            return view.layBottomInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }

    @available(iOS 8.0, *)
    @discardableResult
    func layRightInSuperView(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return constrainViews { (view) -> EZConstraint in
            return view.layRightInSuperView(priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerHorizontally(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, xOffset x: CGFloat = 0, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (view) -> EZConstraint in
            return view.centerHorizontally(priority: p, relation, multiplier: m, xOffset: x, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func centerVertically(priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, yOffset y: CGFloat = 0, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (view) -> EZConstraint in
            return view.centerVertically(priority: p, relation, multiplier: m, yOffset: y, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    func center(offset point: CGPoint = .zero) {
        forEach { (view) in
            view.center(offset: point)
        }
    }
}
