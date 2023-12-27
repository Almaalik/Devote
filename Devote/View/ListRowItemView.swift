//
//  ListRowItemView.swift
//  Devote
//
//  Created by Abdul Maalik on 16/09/23.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        } //: TOGGLE
        .toggleStyle(CheckBoxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges{
                try? self.viewContext.save()
            }
        }) //:ONRECEIVE
    }
}

//struct ListRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowItemView()
//    }
//}
