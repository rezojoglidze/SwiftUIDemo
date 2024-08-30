//
//  PropertyWrappersView.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 30.08.24.
//

import SwiftUI

// MARK: Person
final class Person: ObservableObject {
    // MARK: Properties
    @Published var name: String
    
    // MARK: Initializers
    init(name: String) {
        self.name = name
    }
}

// MARK: Property Wrappers View
struct PropertyWrappersView: View {
    // MARK: Properties
    @StateObject private var person = Person(name: "Nick")
    @StateObject private var enviromentPerson = Person(name: "John")
    
    @State private var showingAddUser = false
    
    // MARK: Properties - Navigation
    @State private var navigationPath = NavigationPath()
    
    // MARK: Body
    var body: some View {
        Button("Show sheet", action: {
            showingAddUser.toggle()
        })
        .sheet(isPresented: $showingAddUser) {
            AddView(
                isPresented: $showingAddUser,
                person: person
            ).environmentObject(enviromentPerson)
        }
        .onFirstAppear(perform: {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: {
                self.person.name = "changed name"
                self.enviromentPerson.name = "changed name vers1"
            })
        })
    }
}

// MARK: Add View
struct AddView: View {
    // MARK: Properties
    @Binding var isPresented: Bool
    @ObservedObject var person: Person
    @EnvironmentObject var envPerson: Person
    
    // MARK: Body
    var body: some View {
        Text(person.name)
        Text(envPerson.name)
        
        Spacer().frame(height: 30)
        
        Button("Dismiss") {
            isPresented = false
        }
    }
}

// MARK: - Preview
#if DEBUG
struct PropertyWrappersView_Previews: PreviewProvider {
    static var previews: some View {
        configurePreview()
        
        return PropertyWrappersView()
    }
}
#endif
