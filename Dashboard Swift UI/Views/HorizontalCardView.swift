//
//  HorizontalCardView.swift
//  Dashboard Swift UI
//
//

import SwiftUI

struct HorizontalCardView: View {
    @Binding var model: DashboardModel?
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                CardView(iconName: "ClicksIcon", label1: "\(String(describing: model?.today_clicks ?? 0))", label2: "Today’s clicks")
                CardView(iconName: "Location", label1: model?.top_location ?? "Ahmedaba..", label2: "Top Location")
                CardView(iconName: "TopSourceImage", label1: model?.top_source ?? "Instagram", label2: "Top source")
            }
            .padding(.leading,20)
            .padding(.top,20)
            
        }
    }
}

//struct HorizontalCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        HorizontalCardView(model: .constant())
//    }
//}



struct CardView: View {
    
    var iconName: String
    var label1: String
    var label2: String
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            Image(iconName)
                .scaledToFit()
                .frame(width: 32,height: 32)
                .padding(.top,12)
            Text(label1)
                .font(
                Font.custom("Figtree", size: 16)
                .weight(.semibold)
                )
                .foregroundColor(.black)
                .padding(.top,16)
            Text(label2)
                .font(Font.custom("Figtree", size: 14))
                .foregroundColor(
                    Color(red: 153/255, green: 156/255, blue: 160/255)
                )
                .padding(.top,4)
        }
        .padding(.leading, 12)
        .padding(.trailing, 23)
        .padding(.vertical, 12)
        .background(.white)
        .cornerRadius(8)
    }
}
