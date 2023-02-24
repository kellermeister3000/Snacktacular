//
//  ListView.swift
//  Snacktacular
//
//  Created by Philip Keller on 2/23/23.
//

import SwiftUI
import Firebase

struct ListView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            Text("List items will go here")
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Sign Out") {
                    do {
                        try Auth.auth().signOut()
                        print("🪵➡️ Log out successful!")
                        dismiss()
                    } catch {
                        print("😡 ERROR: Could not sign out!")
                    }
                }
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //TODO: Add item code here
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}
