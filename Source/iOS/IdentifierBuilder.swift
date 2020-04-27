//
//    IdentifierBuilder.swift
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

extension LayoutRelation {
    
    func name() -> String {
        switch self {
        case .lessThanOrEqual:
            return "<="
        case .equal:
            return "="
        case .greaterThanOrEqual:
            return ">="
        @unknown default:
            return ""
        }
    }
}

public extension EZConstraint {
    
    func buildId(_ funcName: String) -> String {
        
        let address1 = (firstItem as? UIView)?.debugAddress() ?? ""
        let address2 = (secondItem as? UIView)?.debugAddress() ?? ""
        
        var mult = ""
        if (secondItem as? UIView) != nil {
            if multiplier == 1.0 {
                mult = ""
            } else {
                mult = " * \(multiplier)"
            }
        } else {
            if multiplier == 1.0 {
                mult = ""
            } else {
                mult = "\(multiplier) *"
            }
        }
        
        var const = ""
        if constant == 0 {
            const = ""
        } else {
            if constant > 0 {
                if (secondItem as? UIView) == nil {
                    const = "\(constant)"
                } else {
                    const = "+ \(constant)"
                }
            } else {
                const = "- \(abs(constant))"
            }
        }
        
        return " id : \(address1).\(funcName) \(relation.name()) \(address2)\(mult) \(const)pt"
    }
}
