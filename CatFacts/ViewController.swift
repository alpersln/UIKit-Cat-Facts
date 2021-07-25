//
//  ViewController.swift
//  CatFacts
//
//  Created by calatinalper on 22.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var catLabel: UILabel!
    var cat: Cat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchFacts()
        
                let gifURL : String = "https://cataas.com/cat/gif"
                let imageURL = UIImage.gifImageWithURL(gifURL)
                let imageView3 = UIImageView(image: imageURL)
                imageView3.frame = CGRect(x: 20.0, y: 90.0, width: self.view.frame.size.width - 40, height: 150.0)
                view.addSubview(imageView3)
        
    }


    func fetchFacts() {
        if let url = URL(string: "https://catfact.ninja/fact") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { [self] (data,response,error) in
                if error != nil {
                    print("error while getting zen api")
                } else if data != nil {
                    do {
                        cat = try JSONDecoder().decode(Cat.self, from: data!)
                        DispatchQueue.main.async {
                            catLabel.text = "\u{22}\(cat!.fact)\u{22}"
                            
                        }
                    } catch{
                        print("error decoding \(error)")
                    }
                }
            }.resume()
        }
    }
    
    
    
    
    @IBAction func buttonSu(_ sender: Any) {
        
        fetchFacts()
        
    }
    
    
    @IBAction func gifButton(_ sender: UIButton) {
        
        let gifURL : String = "https://cataas.com/cat/gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 20.0, y: 90.0, width: self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView3)
    }
}

