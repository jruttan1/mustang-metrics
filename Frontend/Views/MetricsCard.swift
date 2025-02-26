import SwiftUI

struct MetricsCard: View {
    let title: String
    let value: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Text("\(value)")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.init(red: 0.21, green: 0.21, blue: 0.21)))
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}