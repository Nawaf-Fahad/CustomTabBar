//
//  TabItem.swift
//  CustomTabBar
//
//  Created by Nawaf Alotaibi on 20/02/2023.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case home
    case search
    case cart
    case profile
    
    var description: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .cart:
            return "Cart"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house.circle.fill"
            
        case .search:
            return "magnifyingglass.circle.fill"
            
        case .cart:
            return "cart.circle.fill"
            
        case .profile:
            return "person.circle.fill"
        }
    }
    
    


}



