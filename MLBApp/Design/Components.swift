import SwiftUI

struct MLBLogo: View {
    var height: CGFloat = 30

    var body: some View {
        Image("MLBLogo")
            .resizable()
            .scaledToFit()
            .frame(width: height * 1.85, height: height)
            .accessibilityLabel("Major League Baseball")
    }
}

struct FormField: View {
    enum Kind {
        case name
        case email
        case password
        case newPassword
    }

    let title: String
    let placeholder: String
    @Binding var text: String
    var kind: Kind = .name

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline.weight(.semibold))

            input
                .font(.body)
                .textInputAutocapitalization(kind == .name ? .words : .never)
                .autocorrectionDisabled()
                .keyboardType(kind == .email ? .emailAddress : .default)
                .padding(14)
                .background(MLBTheme.background)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(MLBTheme.border, lineWidth: 1)
                }
                .accessibilityLabel(title)
        }
        .foregroundStyle(MLBTheme.text)
    }

    @ViewBuilder
    private var input: some View {
        if kind == .password || kind == .newPassword {
            SecureField(placeholder, text: $text)
                .textContentType(kind == .newPassword ? .newPassword : .password)
        } else {
            TextField(placeholder, text: $text)
                .textContentType(kind == .email ? .username : .name)
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .foregroundStyle(isEnabled ? MLBTheme.text : MLBTheme.secondaryText)
            .background(
                isEnabled ? MLBTheme.red : MLBTheme.border.opacity(0.3),
                in: RoundedRectangle(cornerRadius: 4)
            )
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

struct FeedbackMessage: View {
    let text: String
    var isSuccess = false

    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundStyle(isSuccess ? MLBTheme.success : MLBTheme.red)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
