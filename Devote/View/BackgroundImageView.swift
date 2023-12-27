//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Abdul Maalik on 13/09/23.
//

import SwiftUI

struct BackgroundImageView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        Image("rocket")
            .antialiased(false)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}


//MARK: - PREVIEW
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
