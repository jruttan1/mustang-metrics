import SwiftUI

struct MainMetricsCard: View {
    let totalUsers: Int
    let percentageChange: Double
    struct ProgressBar: View {
        /// A value between 0 and 1 that represents the progress
        var progress: CGFloat

        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Grey background that spans the full width
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    // Purple bar whose width depends on the progress value
                    Rectangle()
                        .fill(Color(.systemPurple))
                        .frame(width: geometry.size.width * progress, height: 8)
                        .cornerRadius(4)
                }
            }
            // Set a fixed height for the GeometryReader
            .frame(height: 8)
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            ProgressBar(progress: 0.5)
    
            Text("Total Gym Users")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Text("\(totalUsers)")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)

            HStack {
                Text("Today")
                    .foregroundColor(Color(.systemGray))

                Text(String(format: "%.1f%%", percentageChange))
                    .foregroundColor(.red)
                    .font(.system(size: 16, weight: .medium))
            }

            AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/bfaf91c31b55d1ec33ce16f10fbc053f2e6dc63e9d0b51f7dce8732444f846b4?placeholderIfAbsent=true&apiKey=c36d1de0113d4c6683611dde6cfb254b&format=webp")) { image in
                image // Graph as image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
        }
        .padding()
        .background(Color(.init(red: 0.1, green: 0.1, blue: 0.1)))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray6), lineWidth: 1)
        )
}
}
