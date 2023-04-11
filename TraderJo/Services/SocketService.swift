//
//  SocketService.swift
//  TraderJo
//
//  Created by Sergio Veliz on 03.04.2023.
//

import Foundation
import Starscream

protocol SocketServiceProtocol: AnyObject {
    var request: URLRequest { get }
    
    func subscribe<T>(type: T.Type, write: String, callback: @escaping (T) -> ()) where T: Decodable
}

final class SocketService: SocketServiceProtocol {
    let request: URLRequest
    var onConnect: (() -> Void)?
    var onMessage: ((String) -> ())?
    
    init(request: URLRequest) {
        self.request = request
    }
    
    private lazy var socket = WebSocket(request: request)
    
    func subscribe<T>(type: T.Type, write: String, callback: @escaping (T) -> ()) where T : Decodable {
        socket.connect()
        
        socket.onEvent = { [weak self] event in
            if case .connected = event {
                self?.socket.write(string: write)
            }
            if case let .text(message) = event {
                do {
                    if
                        let data = message.data(using: .utf8),
                        let jsonArray = try JSONSerialization.jsonObject(
                            with: data,
                            options: .allowFragments
                        ) as? NSArray,
                        let lastObject = jsonArray.lastObject
                    {
                        let data = try JSONSerialization.data(withJSONObject: lastObject)
                        let model = try JSONDecoder().decode(type, from: data)
                        callback(model)
                    }
                } catch {}
            }
        }
    }
}
