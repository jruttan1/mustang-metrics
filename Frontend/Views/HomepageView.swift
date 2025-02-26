import SwiftUI

struct HomepageView: View {
    @StateObject private var viewModel = GymMetricsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                // Header
                HStack {
                    (Text("Mustang ")
                        .foregroundColor(Color.customPurple)
                     + Text("Metrics")
                        .foregroundColor(Color(UIColor.systemGray)))
                        .font(.system(size: 30, weight: .bold))
                        .padding(.horizontal)
                        .padding(.vertical)
                        .offset(y: 15)       // Moves header text down
                        .offset(x: -10)      // Moves header text left
                    
                    Spacer()
                    
                    AsyncImage(
                        url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/e0cef9d42062ca35f08f7158258a244095dec815093efa6387e1d5add62e9a37?placeholderIfAbsent=true&apiKey=c36d1de0113d4c6683611dde6cfb254b&format=webp")
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(width: 137)
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Gym Status
                GymStatusView(
                    isOpen: viewModel.metrics.isOpen,
                    closingIn: viewModel.metrics.closingIn
                )
                .padding(.horizontal)
                .offset(x: -10)  // Shifts GymStatusView slightly to the left
                
                // Main Metrics Card
                MainMetricsCard(
                    totalUsers: viewModel.metrics.totalUsers,
                    percentageChange: viewModel.metrics.percentageChange
                )
                .padding(.horizontal)
                
                // Metrics Grid for cards
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 13
                ) {
                    MetricsCard(title: "Weight Room 1", value: viewModel.metrics.weightRoom1)
                    MetricsCard(title: "Weight Room 2", value: viewModel.metrics.weightRoom2)
                    MetricsCard(title: "Cardio Mez", value: viewModel.metrics.cardioMez)
                    MetricsCard(title: "Spin and Studio", value: viewModel.metrics.spinStudio)
                }
                .padding(.horizontal)
                
                // Last Updated
                Text("Last updated \(viewModel.metrics.lastUpdated)")
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(Color(UIColor.systemGray))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                // Refresh Button
                Button(action: {
                    viewModel.refresh()
                }) {
                    Text("Refresh")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 360, height: 52)
                        .background(Color.customPurple)
                        .cornerRadius(24)
                }
                .shadow(radius: 4)
                .offset(y: -8)
                .offset(x: 23)
                
                Spacer()
            }
            // Ensure the entire VStack is left aligned
            .frame(maxWidth: .infinity, alignment: .leading)
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
