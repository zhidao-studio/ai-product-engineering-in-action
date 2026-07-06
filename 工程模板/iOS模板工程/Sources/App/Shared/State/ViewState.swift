public enum ViewState: Equatable {
    case idle
    case loading
    case success
    case empty
    case failure(String)
}
