//
//    EZConstraints_Sizing.swift
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
    func aspectRatio(priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat, constant c: CGFloat = 0, isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .width, relatedBy: relation, priority: p, toItem: self, attribute: .height, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func aspectRatio(by view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat, constant c: CGFloat = 0, isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .width, relatedBy: relation, priority: p, toItem: view, attribute: .height, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    func squareSizeWith(sideLengthOf l: CGFloat) {
        widthAnchor(.equal, constant: l)
        heightAnchor(.equal, constant: l)
    }
    
    @available(iOS 8.0, *)
    func sizeAnchor(relation: LayoutRelation = .equal, _ size: CGSize, multiplier m: CGFloat = 1, priority p: LayoutPriority = .required, _ isActive: Bool = true) {
        widthAnchor(relation, multiplier: m, constant: size.width, priority: p, isActive)
        heightAnchor(relation, multiplier: m, constant: size.width, priority: p, isActive)
    }
    
    @available(iOS 8.0, *)
    func sizeAnchor(with view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, scale s: CGSize = .zero, _ isActive: Bool = true) {
        widthAnchor(with: view, priority: p, relation, multiplier: m, constant: s.width, isActive)
        heightAnchor(with: view, priority: p, relation, multiplier: m, constant: s.height, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func widthAnchor(with view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .width, relatedBy: relation, priority: p, toItem: view, attribute: .width, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func widthAnchor(_ relation: LayoutRelation, multiplier m: CGFloat = 1, constant c: CGFloat, priority p: LayoutPriority = .required, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .width, relatedBy: relation, priority: p, toItem: nil, attribute: .width, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func heightAnchor(with view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .height, relatedBy: relation, priority: p, toItem: view, attribute: .height, multiplier: m, constant: c, isActive)
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func heightAnchor(_ relation: LayoutRelation, multiplier m: CGFloat = 1,constant c: CGFloat, priority p: LayoutPriority = .required, _ isActive: Bool = true) -> EZConstraint {
        prepareForAutoLayout()
        return EZConstraint.create(item: self, attribute: .height, relatedBy: relation, priority: p, toItem: nil, attribute: .height, multiplier: m, constant: c, isActive)
    }
}

public extension Array where Element == UIView {
    
    @available(iOS 8.0, *)
    @discardableResult
    func aspectRatio(to view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat, constant c: CGFloat = 0, isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.aspectRatio(priority: p, relation, multiplier: m, constant: c, isActive: isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func aspectRatio(by view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat, constant c: CGFloat = 0, isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.aspectRatio(by: view, priority: p, relation, multiplier: m, constant: c, isActive: isActive)
        }
    }
    
    @available(iOS 8.0, *)
    func squareSizeWith(sideLengthOf l: CGFloat) {
        forEach { (view) in
            view.squareSizeWith(sideLengthOf: l)
        }
    }
    
    @available(iOS 8.0, *)
    func sizeAnchor(_ size: CGSize) {
        forEach { (view) in
            view.sizeAnchor(size)
        }
    }
    
    @available(iOS 8.0, *)
    func sizeAnchor(with view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, scale s: CGSize = .zero, _ isActive: Bool = true) {
        forEach { (view) in
            view.sizeAnchor(with: view, priority: p, relation, multiplier: m, scale: s, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func widthAnchor(with view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.widthAnchor(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func widthAnchor(_ relation: LayoutRelation, multiplier m: CGFloat = 1, constant c: CGFloat, priority p: LayoutPriority = .required, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.widthAnchor(relation, multiplier: m, constant: c, priority: p, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func heightAnchor(with view: UIView, priority p: LayoutPriority = .required,_ relation: LayoutRelation = .equal, multiplier m: CGFloat = 1, constant c: CGFloat = 0, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.heightAnchor(with: view, priority: p, relation, multiplier: m, constant: c, isActive)
        }
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func heightAnchor(_ relation: LayoutRelation, multiplier m: CGFloat = 1, constant c: CGFloat, priority p: LayoutPriority = .required, _ isActive: Bool = true) -> EZConstraints {
        
        return constrainViews { (selectedView) -> EZConstraint in
            return selectedView.heightAnchor(relation, multiplier: m, constant: c, priority: p, isActive)
        }
    }
}
