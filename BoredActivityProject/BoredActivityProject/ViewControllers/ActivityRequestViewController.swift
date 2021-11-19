//
//  ActivityRequestViewController.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import UIKit

class ActivityRequestViewController: UIViewController {
    @IBOutlet var activityNameLabel: UILabel!
    
    var viewModel: ActivityRequestViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIUpdates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? ActivityDetailsViewController {
            nextViewController.viewModel = viewModel?.nextViewModel
        }
    }
    
    @IBAction func startNewActivity(_ sender: Any) {
        viewModel?.requestActivity { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .failure(error):
                self.presentErrorAlert(error: error, completion: nil)
            default:
                break
            }
        }
    }
//
//    @IBAction func showActivityDetails(_ sender: Any) {
//        guard let nextViewModel = viewModel?.nextViewModel,
//        let nextViewController = storyboard.instantiateViewController(withIdentifier: ActivityDetailsViewController.viewControllerIdentifier) as? ActivityDetailsViewController else { return }
//        let storyboard = UIStoryboard(name: ActivityDetailsViewController.storyboardIdentifier, bundle: nil)
//        nextViewController.viewModel = nextViewModel
//        present(nextViewController, animated: true)
//    }
}

private extension ActivityRequestViewController {
    func setupUIUpdates() {
        viewModel?.modelUpdated = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityNameLabel.text = self.viewModel?.activityName
            }
        }
    }
    
    func setupUI() {
        activityNameLabel.text = viewModel?.activityName
    }
}
