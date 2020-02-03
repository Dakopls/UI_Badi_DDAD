//
//  URLDataRetriver.swift
//  Badi
//
//  Created by user on 02/02/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//
import Foundation

struct URLDataRetriever: DataRetriever {
    func retrieve<T>(url: String,
                     method: String,
                     _ completionBlock: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        guard let url = URL(string: url) else { assertionFailure("WRONG URL FORMAT"); return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error { completionBlock(Result.failure(e)); return }
            if let r = response as? HTTPURLResponse {
                print(r.statusCode)
            }
            guard let d = data else { return }
            //print(d)
            print(String(data: d, encoding: String.Encoding.utf8)!)
            do {
                let json = try JSONDecoder().decode(T.self, from: d)
                completionBlock(Result.success(json))
            } catch let error {
                completionBlock(Result.failure(error))
            }
        }
        task.resume()
    }
}
