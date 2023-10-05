//
//  UserContentListView.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 28/08/23.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 180, height: 1)
                                .matchedGeometryEffect(id: "Item", in: animation)
                            
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 180, height: 1)
                        }
                        
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                switch selectedFilter {
                case .threads:
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                case .replies:
                    ForEach(0 ... 3, id: \.self) { reply in
                        ThreadsReplyProfileCell(reply: DeveloperPreview.shared.reply)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct UserContentListView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentListView(user: dev.user)
    }
}
