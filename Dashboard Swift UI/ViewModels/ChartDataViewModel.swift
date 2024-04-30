//
//  ChartDataViewModel.swift
//  Dashboard Swift UI
//
//

import Foundation

class ChartDataViewModel: ObservableObject {
    var dashboardData: DashboardModel?
    var chartData: [ChartDataWrapper<Months, Double>] = []
    var rawData: [Months:Double] = [:]
    
    let service: DashboardService = DashboardService()
    
    func fetchData() async {
        do {
            for enumCase in Months.allCases {
                rawData[enumCase] = 0
            }
            let res = try await service.fetchData()
            print(res)
            self.dashboardData = res
            self.setUpData(res.data)
            var data = self.rawData.map { ChartDataWrapper(key: $0.key, value: $0.value) }
            print(data)
            data.sort { a, b in
                a.id < b.id
            }
            print("data after sorting \(data)")
            self.chartData = data
        }
        catch {
            print("Error")
        }
        
    }
    
    func setUpData(_ data: DataModel) {
        for (k,v) in data.overall_url_chart {
            let val = getMonthFromDate(k)
            let month = Months.allCases[val]
            
            let currVal = (rawData[month] ?? 0) + v
            rawData.updateValue(currVal, forKey: month)
        }
    }
    
    func getMonthFromDate(_ date:String)-> Int {
        print("Date is")
        print(date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        guard let d = dateFormatter.date(from: date) else { fatalError("cannot convert the given string date") }
        let calendar = Calendar(identifier: .indian)
        return calendar.component(Calendar.Component.month, from: d)
    }
}


enum Months: String, CaseIterable, Comparable {
    static func < (lhs: Months, rhs: Months) -> Bool { lhs.comparisonValue < rhs.comparisonValue }
    
    case Jan
    case Feb
    case Mar
    case Apr
    case May
    case Jun
    case Jul
    case Aug
    case Sep
    case Oct
    case Nov
    case Dec
    
    private var comparisonValue: Int { switch self {
    case .Jan: return 1
    case .Feb: return 2
    case .Mar: return 3
    case .Apr: return 4
    case .May: return 5
    case .Jun: return 6
    case .Jul: return 7
    case .Aug: return 8
    case .Sep: return 9
    case .Oct: return 10
    case .Nov: return 11
    case .Dec: return 12
    }}
    
    
}
