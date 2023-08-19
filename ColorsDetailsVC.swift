//
//  ColorsDetailsVC.swift
//  RandomColors
//
//  Created by gryzna on 7/31/23.
//  Copyright © 2023 gryzna. All rights reserved.
//

import UIKit

class ColorsDetailsVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .blue
    }

}
