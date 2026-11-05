import Foundation
import Combine

@MainActor
final class SessionStore: ObservableObject {
    @Published private(set) var currentUser: UserModel?
    @Published private(set) var users: [UserModel] = []

    private var passwords: [String: String] = [:]

    func emailExists(_ email: String) -> Bool {
        users.contains { $0.email == Validation.normalizedEmail(email) }
    }

    @discardableResult
    func register(name: String, email: String, password: String) -> UserModel? {
        let email = Validation.normalizedEmail(email)
        let name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !name.isEmpty, Validation.isValidEmail(email),
              Validation.passwordError(password) == nil, !emailExists(email) else { return nil }
        let user = UserModel(id: UUID(), name: name, email: email)
        users.append(user)
        passwords[email] = password
        return user
    }

    func signIn(email: String, password: String) -> Bool {
        let email = Validation.normalizedEmail(email)
        guard let user = users.first(where: { $0.email == email }), passwords[email] == password else {
            return false
        }
        currentUser = user
        return true
    }

    func authenticateRegisteredUser(_ user: UserModel) {
        guard users.contains(user) else { return }
        currentUser = user
    }

    func logout() {
        currentUser = nil
    }
}
