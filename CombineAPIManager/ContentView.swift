//
//  ContentView.swift
//  CombineAPIManager
//
//  Created by user169775 on 5/1/20.
//  Copyright © 2020 Emelagudev. All rights reserved.
//

import SwiftUI 

struct ContentView: View {
    @ObservedObject var presenter = SamplePresenter()
    
    var body: some View {
        VStack {
            Text("\(presenter.employees.count)")
            ForEach(presenter.employees) { employee in
                Text(employee.employee_name)
            }
        }.onAppear(perform: presenter.mec)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
