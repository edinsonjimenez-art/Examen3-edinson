import SwiftUI

@main
struct MLBApp: App {
    @StateObject private var session = SessionStore()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(session)
                .tint(MLBTheme.text)
                .preferredColorScheme(.dark)
        }
    }
}

struct RootView: View {
    @EnvironmentObject private var session: SessionStore
    @State private var splashFinished = false

    var body: some View {
        Group {
            if !splashFinished {
                SplashView(isFinished: $splashFinished)
            } else if session.currentUser != nil {
                NavigationStack { HomeView() }
            } else {
                NavigationStack { LoginView() }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: splashFinished)
        .animation(.easeInOut(duration: 0.25), value: session.currentUser?.id)
    }
}
