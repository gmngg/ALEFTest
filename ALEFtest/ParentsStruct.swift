//
//  ParentsStruct.swift
//  ALEFtest
//
//  Created by Malygin Georgii on 14.09.2020.
//  Copyright © 2020 Malygin Georgii. All rights reserved.
//

import Foundation

struct Family {
    var name: String?
    var info: [[FamilyInfo]]?
}

struct FamilyInfo {
    var fullName: String?
    var age: String?
}
