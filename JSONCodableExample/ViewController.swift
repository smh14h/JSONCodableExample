//
//  ViewController.swift
//  JSONCodableExample
//
//  Created by Sean Halstead on 3/8/19.
//  Copyright © 2019 Sean Halstead. All rights reserved.
//

import UIKit

struct Country:Decodable {
    let name: String
    let capital: String
    let region: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {( data, response, error) in
            
            do {
                var countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for country in countries {
                    print(country.name + ":" + country.capital)
                }
            } catch {
                print("Error Here")
            }
        }.resume()
    }


}

