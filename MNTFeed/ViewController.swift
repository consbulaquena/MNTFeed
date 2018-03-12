//
//  ViewController.swift
//  MNTFeed
//
//  Created by Cons Bulaqueña on 12/03/2018.
//  Copyright © 2018 consios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var articles: [Article]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //function will fetch all articles when view did load
        fetcharticles()

    }

    func fetcharticles(){
        //1 Create a URL request, url is a string from MNT api
        let urlRequest = URLRequest(url: URL(string:
            "https://newsapi.org/v2/top-headlines?sources=medical-news-today&apiKey=c8e6352d8a1840dbb7370b5f159f8f4b")!)
        
        //This will give data = JSon, response = ok? error =error
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            //empty articles array
            self.articles = [Article]()
            
            
            
            //JSON serialization - do try catch block, download JSON, data is URL request
            //String to anyobject - give JSON in format of dictionary
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
               //articles is an array of dictionary, get article
                if let articlesFromJson = ["articles"] as? [[String: AnyObject]] {// receive value from dictionary
                //Go each article and extract - for loop
                    for articleFromJson in articlesFromJson {
                       let article = Article()
                        
  
                        if let title = articleFromJson["title"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
                            

                        article.headline = title
                        article.desc = desc
                        article.url = url
                        article.imageUrl = urlToImage
                        }
                        
                        
                    }
            
                }
                
            } catch let error {
                print(error)
            }
            
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}

