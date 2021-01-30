//
//  WebViewController.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/30/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html"
        if let url = URL(string: urlString){
            self.webView.load(URLRequest(url: url))
        }
    }
    
    
}
