import Fluent

struct CreateExamTable: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("exam")
            .id()
            .field("name", .string, .required)
            .field("course", .string, .required)
            .field("exam_id", .string, .required)
            .unique(on: "exam_id", name: "no_dupes_exams")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("exam").delete()
    }
}
