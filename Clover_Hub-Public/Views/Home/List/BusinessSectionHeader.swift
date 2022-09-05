//  Created by Prisha Anand on 9/1/22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 45)
            
            Text(title)
                .font(Font.custom("OpenSans-Bold", size: 20))
        }
        
    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restaurants")
    }
}

