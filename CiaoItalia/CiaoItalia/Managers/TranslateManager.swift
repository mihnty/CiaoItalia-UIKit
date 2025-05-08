//
//  TranslateViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslateManager {
    public var input:String = ""
    public var inputPlaceholder:String = "Enter text in Portuguese (pt-BR)"
    public var result:String = ""
    
    // MARK: - Translation Properties
    private let apiKey = "AIzaSyCatRqN67PoxP6swxVyx3QIKY5pRYIE28Y"
    private let translationURL = URL(string: "https://translation.googleapis.com/language/translate/v2")!
    
    //definindo a linguagem inicial de tradução
    public var currentSourceLanguage = "pt-BR"
    public var currentTargetLanguage = "it"
    
    // MARK: - Helper Method to Build Multipart Body
    private func createMultipartBody(with text: String, boundary: String) -> Data {
        let parameters: [[String: Any]] = [
            ["key": "q", "value": text, "type": "text"],
            ["key": "target", "value": currentTargetLanguage, "type": "text"],
            ["key": "source", "value": currentSourceLanguage, "type": "text"],
            ["key": "key", "value": apiKey, "type": "text"]
        ]
        
        var body = Data()
        
        for param in parameters {
            guard let paramName = param["key"] as? String else { continue }
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"\(paramName)\"")
            
            if let paramType = param["type"] as? String, paramType == "text",
               let paramValue = param["value"] as? String {
                body.append("\r\n\r\n\(paramValue)\r\n")
            }
        }
        body.append("--\(boundary)--\r\n")
        return body
    }
    
    // MARK: - Translation Request Handler
    @objc private func translateButtonTapped() {
        guard input != "" else {
            result = "Please enter text to translate."
            return
        }
        

        let boundary = "Boundary-\(UUID().uuidString)"
        let postData = createMultipartBody(with: self.input, boundary: boundary)
        
        var request = URLRequest(url: translationURL, timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.result = "Error: \(error.localizedDescription)"
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    self?.result = "No data received."
                }
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Response JSON: \(json)")
                    if let dataField = json["data"] as? [String: Any],
                       let translations = dataField["translations"] as? [[String: Any]],
                       let translation = translations.first,
                       let translatedText = translation["translatedText"] as? String {
                        DispatchQueue.main.async {
                            self?.result = translatedText
                        }
                    } else if let errorInfo = json["error"] as? [String: Any],
                              let message = errorInfo["message"] as? String {
                        DispatchQueue.main.async {
                            self?.result = "Error: \(message)"
                        }
                    } else {
                        DispatchQueue.main.async {
                            self?.result = "Unexpected response format."
                        }
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self?.result = "Failed to parse response."
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Swap Languages Handler

    @objc public func swapButtonTapped() {
        let temp = currentSourceLanguage
        currentSourceLanguage = currentTargetLanguage
        currentTargetLanguage = temp
        
        if currentSourceLanguage == "pt-BR" {
            inputPlaceholder = "Enter text in Portuguese (pt-BR)"
        } else {
            inputPlaceholder = "Enter text in Italian (it)"
        }
    }
}

// MARK: - Data Extension for Appending Strings
extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

