import SwiftUI

struct GymStatusView: View {
    let isOpen: Bool
    let closingIn: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Western Recreation Centre")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)

            HStack(spacing: 4) {
                Text("Open Now")
                    .foregroundColor(Color(.systemGray))

                AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/227645bee4f41be5f9e812feae13241f6f0dac269083d068dc0c10f5d0934484?placeholderIfAbsent=true&apiKey=c36d1de0113d4c6683611dde6cfb254b&format=webp")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.green.opacity(0.3)
                }
                .frame(width: 24, height: 24)
            }

            Text("Closing in \(closingIn)")
                .foregroundColor(Color(.systemGray))
        }
        .padding(.horizontal)
    }
}