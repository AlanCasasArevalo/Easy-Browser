//
//  ViewController.swift
//  Easy Browser
//
//  Created by Alan Casas on 22/9/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Abrir", style: .plain, target: self, action: #selector(openTapped))

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController{
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    @objc func openTapped()  {
        
        let activityController = UIAlertController(title: "¿Que pagina quieres abrir?", message: nil, preferredStyle: .actionSheet)
        let applePageAction = UIAlertAction(title: "apple.com", style: .default, handler: openPage)
        let hackingPageAction = UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage)
        let googlePageAction = UIAlertAction(title: "google.com", style: .default, handler: openPage)
        let cancelPageAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        activityController.addAction(applePageAction)
        activityController.addAction(hackingPageAction)
        activityController.addAction(googlePageAction)
        activityController.addAction(cancelPageAction)
        
        activityController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(activityController, animated: true)
        
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
