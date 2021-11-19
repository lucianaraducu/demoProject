//
//  ActivityDetailsViewController.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import AVFoundation
import UIKit

var player: AVAudioPlayer?

class ActivityDetailsViewController: UIViewController {
    @IBOutlet var activityName: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var numberOfPArticipants: UILabel!
    
    var viewModel: ActivityDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTexts()
        setupUI()
        playSound()
    }
}

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
            print(error.localizedDescription)
        }
    }
}
