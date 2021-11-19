//
//  ActivityRequestViewController.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import UIKit

class ActivityRequestViewController: UIViewController {
    @IBOutlet var activityNameLabel: UILabel!
    @IBOutlet var showDetailsButton: UIButton!
    @IBOutlet var activityView: UIView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: ActivityRequestViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIUpdates()
        setVisibility(false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? ActivityDetailsViewController {
            nextViewController.viewModel = viewModel?.nextViewModel
        }
    }
    
    @IBAction func startNewActivity(_ sender: Any) {
        activityIndicator.startAnimating()
        viewModel?.requestActivity { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            switch result {
            case let .failure(error):
                self.presentErrorAlert(error: error)
            default:
                break
            }
        }
    }
}

private extension ActivityRequestViewController {
    func setupUIUpdates() {
        viewModel?.modelUpdated = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityNameLabel.text = self.viewModel?.activityName
                self.setVisibility(self.viewModel?.activityName != nil)
            }
        }
    }
    
    func setupUI() {
        activityNameLabel.text = viewModel?.activityName
        activityView.layer.cornerRadius = 10
        activityView.layer.borderWidth = 1
        activityView.layer.borderColor = UIColor.blue.cgColor
        activityView.layer.shadowColor = UIColor.black.cgColor
        activityView.layer.shadowRadius = 4.0
    }
    
    func setVisibility(_ show: Bool) {
        showDetailsButton.isHidden = !show
        activityView.isHidden = !show
    }
}
