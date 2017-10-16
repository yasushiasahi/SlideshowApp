//
//  bigImageViewController.swift
//  SlideshowApp
//
//  Created by Yasushi Asahi on 2017/10/17.
//  Copyright © 2017年 Yasushi Asahi. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	
	var image: UIImage = UIImage(named:"penguin1")!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
