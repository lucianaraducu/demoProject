//
//  ActivityDetailsViewController.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation
import UIKit

class ActivityDetailsViewController: UIViewController {
    @IBOutlet var activityName: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var numberOfPArticipants: UILabel!
    
    var viewModel: ActivityDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension ActivityDetailsViewController {
    func setupUI() {
        activityName.text = viewModel?.activityName
        price.text = viewModel?.price
        numberOfPArticipants.text = viewModel?.numberOfParticipants
    }
}

extension ActivityDetailsViewController {
    static var storyboardIdentifier: String {
        "Main"
    }
    
    static var viewControllerIdentifier: String {
        "ActivityDetailsViewController"
    }
}
