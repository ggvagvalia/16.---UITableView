//
//  Student.swift
//  16. დავალება - UITableView
//
//  Created by gvantsa gvagvalia on 4/13/24.
//

import Foundation

enum Gender: String {
    case male = "male"
    case female = "female"
}

struct StudentsInfo {
    var name: String
    var gender: Gender
    var age: Int
    var hobbby: String
    var avatar: String?
}

let namesArray: [StudentsInfo] = [
    StudentsInfo(name: "nodar ghachava", gender: .male, age: 27, hobbby: "Photography, Hiking"),
    StudentsInfo(name: "elene donadze", gender: .female, age: 23, hobbby: "Painting, Yoga"),
    StudentsInfo(name: "temuri chitashvili", gender: .male, age: 20, hobbby: "Cooking, Gardening"),
    StudentsInfo(name: "irina datoshvili", gender: .female, age: 20, hobbby: "Reading, Writing"),
    StudentsInfo(name: "tornike elqanashvili", gender: .male, age: 25, hobbby: "Playing Guitar, Swimming"),
    StudentsInfo(name: "ana ioramashvili", gender: .female, age: 22, hobbby: "Dancing, Traveling"),
    StudentsInfo(name: "nini bardavelidze", gender: .female, age: 24, hobbby: "Gaming, Playing Soccer"),
    StudentsInfo(name: "barbare tepnadze", gender: .female, age: 27, hobbby: "Birdwatching, Knitting"),
    StudentsInfo(name: "mariam sreseli", gender: .female, age: 27, hobbby: "Fishing, Woodworking"),
    StudentsInfo(name: "valeri mekhashishvili", gender: .male, age: 27, hobbby: "Cycling, Photography"),
    StudentsInfo(name: "zuka papuashvili", gender: .male, age: 31, hobbby: "Playing Piano, Birdwatching"),
    StudentsInfo(name: "nutsa beriashvili", gender: .female, age: 25, hobbby: "Hiking, Painting"),
    StudentsInfo(name: "luka kharatishvili", gender: .male, age: 26, hobbby: "Cooking, Traveling"),
    StudentsInfo(name: "data robakidze", gender: .male, age: 22, hobbby: "Gardening, Reading"),
    StudentsInfo(name: "nika kakhniashvili", gender: .male, age: 19, hobbby: "Writing, Playing Basketball"),
    StudentsInfo(name: "sandro gelashvili", gender: .male, age: 22, hobbby: "Yoga, Playing Violin"),
    StudentsInfo(name: "ana namgaladze", gender: .female, age: 21, hobbby: "Surfing, Photography"),
    StudentsInfo(name: "bakar kharabadze", gender: .male, age: 27, hobbby: "Swimming, Writing"),
    StudentsInfo(name: "archil menabde", gender: .male, age: 28, hobbby: "Playing Guitar, Cycling"),
    StudentsInfo(name: "tamuna kakhidze", gender: .female, age: 25, hobbby: "Knitting, Cooking"),
    StudentsInfo(name: "giorgi michitashvili", gender: .male, age: 21, hobbby: "Traveling, Birdwatching"),
    StudentsInfo(name: "salome topuria", gender: .female, age: 25, hobbby: "Dancing, Reading"),
    StudentsInfo(name: "luka gujejiani", gender: .male, age: 20, hobbby: "Hiking, Playing Piano"),
    StudentsInfo(name: "gega tatulishvili", gender: .male, age: 26, hobbby: "Painting, Yoga"),
    StudentsInfo(name: "raisa badalova", gender: .female, age: 25, hobbby: "Gaming, Cooking"),
    StudentsInfo(name: "aleksandre saroiani", gender: .male, age: 26, hobbby: "Birdwatching, Photography"),
    StudentsInfo(name: "begi kopaliani", gender: .male, age: 26, hobbby: "Fishing, Playing Guitar"),
    StudentsInfo(name: "akaki titberidze", gender: .male, age: 26, hobbby: "Cycling, Writing"),
    StudentsInfo(name: "sandro kupatadze", gender: .male, age: 23, hobbby: "Playing Soccer, Surfing"),
    StudentsInfo(name: "vano kvakhadze", gender: .male, age: 23, hobbby: "Swimming, Traveling"),
]
