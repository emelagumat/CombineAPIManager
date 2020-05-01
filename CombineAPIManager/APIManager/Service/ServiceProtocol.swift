//
//  ServiceProtocol.swift
//  CombineAPIManager
//
//  Created by user169775 on 5/1/20.
//  Copyright © 2020 Emelagudev. All rights reserved.
//

import Foundation

protocol ServerRequest {
    var baseURL: String { get }
    var apiVersion: String { get }
    var endPoint: String { get }
    var completeStringURL: String { get }
    var parameters: [String: Any] { get }
    var method: HTTPMethod { get }
}

