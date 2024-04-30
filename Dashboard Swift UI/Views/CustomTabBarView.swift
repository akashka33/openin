//
//  CustomTabBarView.swift
//  Dashboard Swift UI
//
//

import SwiftUI

struct CustomTabbarView: View {
    var tabItems: [TabItem]
    @Binding var selected: TabItem
    
    
    init(tabItems: [TabItem],selected: Binding<TabItem>) {
        self.tabItems = tabItems
        self._selected = selected
    }
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .center, spacing: 25){
                
                ForEach(tabItems,id: \.self){ value in
                    
                    if value.icon == "QR" {
                        Button{
                            selected = value
                        } label: {
                            BarButtonWithoutLabel(value: value)
                        }
                    }
                    else {
                        Button {
                            selected = value
                        } label: {
                            BarButtonView(item: value,isSelected: selected == value )
                        }
                    }
                }
            }
            
        }
        .frame(height: 100, alignment: .center)
        
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
//        CustomTabbarView(tabItems: TabItem.allCases, selected: .constant(TabItem.link))
        ContentView()
    }
}

struct BarButtonView: View {
    
    var item: TabItem
    
    var isSelected: Bool
    
    var body: some View {
            VStack(alignment: .center,spacing: 10) {
                Image(item.icon)
                    .scaledToFit()
                Text(item.description)
                    .font(
                    Font.custom("Figtree", size: 11)
                    .weight(.semibold)
                    )
            
        }
        .tint(isSelected ? .black : .gray)
        .padding(.bottom)
    }
}

enum TabItem: String, CaseIterable {
    case link
    case course
    case plus
    case campaign
    case profile
    
    var description: String {
        switch self {
        case .link:
            return "Links"
        case .course:
            return "Courses"
        case .plus:
            return ""
        case .campaign:
            return "Campaigns"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .link:
            return "link"
            
        case .course:
            return "magazine"
            
        case .campaign:
            return "campaign"
            
        case .profile:
            return "user"
            
        case .plus:
            return "QR"
        }
    }
}


extension UIApplication {
    static var safeAreaInsets: UIEdgeInsets  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}

struct BarButtonWithoutLabel: View {
    
    var value: TabItem
    
    init(value: TabItem) {
        self.value = value
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill()
                .frame(width: 75,height: 75)
                .tint(.white)
                .offset(x:5, y:-30)
            
            VStack(alignment: .center,spacing: 0) {
                Image(value.icon)
                    .scaledToFit()
                    .frame(width: 60,height: 60)
            }
            .tint(.blue)
            .offset(x: 5,y: -15)
            .shadow(color: .blue, radius: 1)
            .padding(.bottom)
        }
    }
}
