import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var session: SessionStore
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                MLBLogo(height: 40)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 24)

                Text("Iniciar sesión")
                    .font(.title.bold())

                FormField(
                    title: "Correo electrónico",
                    placeholder: "nombre@correo.com",
                    text: $viewModel.email,
                    kind: .email
                )

                FormField(
                    title: "Contraseña",
                    placeholder: "Ingresa tu contraseña",
                    text: $viewModel.password,
                    kind: .password
                )

                if let message = viewModel.errorMessage {
                    FeedbackMessage(text: message)
                }

                Button("Iniciar sesión") {
                    viewModel.login(using: session)
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(!viewModel.canSubmit)

                NavigationLink {
                    RegisterView()
                } label: {
                    Text("¿No tienes cuenta? Regístrate")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(MLBTheme.text)
                        .underline()
                        .frame(maxWidth: .infinity, minHeight: 44)
                }
            }
            .padding(24)
            .frame(maxWidth: 480)
            .frame(maxWidth: .infinity)
        }
        .background(MLBTheme.background)
        .foregroundStyle(MLBTheme.text)
        .scrollDismissesKeyboard(.interactively)
        .toolbar(.hidden, for: .navigationBar)
        .onSubmit {
            if viewModel.canSubmit {
                viewModel.login(using: session)
            }
        }
    }
}
