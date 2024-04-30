//
//  DashboardService.swift
//  Dashboard Swift UI
//
//

import Foundation


class DashboardService {
    let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    func fetchData() async throws -> DashboardModel {
        do {
            
            let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            )
            
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.setValue(
                "Bearer \(token)",
                forHTTPHeaderField: "Authentication"
            )
            
            let sessionConfiguration = URLSessionConfiguration.default
            
            sessionConfiguration.httpAdditionalHeaders = [
                "Authorization":
                    "Bearer \(token)"
            ]
            
            let session = URLSession(configuration: sessionConfiguration)
            
            
            let (data, response) = try await session.data(for: request)
            
            guard response is HTTPURLResponse else {
                fatalError("dashboard Api call failed")
            }
            print(String(decoding: data, as: UTF8.self))
            let fetchedData = try JSONDecoder().decode(DashboardModel.self, from: data)
            print(fetchedData)
            return fetchedData
            
        }
        
        
    }
}

    

