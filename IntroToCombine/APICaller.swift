//
//  APICaller.swift
//  IntroToCombine
//
//  Created by Matthew Dolan on 2021-11-14.
//

import Foundation
import Combine

class APICaller {
    static let shared = APICaller()
    
    func fetchCompanies() -> Future<[String], Error> {
        return Future { promixe in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                promixe(.success(["Facebook", "Apple", "Amazon", "Netflix", "Google"]))
            }
            
        }
    }
}
