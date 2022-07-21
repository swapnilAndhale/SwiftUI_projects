//
//  ImageView.swift
//  Image Render
//
//  Created by Swapnil on 21/07/22.
//

import SwiftUI

struct ImageView: View {
    
    @Binding var bgColor: Color
    
    var body: some View {
        
        ZStack {
            Rectangle().fill($bgColor.wrappedValue)
                .cornerRadius(20)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(bgColor: Color.orange)
    }
}
