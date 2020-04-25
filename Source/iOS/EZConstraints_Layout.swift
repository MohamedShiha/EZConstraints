//
//    EZConstraints_Layout.swift
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
    @discardableResult
    func layoutBelow(_ view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        
        return EZConstraint.create(item: self, attribute: .top, relatedBy: relation, priority: p, toItem: view, attribute: .bottom, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutBelowFirstBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .top, relatedBy: relation, priority: p, toItem: view, attribute: .firstBaseline, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutBelowLastBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .top, relatedBy: relation, priority: p, toItem: view, attribute: .lastBaseline, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutRight(to view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .leading, relatedBy: relation, priority: p, toItem: view, attribute: .trailing, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutAbove(_ view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .bottom, relatedBy: relation, priority: p, toItem: view, attribute: .top, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutAboveFirstBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .bottom, relatedBy: relation, priority: p, toItem: view, attribute: .firstBaseline, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutAboveLastBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .bottom, relatedBy: relation, priority: p, toItem: view, attribute: .lastBaseline, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutLeft(to view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .trailing, relatedBy: relation, priority: p, toItem: view, attribute: .leading, multiplier: m, constant: -c, isActive)
    }
}

public extension Array where Element == UIView {
    
    @discardableResult
    func layoutViews(_ layoutFunction: (_ currentView: UIView) -> EZConstraint) -> EZConstraints {
        var constraints = EZConstraints()
        forEach { (view) in
            let constraint = layoutFunction(view)
            constraints.append(constraint)
        }
        return constraints
    }
    
    @discardableResult
    func layoutBelow(_ view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutBelow(view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @discardableResult
    func layoutBelowFirstBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutBelowFirstBaseline(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutBelowLastBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutBelowLastBaseline(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutRight(to view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
    
        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutRight(to: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutAbove(_ view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {

        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutAbove(view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutAboveFirstBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
    
        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutAboveFirstBaseline(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutAboveLastBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutAboveLastBaseline(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func layoutLeft(to view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return layoutViews { (selectedView) -> EZConstraint in
            return selectedView.layoutLeft(to: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
}
