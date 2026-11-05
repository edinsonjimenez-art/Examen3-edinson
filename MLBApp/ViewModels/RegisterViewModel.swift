import Foundation
import Combine

@MainActor
final class RegisterViewModel: ObservableObject {
    @Published var name = "" {
        didSet { errorMessage = nil }
    }

    @Published var email = "" {
        didSet { errorMessage = nil }
    }

    @Published var password = "" {
        didSet { errorMessage = nil }
    }

    @Published var confirmPassword = "" {
        didSet { errorMessage = nil }
    }

    @Published private(set) var errorMessage: String?
    @Published private(set) var successMessage: String?

    var isSuccessful: Bool { successMessage != nil }

    var canSubmit: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !password.isEmpty && !confirmPassword.isEmpty && !isSuccessful
    }

    func register(using session: SessionStore) -> UserModel? {
        guard canSubmit else {
            errorMessage = "Completa todos los campos."
            return nil
        }

        guard Validation.isValidEmail(email) else {
            errorMessage = "Ingresa un correo electrónico válido."
            return nil
        }

        if let error = Validation.passwordError(password) {
            errorMessage = error
            return nil
        }

        guard password == confirmPassword else {
            errorMessage = "Las contraseñas no coinciden."
            return nil
        }

        guard !session.emailExists(email) else {
            errorMessage = "Este correo ya está registrado."
            return nil
        }

        guard let user = session.register(name: name, email: email, password: password) else {
            errorMessage = "No se pudo crear la cuenta."
            return nil
        }

        errorMessage = nil
        successMessage = "Cuenta creada"
        return user
    }
}
