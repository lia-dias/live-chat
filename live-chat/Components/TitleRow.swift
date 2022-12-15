//
//  TitleRow.swift
//  live-chat
//
//  Created by Lia Dias on 15/12/22.
//

import SwiftUI

struct TitleRow: View {
    var imageURL = URL(string: "https://github.com/lia-dias/live-chat-demo/raw/main/Valerie_Cyberpunk2077.png");
    var name = "Valerie";
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.leading)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "terminal.fill")
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach"))
    }
}
