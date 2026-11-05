import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email = "" {
        didSet { errorMessage = nil }
    }

    @Published var password = "" {
        didSet { errorMessage = nil }
    }

    @Published private(set) var errorMessage: String?

    var canSubmit: Bool {
        !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !password.isEmpty
    }

    func login(using session: SessionStore) {
        guard canSubmit else {
            errorMessage = "Completa tu correo y contraseña."
            return
        }

        guard Validation.isValidEmail(email) else {
            errorMessage = "Ingresa un correo electrónico válido."
            return
        }

        if let error = Validation.passwordError(password) {
            errorMessage = error
            return
        }

        guard session.signIn(email: email, password: password) else {
            errorMessage = "El correo o la contraseña no coinciden."
            return
        }

        password = ""
    }
}
