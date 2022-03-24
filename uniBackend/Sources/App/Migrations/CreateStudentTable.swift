//
//  File.swift
//  
//
//  Created by Giuseppe Carannante on 23/03/22.
//

import Fluent

struct CreateStudentTable: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("student")
            .id()
            .field("name", .string, .required)
            .field("surname", .string, .required)
            .field("student_id", .string, .required)
            .unique(on: "student_id", name: "no_dupes_stud")
            .field("age", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("student").delete()
    }
}
