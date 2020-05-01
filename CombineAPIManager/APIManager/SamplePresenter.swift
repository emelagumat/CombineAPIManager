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
    @Published var employees: [Employee] = []
    let publisher = PassthroughSubject <[Employee], APIError>()
    let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    var cancellable: AnyCancellable?
    let manager = APIManager()
    func mec() {
        manager.get2(DummyDTO.self,
                          from: .boardList) { item in
                            print(item.data.count)
                            self.employees = item.data
        }
        
    }
}
/*
public func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root) -> AnyCancellable
interactor.model.$boards.assign(to: \.boards, on: self)
*/

class Dummy: ObservableObject {
    @Published var status = ""
    @Published var employees: [Employee] = []
    init(_ d: DummyDTO) {
        self.status = d.status
        self.employees = d.data
    }
}

struct DummyDTO: Codable {
    var status = ""
    var data: [Employee] = []
}
struct Employee: Codable, Identifiable {
    var id = ""
    var employee_name = ""
    var employee_salary = ""
    var employee_age = "61"
    var profile_image = ""
}
/*
 {
 "status": "success",
 "data": [
     {
     "id": "1",
     "employee_name": "Tiger Nixon",
     "employee_salary": "320800",
     "employee_age": "61",
     "profile_image": ""
     },
     ....
     ]
 }
     
 */
