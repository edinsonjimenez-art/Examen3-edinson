import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var session: SessionStore
    @StateObject private var viewModel = HomeViewModel()
    @FocusState private var searchFocused: Bool

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Jugadores")
                        .font(.title.bold())

                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(MLBTheme.secondaryText)

                        TextField("Buscar jugador o equipo", text: $viewModel.searchText)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .focused($searchFocused)
                            .submitLabel(.search)
                            .onSubmit { searchFocused = false }

                        if !viewModel.searchText.isEmpty {
                            Button {
                                viewModel.searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(MLBTheme.secondaryText)
                            }
                            .accessibilityLabel("Limpiar búsqueda")
                        }
                    }
                    .padding(14)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(MLBTheme.border, lineWidth: 1)
                    }
                }
                .padding(20)
                .background(MLBTheme.background)

                LazyVStack(spacing: 0) {
                    ForEach(viewModel.filteredItems) { item in
                        NavigationLink(value: item) {
                            PlayerRow(item: item)
                        }
                        .buttonStyle(.plain)

                        Divider()
                            .overlay(MLBTheme.border.opacity(0.3))
                    }

                    if viewModel.filteredItems.isEmpty {
                        Text("No se encontraron jugadores.")
                            .font(.subheadline)
                            .foregroundStyle(MLBTheme.secondaryText)
                            .frame(maxWidth: .infinity)
                            .padding(32)
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: 640)
            .frame(maxWidth: .infinity)
        }
        .background(MLBTheme.surface)
        .foregroundStyle(MLBTheme.text)
        .scrollDismissesKeyboard(.interactively)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.visible, for: .navigationBar)
        .toolbarBackground(MLBTheme.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                MLBLogo(height: 24)
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    session.logout()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundStyle(MLBTheme.text)
                }
                .accessibilityLabel("Cerrar sesión")
            }
        }
        .navigationDestination(for: ItemModel.self) { item in
            ItemDetailView(item: item)
        }
    }
}

private struct PlayerRow: View {
    let item: ItemModel

    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .overlay(Circle().stroke(MLBTheme.blue, lineWidth: 2))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 6) {
                Text(item.name)
                    .font(.headline)

                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(MLBTheme.secondaryText)
            }

            Spacer(minLength: 0)

            Image(systemName: "chevron.right")
                .font(.caption.weight(.semibold))
                .foregroundStyle(MLBTheme.secondaryText)
                .accessibilityHidden(true)
        }
        .padding(.vertical, 16)
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
    }
}
