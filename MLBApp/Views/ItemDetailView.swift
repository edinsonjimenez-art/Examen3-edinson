import SwiftUI

struct ItemDetailView: View {
    let item: ItemModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(spacing: 20) {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(MLBTheme.blue, lineWidth: 2))
                        .accessibilityLabel(item.name)

                    Text(item.name)
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)

                VStack(spacing: 18) {
                    attribute("Equipo", value: item.team)
                    attribute("Posición", value: item.position)
                    attribute("Número", value: "#\(item.number)")
                    attribute("País", value: item.country)
                }

                Text(item.biography)
                    .font(.body)
                    .lineSpacing(5)
                    .foregroundStyle(MLBTheme.secondaryText)
            }
            .padding(24)
            .frame(maxWidth: 640)
            .frame(maxWidth: .infinity)
        }
        .background(MLBTheme.background)
        .foregroundStyle(MLBTheme.text)
        .navigationTitle("Ficha del jugador")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(MLBTheme.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }

    private func attribute(_ title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundStyle(MLBTheme.secondaryText)

            Text(value)
                .font(.body.weight(.medium))

            Divider()
                .overlay(MLBTheme.border.opacity(0.3))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
