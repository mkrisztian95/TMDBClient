//
//  MainVC.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation
import UIKit

class Main: UIViewController, BaseView {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.replace(with: SearchModule(), animated: true)
    }
}
