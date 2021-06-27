//
// ContentView.swift
// ICS4U-Unit1-11-Swift
//
// Created by Marcus A. Mosley on 2021-01-28
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct Student {
    
    var _firstName: String = ""
    var _lastName: String = ""
    var _middleInitial: String = ""
    var _dateOfBirth: String = ""
    var _grade: String = ""
    var _average: Int = 0
    var _identified: Bool = false
    
    // Constructor
    init (_ firstName: String, _ lastName: String, _ middleInitial: String, _ dateOfBirth: String, _ grade: String, _ average: Int, _ identified: Bool) {
        self._firstName = firstName;
        self._lastName = lastName;
        self._middleInitial = middleInitial;
        self._dateOfBirth = dateOfBirth;
        self._grade = grade;
        self._identified = identified;
    }
}

struct ContentView: View {
    @State private var name: String = "The previous student"
    @State private var average: Int = 0
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var dateOfBirth: String = ""
    @State private var middleInitial: String = ""
    @State private var grade: String = ""
    @State private var identifiedString: String = ""
    @State private var identified: Bool = false
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a first name for student #\(counter + 1):", text: $firstName)
                .padding()
            TextField("Enter a last name for student #\(counter + 1):", text: $lastName)
                .padding()
            TextField("Enter a middle initial for student #\(counter + 1):", text: $middleInitial)
                .padding()
            TextField("Enter a date of birth (DD/MM/YYYY) for student #\(counter + 1):", text: $dateOfBirth)
                .padding()
            TextField("Enter a grade (as plain text: JK-Twelve) for student #\(counter + 1):", text: $grade)
                .padding()
            TextField("Is student #\(counter + 1) identified (Y/N)?", text: $identifiedString)
                .padding()
            Button("Enter", action: {
                if identifiedString.uppercased() == "Y" {
                    identified = true
                }
                average = randomNumber()
                let currentStudent = Student(firstName, lastName, middleInitial, dateOfBirth, grade, average, identified)
                name = currentStudent._firstName + " "  + currentStudent._middleInitial + " " + currentStudent._lastName
                counter += 1
                firstName = ""; lastName = ""; middleInitial = ""; dateOfBirth = ""; grade = ""; identifiedString = ""
            }).padding()
            Text("\(name)'s average mark was a \(String(average))")
        }
    }
    func randomNumber() -> Int {
        
        let number: Int = Int.random(in: 0...4)
        return number
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
