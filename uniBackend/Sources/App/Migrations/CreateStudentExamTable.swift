//
//  File.swift
//  
//
//  Created by Giuseppe Carannante on 23/03/22.
//

import Fluent

struct CreateStudentExamTable: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("studentExam")
            .id()
            .field("evaluation", .string, .required)
            .field("exam_id", .string, .required)
            .field("student_id", .string, .required)
            .foreignKey("exam_id", references: "exam", "exam_id")
            .foreignKey("student_id", references: "student", "student_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("studentExam").delete()
    }
}
