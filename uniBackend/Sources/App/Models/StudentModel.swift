import Fluent
import Vapor

final class StudentModel: Model, Content {
    static let schema = "student"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String
    
    @Field(key: "surname")
    var surname: String

    @Field(key: "age")
    var age: Int
    
    @Field(key: "student_id")
    var student_id: String
    
    init() { }

    init(id: UUID? = nil, name: String, surname: String, age: Int, student_id: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.age = age
        self.student_id = student_id

    }
}
