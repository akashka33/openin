//
//  SegmentView.swift
//  Dashboard Swift UI
//
//

import SwiftUI

struct SegmentView: View {
    @State var selectedIndex: Int = 0
    var viewmodel: ChartDataViewModel

    var body: some View {
        VStack {
            HStack {
                Button{
                    selectedIndex = 0
                    print(selectedIndex)
                } label: {
                    Text("Top Links")
                        .font(
                        Font.custom("Figtree", size: 16)
                        .weight(.semibold)
                        )
                        .foregroundColor(selectedIndex == 0 ? .white : ProjectColors.modifiedGrayColor)
                }
                .frame(width: 101,height: 36)
                .background(selectedIndex == 0 ? Color.blue : .clear)
                .cornerRadius(18)
                .padding(.leading)
                Button{
                    selectedIndex = 1
                    print(selectedIndex)
                } label: {
                    Text("Recent Links")
                        .font(
                        Font.custom("Figtree", size: 16)
                        .weight(.semibold)
                        )
                        .foregroundColor(selectedIndex == 1 ? .white : ProjectColors.modifiedGrayColor)
                }
                .frame(width: 101,height: 36)
                .background(selectedIndex == 1 ? Color.blue : .clear)
                .cornerRadius(18)
                .padding(.leading)
                Spacer()
                Image("searchIcon")
                    .frame(width: 36,height: 36)
                    .padding(.trailing, 16)
            }
            .padding(.vertical)
            if $selectedIndex.wrappedValue == 0 {
                LinksListView(isTopLinks: true, viewmodel: viewmodel)
                    .frame(alignment: .center)
            } else {
                LinksListView(isTopLinks: false, viewmodel: viewmodel)
                    .frame(alignment: .center)
            }
        }
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(selectedIndex: 1, viewmodel: ChartDataViewModel())
    }
}

//struct SegmentButton: View {
//
//    var title:String
//    var isSelected: Bool
//
//    var body: some View {
//        Button{
//
//        } label: {
//            Text(title)
//                .foregroundColor(isSelected ? .white : ProjectColors.modifiedGrayColor)
//        }
//        .frame(width: 101,height: 36)
//        .background(isSelected ? Color.blue : .clear)
//        .cornerRadius(18)
//        .padding(.leading)
//    }
//}
