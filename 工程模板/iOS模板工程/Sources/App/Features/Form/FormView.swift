import SwiftUI

struct FormView: View {
    @StateObject private var viewModel = FormViewModel()

    var body: some View {
        Form {
            Section("基础信息") {
                TextField("标题", text: $viewModel.title)
                TextField("备注", text: $viewModel.remark, axis: .vertical)
            }

            Section {
                Button("提交") {
                    viewModel.submit()
                }
                .disabled(viewModel.title.isEmpty || viewModel.isSubmitting)
            }
        }
        .navigationTitle("表单")
        .alert("提示", isPresented: $viewModel.showSuccess) {
            Button("确定", role: .cancel) {}
        } message: {
            Text("提交成功")
        }
    }
}
