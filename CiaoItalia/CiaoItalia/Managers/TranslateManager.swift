//
//  TranslateManager.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslateManager {
    
    // MARK: - Translation Properties
    private let apiKey = "AIzaSyCatRqN67PoxP6swxVyx3QIKY5pRYIE28Y"
    private let translationURL = URL(string: "https://translation.googleapis.com/language/translate/v2")!
    public var currentSourceLanguage = "pt-BR"
    public var currentTargetLanguage = "it"

 
    public var input:String = ""
    public var result:String = ""

   

    @objc public func swapButtonTapped() {
        let temp = currentSourceLanguage
        currentSourceLanguage = currentTargetLanguage
        currentTargetLanguage = temp
        /*
        if (inputTextField.placeholder != nil) == (currentSourceLanguage == "pt-BR") {
            inputTextField.placeholder = "Enter text in Portuguese (pt-BR)"
            Task {
                await speechRecognizer.setLanguage(to: "pt-BR")
            }
        } else {
            inputTextField.placeholder = "Enter text in Italian (it)"
            Task {
                await speechRecognizer.setLanguage(to: "it-IT")
            }
        }
        */
    }

    @objc public func translateButtonTapped() {
        guard input != "" else {
            result = "Please enter text to translate."
            return
        }
    
        
        let boundary = "Boundary-\(UUID().uuidString)"
        let postData = createMultipartBody(with: self.input, boundary: boundary)
        var request = URLRequest(url: translationURL, timeoutInterval: .infinity)
        request.httpMethod = "POST"
        request.addValue("multipart/form-data; boundary=\(boundary)",
                         forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            if let error = error {
                DispatchQueue.main.async { self?.result = "Error: \(error)" }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async { self?.result = "No data." }
                return
            }
            do {
                let json = try JSONSerialization
                    .jsonObject(with: data) as? [String:Any]
                if let translations = (json?["data"] as? [String:Any])?["translations"]
                    as? [[String:Any]],
                   let translated = translations.first?["translatedText"] as? String {
                    DispatchQueue.main.async {
                        self?.result = translated
                    }
                } else if let err = json?["error"] as? [String:Any],
                          let msg = err["message"] as? String {
                    DispatchQueue.main.async {
                        self?.result = "Error: \(msg)"
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.result = "Unexpected response."
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self?.result = "Parse error."
                }
            }
        }.resume()
    }

    // MARK: - Multipart Body

    private func createMultipartBody(with text: String, boundary: String) -> Data {
        let params: [[String:Any]] = [
            ["key":"q","value":text],
            ["key":"target","value":currentTargetLanguage],
            ["key":"source","value":currentSourceLanguage],
            ["key":"key","value":apiKey]
        ]
        var body = Data()
        for p in params {
            guard let key = p["key"] as? String,
                  let val = p["value"] as? String else { continue }
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.append("\(val)\r\n")
        }
        body.append("--\(boundary)--\r\n")
        return body
    }

}

extension Data {
    mutating func append(_ string: String) {
        if let d = string.data(using: .utf8) {
            append(d)
        }
    }
}
