//
//  User.swift
//  RXSwiftTest
//
//  Created by Justin Huang on 2018/4/9.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
struct User{
    var name:BehaviorRelay<String?> = BehaviorRelay(value: "Justin")
    var phoneNumber:BehaviorRelay<String?> = BehaviorRelay(value: "0999999999")
    var emailAddress: BehaviorRelay<String?> = BehaviorRelay(value: "jusitn@gmail.com")
}
