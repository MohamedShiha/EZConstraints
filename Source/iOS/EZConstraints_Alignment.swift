//
//    EZConstraints_Alignment.swift
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
    func alignTop(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .top, relatedBy: relation, priority: p, toItem: view, attribute: .top, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignLeft(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .leading, relatedBy: relation, priority: p, toItem: view, attribute: .leading, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignBottom(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .bottom, relatedBy: relation, priority: p, toItem: view, attribute: .bottom, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignRight(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .trailing, relatedBy: relation, priority: p, toItem: view, attribute: .trailing, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterHorizontally(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerX, relatedBy: relation, priority: p, toItem: view, attribute: .centerX, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterXWithLeft(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerX, relatedBy: relation, priority: p, toItem: view, attribute: .leading, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterXWithRight(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerX, relatedBy: relation, priority: p, toItem: view, attribute: .trailing, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterVertically(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerY, relatedBy: relation, priority: p, toItem: view, attribute: .centerY, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithTop(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerY, relatedBy: relation, priority: p, toItem: view, attribute: .top, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithFirstBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerY, relatedBy: relation, priority: p, toItem: view, attribute: .firstBaseline, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithLastBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerY, relatedBy: relation, priority: p, toItem: view, attribute: .lastBaseline, multiplier: m, constant: -c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithBottom(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .centerY, relatedBy: relation, priority: p, toItem: view, attribute: .bottom, multiplier: m, constant: -c, isActive)
    }
}

public extension Array where Element: UIView {
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignTop(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignTop(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignLeft(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignLeft(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignBottom(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignBottom(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignRight(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignRight(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterHorizontally(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterHorizontally(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterXWithLeft(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterXWithLeft(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterXWithRight(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterXWithRight(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterVertically(with view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterVertically(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithTop(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterYWithTop(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithFirstBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterYWithFirstBaseline(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithLastBaseline(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterYWithLastBaseline(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func alignCenterYWithBottom(of view: UIView, priority p: LayoutPriority = .required, _ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.alignCenterYWithBottom(of: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
}
