//
//  Usercolumn.swift
//  Antino Assesment Cardview
//
//  Created by Gopal Mani Dubey on 15/11/19.
//  Copyright © 2019 Gopal Mani. All rights reserved.
//

import UIKit
// MARK: - UserModelElement
struct UserModelElement: Codable {
    let url: String?
    let name, age, location: String?
    let details: [String]?
    let bodyType, userDesire: String?

    enum CodingKeys: String, CodingKey {
        case url, name, age, location
        case details = "Details"
        case bodyType, userDesire
    }
}
typealias UserModel = [UserModelElement]

