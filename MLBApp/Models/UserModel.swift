import Foundation

struct UserModel: Identifiable, Equatable {
    let id: UUID
    let name: String
    let email: String
}
