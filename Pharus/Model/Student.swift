//
//  Student.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import Foundation

struct Student: Codable {
    let id, firstName, lastName, birthdate: String
    let gender, school, year, city: String
    let schoolShift, avatar, email, password, username: String
    let projects: [Project]
}
