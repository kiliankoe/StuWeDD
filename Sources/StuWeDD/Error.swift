//
//  Error.swift
//  StuWeDD
//
//  Created by Kilian Költzsch on 15.07.17.
//  Copyright © 2017 StuWeDD. All rights reserved.
//

import Foundation

public enum Error: Swift.Error {
    case network
    case authentication
    case server(statusCode: Int)
    case decoding(description: String)
}