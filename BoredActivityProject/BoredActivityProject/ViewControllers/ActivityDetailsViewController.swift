//
//  ActivityDetailsViewController.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import AVFoundation
import UIKit

class ActivityDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet var activityName: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var numberOfPArticipants: UILabel!
    
    // MARK: - Private
    
    private var player: AVAudioPlayer?
    
    // MARK: - ViewModel
    
    var viewModel: ActivityDetailsViewModel?
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTexts()
        setupUI()
        playSound()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.stop()
    }
}

// MARK: - Private extension

private extension ActivityDetailsViewController {
    func setupTexts() {
        activityName.text = viewModel?.activityName
        price.text = viewModel?.price
        numberOfPArticipants.text = viewModel?.numberOfParticipants
    }
    
    func setupUI() {
        view.backgroundColor = viewModel?.activityColor
    }
    
    func playSound() {
        do {
            guard let url = viewModel?.soundResource else { return }
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            player?.play()
            
        } catch let error {
            presentErrorAlert(error: error)
        }
    }
}
