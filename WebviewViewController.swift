//
//  WebviewViewController.swift
//  MNTFeed
//
//  Created by Cons Bulaqueña on 12/03/2018.
//  Copyright © 2018 consios. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {
    @IBOutlet var webview: UIWebView!
    
    var url: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webview.loadRequest(URLRequest(url: URL(string: url!)!))
      
    }


}
