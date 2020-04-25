//
//    Constraint.swift
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

protocol Switchable {
    func activate()
    func deactivate()
}

extension EZConstraint: Switchable {
    
    @discardableResult
    static func create(item view1: Any, attribute attr1: Attribute, relatedBy relation: LayoutRelation, priority p: LayoutPriority, toItem view2: Any?, attribute attr2: Attribute, multiplier m: CGFloat, constant c: CGFloat, _ isActive: Bool, _ funcSignature: String = #function) -> EZConstraint {
        
        let cons = EZConstraint(item: view1, attribute: attr1, relatedBy: relation, toItem: view2, attribute: attr2, multiplier: m, constant: c)
        
        cons.priority = p
        cons.activate()
        
        cons.identifier = cons.buildId(functionName(from: funcSignature))
        
        return cons
    }
    
    func activate() {
        self.isActive = true
    }
    
    func deactivate() {
        self.isActive = false
    }
}

extension Array: Switchable where Element == EZConstraint {
    
    public func activate() {
        forEach { (constraint) in
            constraint.activate()
        }
    }
    
    public func deactivate() {
        forEach { (constraint) in
            constraint.deactivate()
        }
    }
}
