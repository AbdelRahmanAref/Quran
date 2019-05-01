//
//  String.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/30/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS()-> String{
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
