//
//  ContentView.swift
//  Midterm Data Model
//
//  Created by Elizabeth Chiappini on 3/9/20.
//  Copyright © 2020 lizzychiappini. All rights reserved.
//

import SwiftUI

struct TrashItem {
    var trashImage: String
    var trashName: String
    var dates: [Date]
}

//how to deal with sessions

class TrashModel: ObservableObject {
    @Published var trashs = [TrashItem]()
    
    init() {
        let trash = TrashItem(trashImage: "plasticBag",
                              trashName: "Plastic Bag",
                              dates: [Date]())
        trashs.append(trash)
        
        let trash1 = TrashItem (trashImage: "plasticCup",
                                trashName: "Plastic Cup",
                                dates: [Date]())
        trashs.append(trash1)
    }
    
    func addDate(index: Int) {
        let now = Date()
        trashs[index].dates.append(now)
        
        // Return elements in array
        let count = trashs[index].dates.count
        
        print("count:", count)
        print("dates:", trashs[index].dates)
    }
    
    func getCount(index: Int) -> Int {
        return trashs[index].dates.count
    }
    
    //new function for day / week / month - could be three or one
    
}

struct ContentView: View {
    @ObservedObject var trashModel = TrashModel()
    
    var body: some View {
        HStack{
            Button(action: {
                self.trashModel.addDate(index: 0)
            }) {
                VStack {
                Image(self.trashModel.trashs[0].trashImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(self.trashModel.trashs[0].trashName)
                    Text("\(self.trashModel.getCount(index: 0))")
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                self.trashModel.addDate(index: 1)
            }) {
                VStack {
                //                Text("Add plastic cup")
                Image(self.trashModel.trashs[1].trashImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(self.trashModel.trashs[1].trashName)
                Text("\(self.trashModel.getCount(index: 1))")
                }
            }
            .buttonStyle(PlainButtonStyle())

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
