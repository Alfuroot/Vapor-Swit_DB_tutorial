import Fluent
import Vapor

final class ExamModel: Model, Content {
    static let schema = "exam"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String
    
    @Field(key: "course")
    var course: String
    
    @Field(key: "exam_id")
    var exam_id: String

    init() { }

    init(id: UUID? = nil, name: String, course: String, exam_id: String) {
        self.id = id
        self.name = name
        self.course = course
        self.exam_id = exam_id

    }
}
