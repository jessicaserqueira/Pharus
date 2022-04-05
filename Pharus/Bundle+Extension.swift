//
//  Bundle+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in Bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load \(file) from Bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data from \(file)")
        }
        
        return loaded
    }
}
