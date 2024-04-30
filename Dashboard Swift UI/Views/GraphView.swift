//
//  GraphView.swift
//  Dashboard Swift UI
//
//

import SwiftUI
import Charts

struct GraphView: View {
    
    @Binding var viewmodel: ChartDataViewModel
    
    @available(iOS 16.0, *)
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                Text("Overview")
                    .font(Font.custom("Figtree", size: 14))
                    .foregroundColor( Color(red: 153/255, green: 156/255, blue: 160/255))
                Spacer()
                HStack {
                    Text("22 Aug - 23 Sept")
                        .font(Font.custom("Figtree", size: 12))
                    Image("TimeIcon")
                        .scaledToFill()
                        .frame(width: 15,height: 15)
                }
                .padding(.all,10)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(red: 0, green: 0, blue: 0,opacity: 0.08), lineWidth: 2)
                )
            }
            .padding(.all)
            Chart(viewmodel.chartData) { pair in
                LineMark(
                    x: .value("Month", pair.id.rawValue),
                    y: .value("Hours of Sunshine", pair.value)
                )
            }
            .chartYAxis{
                AxisMarks(position: .leading)
            }
            .padding(.all)
            .onAppear() {
                print(viewmodel.chartData)
            }
            
        }
        .background(.white)
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(viewmodel: .constant(ChartDataViewModel()))
    }
}
