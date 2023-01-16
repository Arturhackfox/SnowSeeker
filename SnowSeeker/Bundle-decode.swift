//
//  Bundle-decode.swift
//  SnowSeeker
//
//  Created by Arthur Sh on 16.01.2023.
//

import Foundation

//MARK: To have real data to work with later in project create Bundle extension to decode 
extension Bundle {
     func decode<T: Decodable>(_ string: String) -> T {
        guard let url = self.url(forResource: string, withExtension: nil) else {
            fatalError("failed to load json file.")
        }
        
         guard let data = try? Data(contentsOf: url) else {
             fatalError("Failed to load data from url.")
         }
         
         let decoder = JSONDecoder()
         
         guard let decoded = try? decoder.decode(T.self, from: data) else {
             fatalError("Failed to decode from data.")
         }
         
         return decoded
    }
}
