//
//  LinksTabView.swift
//  Dashboard Swift UI
//
//

import SwiftUI

struct LinksTabView: View {
    
    @State var isLoading: Bool = true
    
    @Binding var viewModel: ChartDataViewModel
    
    var body: some View {
        ScrollView {
                ZStack(alignment: .top) {
                    HeaderView()
                        .background(Color.blue)
                    VStack {
                        MainBodyView(viewModel: viewModel)
                    }
                    .background(Color(red: 245/255, green: 245/255, blue: 245/255) )
                    .cornerRadius(25)
                    .padding(.top, 110)
                }
        }
        .background(Color.blue)
        
    }
}

struct LinksTabView_Previews: PreviewProvider {
    static var previews: some View {
        LinksTabView( viewModel: .constant(ChartDataViewModel()))
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Dashboard")
                .font(
                Font.custom("Figtree", size: 24)
                .weight(.semibold)
                )
            Spacer()
            Image("settingsButtonImage")
        }
        .frame(height: 60)
        .padding(.all)
        .foregroundColor(.white)
    }
}

struct AnalyticsButtonView: View {
    
    var image: String
    var title: String
    
    var body: some View {
        HStack {
            Spacer()
            HStack(alignment: .center) {
                Image(image)
                    .frame(width: 32,height: 32)
                Text(title)
                    .font(
                    Font.custom("Figtree", size: 16)
                    .weight(.semibold)
                    )
                    .foregroundColor(.black)
            }
            .frame(width: 328,height: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(red: 0, green: 0, blue: 0,opacity: 0.08), lineWidth: 2)
            )
            Spacer()
        }
    
        
    }
}


struct FeedBackButton: View {
    
    var icon: String
    var title: String
    var bgColor: Color
    var marginColor: Color
    
    var body: some View{
        HStack {
            Spacer()
            HStack(spacing: 0) {
                Image(icon)
                    .frame(width: 24,height: 24)
                    .padding(.horizontal,12)
                Text(title)
                    .font(
                    Font.custom("Figtree", size: 16)
                    .weight(.semibold)
                    )
            }
            .padding(.leading, 12)
            .padding(.vertical, 20)
            .frame(width: 328,height: 64,alignment: .leading)
            .background(bgColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(marginColor, lineWidth: 1)
        )
            Spacer()
        }
        
    }
}

struct MainBodyView: View {
    @State var viewModel: ChartDataViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Good Morning")
                    .font(Font.custom("Figtree-Regular", size: 16))
                    .foregroundColor(
                        ProjectColors.modifiedGrayColor
                    )
                    .padding(.top,35)
                    .padding(.bottom,5)
                    .padding(.leading)
                HStack(alignment: .center) {
                    Text("Ajay Manva")
                        .font(
                        Font.custom("Figtree", size: 24)
                        .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    Image("clapsIcon")
                        .frame(width: 28,height: 28)
                }
                .padding(.bottom)
                .padding(.leading)
                GraphView(viewmodel: $viewModel)
                    .cornerRadius(10)
                    .padding(.horizontal,20)
                HorizontalCardView(model: $viewModel.dashboardData)
                    .padding(.bottom)
                AnalyticsButtonView(image: "Arrows", title: "View Analytics")
                    .frame(alignment: .center)
                SegmentView(selectedIndex: 0, viewmodel: viewModel)
                    .padding(.top, 46)
                AnalyticsButtonView(image: "link", title: "View all Links")
                    .padding(.vertical,20)
                FeedBackButton(icon: "whatsappIcon", title: "Talk with us", bgColor: Color(red: 0.29, green: 0.82, blue: 0.37).opacity(0.32), marginColor: Color(red: 0.29, green: 0.82, blue: 0.37).opacity(0.32))
                    .padding(.bottom,16)
                FeedBackButton(icon: "questionMarkIcon", title: "Frequently Asked Questions", bgColor: Color(red: 0.91, green: 0.94, blue: 1), marginColor: Color(red: 0.05, green: 0.44, blue: 1).opacity(0.32))
                    .padding(.bottom,100)
            }
        }
    }
}
