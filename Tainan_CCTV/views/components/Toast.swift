import SwiftUI

struct ToastView: View {
    @Binding var isShow: Bool
    let info: String
    @State private var isShowAnimation: Bool = true
    let duration: Double
    
    init(isShow: Binding<Bool>, info: String = "", duration: Double = 0.5) {
        self._isShow = isShow
        self.info = info
        self.duration = duration
    }
    
    var body: some View {
        ZStack {
            Text(info)
                .font(.title3)
                .foregroundColor(Color(.label))
                .padding()
                .frame(minWidth: 80, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color(.systemGray4))
                )
                .opacity(isShowAnimation ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: isShowAnimation)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isShowAnimation = false
                        }
                    }
                }
                .onChange(of: isShowAnimation) { _ in
                    if !isShowAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.isShow = false
                        }
                    }
                }
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func toast(isShow: Binding<Bool>, info: String = "", duration: Double = 1.0) -> some View {
        ZStack {
            self
            if isShow.wrappedValue {
                ToastView(isShow: isShow, info: info, duration: duration)
            }
        }
    }
}
