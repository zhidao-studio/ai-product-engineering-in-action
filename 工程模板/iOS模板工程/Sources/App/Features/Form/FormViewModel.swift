import Foundation

@MainActor
final class FormViewModel: ObservableObject {
    @Published var title = ""
    @Published var remark = ""
    @Published var isSubmitting = false
    @Published var showSuccess = false

    func submit() {
        guard !title.isEmpty else { return }
        isSubmitting = true
        isSubmitting = false
        showSuccess = true
    }
}
