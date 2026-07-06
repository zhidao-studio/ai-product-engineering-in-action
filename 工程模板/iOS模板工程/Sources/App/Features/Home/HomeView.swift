import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.spacingMedium) {
            Text("iOS 生产力入口")
                .font(.title.bold())

            Text("这是一个可被 AI 扩展的 SwiftUI 首页。")
                .foregroundStyle(.secondary)

            NavigationLink("打开表单") {
                FormView()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding(DesignTokens.spacingLarge)
        .navigationTitle("首页")
        .task {
            await viewModel.load()
        }
    }
}
