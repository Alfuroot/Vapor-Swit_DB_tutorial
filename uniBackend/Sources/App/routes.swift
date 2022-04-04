import Fluent
import Vapor

func routes(_ app: Application) throws {
    
//    exam functions
    
    app.post("exam"){req -> ExamModel in

        let data = try req.content.decode(ExamModel.self)
        let exam = ExamModel(id: data.id, name: data.name, course: data.course, exam_id: data.exam_id)
         try await exam.save(on: req.db)
        return exam
    }
    
    app.get("exam"){req -> [ExamModel] in
        return try await ExamModel.query(on: req.db).all()
    }
    
    app.get("exam",":id"){req -> [ExamModel] in
        guard let number = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        return try await ExamModel.query(on: req.db).filter(\.$exam_id == number).all()
    }
    
    app.put("exam", ":id", ":newId"){req -> String in
        
        guard let oldId = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let newId = req.parameters.get("newId", as: String.self) else {
            throw Abort(.badRequest)
        }

        ExamModel.query(on: req.db)
                    .set(\.$exam_id, to: newId)
                    .filter(\.$exam_id == oldId).update()
            
        return ""
    }

    app.delete("exam",":id"){req -> String in
        guard let number = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
   
        
        ExamModel.query(on: req.db)
            .filter(\.$exam_id == number)
            .delete()
        return ""
    }
    
 
    
    
    
   
    
//    student functions
    app.post("student"){req -> StudentModel in

        let student = try req.content.decode(StudentModel.self)
        try await student.save(on: req.db)
        return student
    }
    app.get("student"){req -> [StudentModel] in
        return try await StudentModel.query(on: req.db).all()
    }
   
    app.get("student",":id"){req -> [StudentModel] in
        guard let number = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        return try await StudentModel.query(on: req.db).filter(\.$student_id == number).all()
    }
   
    app.put("student", ":id", ":newId"){req -> String in
        
        guard let oldId = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let newId = req.parameters.get("newId", as: String.self) else {
            throw Abort(.badRequest)
        }

        StudentModel.query(on: req.db)
                    .set(\.$student_id, to: newId)
                    .filter(\.$student_id == oldId).update()
            
        return ""
    }

    app.delete("student",":id"){req -> String in
        guard let number = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
   
        
        StudentModel.query(on: req.db)
            .filter(\.$student_id == number)
            .delete()
        return ""
    }
    
    
    
//    studentExam functions
    app.post("studentExam"){req -> StudentExamsModel in

        let studentExam = try req.content.decode(StudentExamsModel.self)
        try await studentExam.save(on: req.db)
        return studentExam
    }
    
    app.get("studentExam"){req -> [StudentExamsModel] in
        return try await StudentExamsModel.query(on: req.db).all()
    }
   
    app.get("studentExam",":studentId", ":examId"){req -> [StudentExamsModel] in
        guard let number = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        return try await StudentExamsModel.query(on: req.db).filter(\.$student_id == number).all()
    }
    
    
    
    app.put("studentExam", ":studentId", ":examId", ":vote"){req -> String in
        
        guard let oldId = req.parameters.get("studentId", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let newId = req.parameters.get("examId", as: String.self) else {
            throw Abort(.badRequest)
        }
        guard let eval = req.parameters.get("vote", as: Int.self) else {
            throw Abort(.badRequest)
        }

        StudentExamsModel.query(on: req.db)
            .set(\.$evaluation, to: eval)
                    .filter(\.$student_id == oldId)
                    .filter(\.$exam_id == newId)
                    .update()
            
        return ""
    }

    app.delete("studentExam",":id"){req -> String in
        guard let number = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
   
        
        StudentModel.query(on: req.db)
            .filter(\.$student_id == number)
            .delete()
        return ""
    }
    
    
}
