//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Nawaf Alotaibi on 20/02/2023.
//

import SwiftUI

struct CustomTabbar: View {
    var tabItems = TabItem.allCases
        
        @State var selected: TabItem = .home
        
        init() {
            UITabBar.appearance().isHidden = true
        }
        var body: some View{
            
            VStack(spacing: 0){
                TabView(selection: $selected){
                    
                    Color.FirstScreen
                        .overlay(content: {
                            Text("Screen 1")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        })
                        .tag(tabItems[0])
                        .ignoresSafeArea(.all)
                    
                    Color.SecondScreen
                        .overlay(content: {
                            Text("Screen 2")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        })
                        .tag(tabItems[1])
                        .ignoresSafeArea(.all)
                    
                    Color.ThirdScreen
                        .overlay(content: {
                            Text("Screen 3")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        })
                        .tag(tabItems[2])
                        .ignoresSafeArea(.all)
                    
                    Color.FourthScreen
                        .overlay(content: {
                            Text("Screen 4")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        })
                        .tag(tabItems[3])
                        .ignoresSafeArea(.all)
                }
                Spacer(minLength: 0)
                CustomTabbarView(tabItems: tabItems, selected: $selected)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
}

extension UIApplication {
    static var safeAreaInsets: UIEdgeInsets  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}

