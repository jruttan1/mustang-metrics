import SwiftUI

struct HomepageView: View {
    @StateObject private var viewModel = GymMetricsViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                HStack {
                    Text("Mustang ")
                        .foregroundColor(Color(.init(red: 0.56, green: 0.33, blue: 0.88)))
                        + Text("Metrics")

                    Spacer()

                    AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/e0cef9d42062ca35f08f7158258a244095dec815093efa6387e1d5add62e9a37?placeholderIfAbsent=true&apiKey=c36d1de0113d4c6683611dde6cfb254b&format=webp")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(width: 137)
                }
                .font(.system(size: 30, weight: .bold))
                .padding()

                // Gym Status
                GymStatusView(
                    isOpen: viewModel.metrics.isOpen,
                    closingIn: viewModel.metrics.closingIn
                )

                // Main Metrics Card
                MainMetricsCard(
                    totalUsers: viewModel.metrics.totalUsers,
                    percentageChange: viewModel.metrics.percentageChange
                )
                .padding(.horizontal)

                // Metrics Grid
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 12) {
                    MetricsCard(title: "Weight Room 1", value: viewModel.metrics.weightRoom1)
                    MetricsCard(title: "Weight Room 2", value: viewModel.metrics.weightRoom2)
                    MetricsCard(title: "Cardio Mez", value: viewModel.metrics.cardioMez)
                    MetricsCard(title: "Spin and Studio", value: viewModel.metrics.spinStudio)
                }
                .padding(.horizontal)

                // Last Updated
                Text("Last updated \(viewModel.metrics.lastUpdated)")
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(Color(.systemGray))

                // Refresh Button
                Button(action: {
                    viewModel.refresh()
                }) {
                    Text("Refresh")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 120, height: 52)
                        .background(Color(.systemPurple))
                        .cornerRadius(24)
                }
                .shadow(radius: 4)

                Spacer()
            }
        }
        .background(Color(.init(red: 0.1, green: 0.1, blue: 0.1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}