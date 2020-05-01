//
//  SamplePresenter.swift
//  CombineAPIManager
//
//  Created by user169775 on 5/1/20.
//  Copyright © 2020 Emelagudev. All rights reserved.
//
import Foundation
import Combine

class SamplePresenter: ObservableObject {
    let manager = APIManager()
    
    @Published var employees: [Employee] = []
    
    func fetch() {
        manager.get(DummyDTO.self, from: .sample) { self.employees = $0.data }
    }
}
