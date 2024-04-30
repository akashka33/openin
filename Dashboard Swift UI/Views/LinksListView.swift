//
//  LinksListView.swift
//  Dashboard Swift UI
//
//

import SwiftUI

struct LinksListView: View {
    var isTopLinks: Bool
    var viewmodel: ChartDataViewModel
    var model: [LinkModel]?
    
    init(isTopLinks: Bool, viewmodel: ChartDataViewModel) {
        self.isTopLinks = isTopLinks
        self.viewmodel = viewmodel
        if isTopLinks {
            self.model = viewmodel.dashboardData?.data.top_links
        } else {
            self.model = viewmodel.dashboardData?.data.recent_links
        }
    }
    
    var body: some View {
        ForEach(model ?? [], id: \.self) { index in
            HStack(alignment: .center) {
                Spacer()
                LinksCellView(data: index)
                    .padding(.top,20)
                Spacer()
            }
        }
    }
}

//struct LinksListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinksListView(data: )
//    }
//}


struct LinksCellView: View {
    var data: LinkModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center,spacing: 0) {
                AsyncImage(url: URL(string: data.original_image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 44, height: 44)
                .scaledToFit()
                .frame(width: 48,height: 48)
                .padding(.all,12)
                VStack(alignment: .leading,spacing: 5) {
                    Text(data.title)
                        .font(Font.custom("Figtree", size: 14))
                        .foregroundColor(.black)
                    Text(data.created_at)
                        .font(Font.custom("Figtree", size: 12))
                        .foregroundColor(ProjectColors.modifiedGrayColor)
                }
                .frame(width: 120,height: 44)
                Spacer(minLength: 40)
                VStack(spacing: 5) {
                    Text("\(data.total_clicks)")
                        .font(
                        Font.custom("Figtree", size: 14)
                        .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    Text("Clicks")
                        .font(Font.custom("Figtree", size: 12))
                        .foregroundColor(ProjectColors.modifiedGrayColor)
                }
                .padding(.trailing,12)
            }
            
            HStack() {
                Text(data.web_link)
                    .font(Font.custom("Figtree", size: 14))
                    .padding(12)
                    .foregroundColor(Color(red: 14/255, green: 111/255, blue: 1))
                Spacer()
                Image("FilesIcon")
                    .frame(width: 11.51,height: 14.25)
                    .padding(12)
            }
            .frame(height: 40)
            .background(Color(red: 0.91, green: 0.94, blue: 1))
            .padding(.all,0.5)
            .overlay(
                    Rectangle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 1,dash: [3]))
                    .foregroundColor(ProjectColors.lightBlueColor)
                )
        }
        .background(Color.white)
        .cornerRadius(8)
        .padding(.horizontal,16)
    }
}

struct ProjectColors {
    static let modifiedGrayColor = Color(red: 153/255, green: 156/255, blue: 160/255)
    static let lightBlueColor = Color(red: 166/255, green: 199/255, blue: 1)
}
