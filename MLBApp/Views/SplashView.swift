import SwiftUI

struct SplashView: View {
    @Binding var isFinished: Bool
    @State private var isVisible = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        VStack(spacing: 24) {
            MLBLogo(height: 76)

            Text("MLB")
                .font(MLBTheme.splashFont)
                .foregroundStyle(MLBTheme.text)
        }
        .scaleEffect(isVisible || reduceMotion ? 1 : 0.85)
        .opacity(isVisible ? 1 : 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MLBTheme.background.ignoresSafeArea())
        .task {
            withAnimation(.easeOut(duration: reduceMotion ? 0.15 : 0.7)) {
                isVisible = true
            }

            do {
                try await Task.sleep(for: .seconds(2))
                isFinished = true
            } catch {
                return
            }
        }
    }
}
