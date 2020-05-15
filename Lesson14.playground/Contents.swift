import UIKit

// Aiperi new classes
// creating classes
// working with Alina and Nurga

class Lashes {
    var volume: String
    var effects: String
    
    init(volume: String, effects: String) {
        self.volume = volume
        self.effects = effects
    }
    
    var clinetChoes: String {
        "\(volume) \(effects)"
    }
}

var aiperi = Lashes(volume: "Hybrid set", effects: "Dolls effect")

var newAiperi = aiperi


newAiperi.clinetChoes
aiperi.volume
aiperi.effects

newAiperi.volume = "Glamour set"
newAiperi.effects = "Cat eyes"

aiperi.volume = "Classic set"

aiperi.volume
aiperi.effects

newAiperi.volume
newAiperi.effects

newAiperi.effects = "Natural effects"
newAiperi.volume = "5D"

aiperi.effects
aiperi.volume



class Custumer {
   var name : String
    
    init(name: String) {
        self.name = name
    }
}

var client1 = Custumer(name: "Masha")

var client2 = client1

client1.name
client2.name
client2.name = "Dasha"
client1.name

struct Custumer2 {
    var name: String
}

var client1Struct = Custumer2(name: "Alla")

var client2Struct = client1Struct

client1Struct.name
client2Struct.name = "Jessica"
client2Struct.name
client1Struct.name



// value type vs reference type

struct Address {
    var street : String
    var apt : String
}


var location1 = Address(street: "5 Avenue", apt: "1F")

var location2 = location1 // copy of value

location1.street
location1.apt

location2.apt = "4E"

location1.street
location1.apt

location2.street
location2.apt






// Object identity

let number1 = 10
let number2 = 10

number1 == number2

let aslan = Person(firstName: "Aslan", lastName: "Arapbaev")
let timur = Person(firstName: "Timur", lastName: "Mone")

timur === aslan

let john = aslan

john === timur
john === aslan


// class mutability

struct Grade {
    let subject: String
    let points: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let studentAslan = Student(firstName: "Aslan", lastName: "Arapbaev")

let computerScience = Grade(subject: "Computer Science", points: 95)
let history = Grade(subject: "History", points: 80)

//studentAslan = Student(firstName: "Timur", lastName: "Mone")  // error

studentAslan.recordGrade(computerScience)
studentAslan.recordGrade(history)

//studentAslan = Student(firstName: "Timur", lastName: "Mone")

extension Student {
    var fullName: String {
        return self.firstName + " " + self.lastName
    }
}


// Inheritance

class Student2: Person {  // Person base class and Student2 a derived class
    var grades: [Grade] = []
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let aslanPerson = Person(firstName: "Aslan", lastName: "Arapbaev")
let aslanStudent = Student2(firstName: "Aslan", lastName: "Arapabev")

aslanPerson.fullName
aslanStudent.fullName

aslanStudent.recordGrade(history)
//aslanPerson.recordGrade(history) // not a student


class StudentProgrammer: Student2 {
    var minimumHoursOfPracticeSwift: Double = 120.0
    var numberOfProjectsOnGITHub: Int = 10
}

var studentProgrammerAslan = StudentProgrammer(firstName: "Aslan", lastName: "Arapbaev")
studentProgrammerAslan.numberOfProjectsOnGITHub

class StudentProgrammerAssistant: StudentProgrammer {
    //...
}

class Transport {
    var wheels: Int
    var seats: Int
    
    init(wheels: Int, seats: Int) {
        self.wheels = wheels
        self.seats = seats
    }
}

class Bicycle: Transport {
    var basket: Int = 1
}

class MotorCycle: Bicycle {
    //
}

class Bus: Transport {
    
    func stopAtBusstop() {
        print("stop")
    }
}

let bicycle1 = Bicycle(wheels: 2, seats: 1)
bicycle1.basket

let bus1 = Bus(wheels: 4, seats: 20)
bus1.stopAtBusstop()

class Car {
    var wheels: Int
    var seats: Int
    
    init() {
        self.seats = 4
        self.wheels = 4
    }

    init(seats: Int) {
        self.seats = seats
        self.wheels = 4
    }
}

let car1 = Car()
car1.seats


// Polymorphism

let john2 = Person(firstName: "John", lastName: "Black")
let johnStudent = Student2(firstName: "John", lastName: "White")
let johnProgrammer = StudentProgrammer(firstName: "John", lastName: "Programmer")

func printFullName(_ person: Person) {
    print(person.firstName + " " + person.lastName)
}

printFullName(john2)
printFullName(johnStudent)
printFullName(johnProgrammer)

printFullName(aslanPerson)
printFullName(aslanStudent)


func phonebookName(_ student: Student2) -> String {
    "\(student.lastName), \(student.firstName)"
}

phonebookName(johnStudent)
phonebookName(johnProgrammer)
//phonebookName(john2)

// Опрератор as

let num = 1
let numDouble = Double(num)

johnProgrammer.numberOfProjectsOnGITHub

(johnProgrammer as Person).firstName


aslanStudent.grades

(aslanStudent as Person).fullName
//(aslanStudent as Person).grades // not available

let aslanComputerStudent = StudentProgrammer(firstName: "Aslan", lastName: "Arapbaev")

aslanComputerStudent.minimumHoursOfPracticeSwift
(aslanComputerStudent as Student2).grades

//aslanComputerStudent as? Student

(aslanComputerStudent as? Person)?.firstName   //An optional downcast (to a subtype)

(aslanComputerStudent as! Student2).recordGrade(computerScience)   // A forced downcast.
//(aslanComputerStudent as! Car).recordGrade(computerScience)   //error unrelated type

if let aslanStudent = aslanComputerStudent as? Student2 {
    print("Success")
}

var personJohn = Person(firstName: "John", lastName: "Simpson")

personJohn = aslanStudent

//personJohn.grades // error

(personJohn as? Student2)?.grades



func afterClassActivity(for student: Student2) -> String {
    "Goes home!"
}

func afterClassActivity(for student: StudentProgrammer) -> String {
    "Goes to practice!"
}

afterClassActivity(for: johnStudent)
afterClassActivity(for: johnProgrammer as Student2)
