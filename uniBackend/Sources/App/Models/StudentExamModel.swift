import Fluent
import Vapor

final class StudentExamsModel: Model, Content {
    static let schema = "studentExam"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "exam_id")
    var exam_id: String

    @Field(key: "evaluation")
    var evaluation: Int
    
    @Field(key: "student_id")
    var student_id: String
    
    init() { }

    init(id: UUID? = nil, exam_id: String, evaluation: Int, student_id: String) {
        self.id = id
        self.exam_id = exam_id
        self.evaluation = evaluation
        self.student_id = student_id

    }
}
