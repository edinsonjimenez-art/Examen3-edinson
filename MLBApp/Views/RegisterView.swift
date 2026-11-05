import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var session: SessionStore
    @StateObject private var viewModel = RegisterViewModel()
    @State private var pendingUser: UserModel?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                MLBLogo(height: 34)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)

                Group {
                    FormField(
                        title: "Nombre completo",
                        placeholder: "Ingresa tu nombre",
                        text: $viewModel.name
                    )

                    FormField(
                        title: "Correo electrónico",
                        placeholder: "nombre@correo.com",
                        text: $viewModel.email,
                        kind: .email
                    )

                    FormField(
                        title: "Contraseña",
                        placeholder: "Crea una contraseña",
                        text: $viewModel.password,
                        kind: .newPassword
                    )

                    FormField(
                        title: "Confirmar contraseña",
                        placeholder: "Repite tu contraseña",
                        text: $viewModel.confirmPassword,
                        kind: .newPassword
                    )
                }
                .disabled(viewModel.isSuccessful)

                if let message = viewModel.errorMessage {
                    FeedbackMessage(text: message)
                }

                if let message = viewModel.successMessage {
                    FeedbackMessage(text: message, isSuccess: true)
                }

                Button(viewModel.isSuccessful ? "Cuenta creada" : "Crear cuenta") {
                    pendingUser = viewModel.register(using: session)
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(!viewModel.canSubmit)
            }
            .padding(24)
            .frame(maxWidth: 480)
            .frame(maxWidth: .infinity)
        }
        .background(MLBTheme.background)
        .foregroundStyle(MLBTheme.text)
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("Crear cuenta")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.visible, for: .navigationBar)
        .toolbarBackground(MLBTheme.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden(viewModel.isSuccessful)
        .task(id: pendingUser?.id) {
            guard let user = pendingUser else { return }

            do {
                try await Task.sleep(for: .seconds(2))
                session.authenticateRegisteredUser(user)
            } catch {
                return
            }
        }
    }
}
