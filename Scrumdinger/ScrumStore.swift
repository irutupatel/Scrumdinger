//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Rutu Patel on 4/11/23.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrum: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrum.data")
    }
    
    static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.sync {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrum = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.sync {
                    completion(.success(dailyScrum))
                }
            } catch {
                DispatchQueue.main.sync {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
