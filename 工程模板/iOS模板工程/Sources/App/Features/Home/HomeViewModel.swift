import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var state: ViewState = .idle

    func load() async {
        state = .success
    }
}
