import SwiftUI 

struct ContentView: View {
    @ObservedObject var presenter = SamplePresenter()
    
    var body: some View {
        VStack {
            Text("\(presenter.employees.count)")
            ForEach(presenter.employees) { employee in
                Text(employee.employee_name)
            }
        }.onAppear(perform: presenter.fetch)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
