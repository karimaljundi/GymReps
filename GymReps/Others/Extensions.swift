//
//  Extensions.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import Foundation

extension Encodable {
    func isDictionary() -> [String : Any] {
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data)
            return json as! [String : Any]
        }catch {
            return [:]
        }
    }
}
