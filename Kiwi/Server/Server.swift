//
//  Server.swift
//  Kiwi
//
//  Created by dti digital on 21/09/23.
//

import Foundation


//MARK: REQUEST
class Server: ObservableObject{
@Published var chars: [Recipe] = []
    
    //MARK: URL DA REQUISICAO
    var stringURL = "http://localhost:3333"
    
    
//MARK: REQUISICOES
    
//MARK: GET
func get(){
    guard let url = URL(string: "\(stringURL)/Recipe")
    else {
        return
    }
    
    let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
        guard let data = data, error == nil else{
            return
        }
        
        
        do {
            let parsed = try JSONDecoder().decode([Recipe].self, from: data)
            
            DispatchQueue.main.async {
                self?.chars = parsed
            }
        }catch{
                print(error)
            }
        }
        task.resume()
    }
//MARK: POST
    
    func post(recipe: Recipe) {
        
        guard let url = URL(string: "\(stringURL)/Recipe") else {
            return
        }

        // Define os dados que você deseja enviar no formato JSON
        let requestData: [String: Any] = [
            "name": "\(recipe.name)",
            "category": "\(recipe.category)",
            "description": "(\(recipe.description)",
            "image": "\(recipe.image)",
            "steps": "\(recipe.steps)",
            "ingredients" : "\(recipe.ingredients)",
            "difficulty": "\(recipe.difficulty)",
            "time": "\(recipe.time)",
            "meal": "\(recipe.meal)"
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestData, options: [])
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Erro na requisição: \(error.localizedDescription)")
                    return
                }

                if let data = data {
                    if String(data: data, encoding: .utf8) != nil {
                        DispatchQueue.main.async {
                           
                        }
                    }
                }
            }.resume()

        } catch {
            print("Erro ao serializar os dados: \(error.localizedDescription)")
        }
    }
    
    //MARK: DELETE
func delete(recipe: Recipe) {
            guard let url = URL(string: "\(stringURL)/recipe/\(recipe._id)") else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                guard error == nil else {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    // Atualizar  a lista de lembretes após a exclusão bem-sucedida
                    self?.chars.removeAll { $0._id == recipe._id }
                    
                }
            }
            task.resume()
        }
    //MARK: UPDATE
    func put(recipe: Recipe) {
        
        guard let url = URL(string: "\(stringURL)/recipe/\(recipe._id)") else {
            return
        }

        let requestData: [String: Any] = [
            "name": recipe.name,
            
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestData, options: [])

            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Erro na requisição: \(error.localizedDescription)")
                    return
                }

                if let data = data {
                    if let responseMessage = String(data: data, encoding: .utf8) {
                        DispatchQueue.main.async {
                           
                            
                        }
                    }
                }
            }.resume()

        } catch {
            print("Erro ao serializar os dados: \(error.localizedDescription)")
        }
    }
}
