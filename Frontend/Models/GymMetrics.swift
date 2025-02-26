import Foundation

struct GymMetrics {
    let totalUsers: Int
    let percentageChange: Double
    let lastUpdated: String
    let weightRoom1: Int
    let weightRoom2: Int
    let cardioMez: Int
    let spinStudio: Int
    let isOpen: Bool
    let closingIn: String
}

class GymMetricsViewModel: ObservableObject {
    @Published var metrics: GymMetrics

    init() {
        // Sample data - would be replaced with actual API data
        self.metrics = GymMetrics(
            totalUsers: 145,
            percentageChange: -5.0,
            lastUpdated: "10 minutes ago",
            weightRoom1: 45,
            weightRoom2: 40,
            cardioMez: 50,
            spinStudio: 30,
            isOpen: true,
            closingIn: "5 Hours"
        )
    }

    func refresh() {
        // Implement refresh logic here
    }
}