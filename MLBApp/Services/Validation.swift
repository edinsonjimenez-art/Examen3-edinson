import Foundation

enum Validation {
    static func normalizedEmail(_ email: String) -> String {
        email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }

    static func isValidEmail(_ email: String) -> Bool {
        let email = normalizedEmail(email)
        let parts = email.split(separator: "@", omittingEmptySubsequences: false)
        guard email.count <= 254, parts.count == 2,
              !parts[0].isEmpty, parts[0].count <= 64,
              !parts[0].hasPrefix("."), !parts[0].hasSuffix("."), !parts[0].contains("..") else { return false }
        return email.range(
            of: #"^[A-Z0-9a-z.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?(?:\.[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?)+$"#,
            options: .regularExpression
        ) != nil
    }

    static let allowedSpecials = CharacterSet(charactersIn: "!@#$%^&*()_+-=[]{}|\\:\"'<>?/~`")

    static func hasUppercase(_ password: String) -> Bool {
        password.rangeOfCharacter(from: .uppercaseLetters) != nil
    }

    static func hasSpecial(_ password: String) -> Bool {
        password.rangeOfCharacter(from: allowedSpecials) != nil
    }

    static func passwordError(_ password: String) -> String? {
        if password.count < 6 { return "La contraseña debe tener al menos 6 caracteres." }
        if !hasUppercase(password) { return "Incluye al menos una letra mayúscula." }
        if !hasSpecial(password) {
            return "Incluye un carácter especial, como #, @ o !. Los puntos, comas, punto y coma y tildes no cuentan."
        }
        return nil
    }
}
