//
//  CustomTabbarView.swift
//  CustomTabBar
//
//  Created by Nawaf Alotaibi on 20/02/2023.
//

import SwiftUI

struct CustomTabbarView: View {
    var tabItems: [TabItem]
    @State var centerX : CGFloat = 0
    @Environment(\.verticalSizeClass) var size
    @Binding var selected: TabItem
    
    init(tabItems: [TabItem], selected: Binding<TabItem>) {
        UITabBar.appearance().isHidden = true
        self.tabItems = tabItems
        self._selected = selected
    }
    
    var body: some View {
        HStack(spacing: 0){
            
            ForEach(tabItems,id: \.self){value in
                
                GeometryReader{ proxy in
                    BarButton(selected: $selected, centerX: $centerX, rect: proxy.frame(in: .global), value: value)
                        .onAppear(perform: {
                            if value == tabItems.first{
                                centerX = proxy.frame(in: .global).midX
                            }
                        })
                        .onChange(of: size) { (_) in
                            if selected == value{
                                centerX = proxy.frame(in: .global).midX
                            }
                        }
                }
                .frame(width: 70, height: 50)
                if value != tabItems.last{Spacer(minLength: 0)}
            }
        }
        .padding(.horizontal,25)
        .padding(.top)
        .padding(.bottom,UIApplication.safeAreaInsets.bottom == 0 ? 15 : UIApplication.safeAreaInsets.bottom)
        .background(.ultraThinMaterial, in: CustomShape(centerX: centerX))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        .padding(.top,-15)
        .ignoresSafeArea(.all, edges: .horizontal)
    }
}
struct BarButton : View {
    @Binding var selected : TabItem
    @Binding var centerX : CGFloat
    
    var rect : CGRect
    var value: TabItem
    
    var body: some View{
        Button(action: {
            withAnimation(.spring()){
                selected = value
                centerX = rect.midX
            }
        }, label: {
            VStack{
                Image(systemName: value.icon)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 26, height: 26)
                    .foregroundColor(selected == value ? Color.Selected : .gray)
                
                Text(value.description)
                    .font(.caption)
                    .foregroundColor(.black)
                    .opacity(selected == value ? 1 : 0)
            }
            .padding(.top)
            .frame(width: 70, height: 50)
            .offset(y: selected == value ? -15 : 0)
        })
    }
}
struct CustomShape: Shape {
    var centerX : CGFloat
    var animatableData: CGFloat{
        get{return centerX}
        set{centerX = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 15))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 15))
            path.move(to: CGPoint(x: centerX - 35, y: 15))
            path.addQuadCurve(to: CGPoint(x: centerX + 35, y: 15), control: CGPoint(x: centerX, y: -30))
        }
    }
}

