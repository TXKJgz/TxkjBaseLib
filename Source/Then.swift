//
//  Then.swift
//  MQVoiceChat
//
//  Created by hl on 2025/7/1.
//  Copyright © 2025 MQ. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 全局 apply 函数（适用于任意类型）
@discardableResult
func apply<T>(_ value: T, _ block: (T) -> Void) -> T {
    block(value)
    return value
}

// MARK: - 协议：Then，用于链式调用
protocol Then {}

extension Then where Self: AnyObject {
    // 引用类型（class）支持修改后返回自身
    @discardableResult
    func then(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }

    func `do`(_ block: (Self) -> Void) {
        block(self)
    }
}

extension Then where Self: Any {
    // 值类型（struct、enum）返回新的值
    func with(_ block: (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }

    func `do`(_ block: (Self) -> Void) {
        block(self)
    }
}

// 所有类型默认实现 Then 协议
extension NSObject: Then {}
extension CGPoint: Then {}
extension CGRect: Then {}
extension CGSize: Then {}
extension Array: Then {}
extension Dictionary: Then {}
extension URLRequest: Then {}
// 你也可以加更多 Swift 原生类型进来

