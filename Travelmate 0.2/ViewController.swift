//
//  ViewController.swift
//  Travelmate 0.2
//
//  Created by Muhammad on 20/09/2019.
//  Copyright © 2019 Saami. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupOutlet.layer.cornerRadius = 20
    }
    private var player: AVQueuePlayer!
    private var playerLayer: AVPlayerLayer!
    private var playerItem: AVPlayerItem!
    private var playerLooper: AVPlayerLooper!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let path = Bundle.main.path(forResource: "video1", ofType: "mp4")
        let pathURL = URL(fileURLWithPath: path!)
        let duration = Int64( ( (Float64(CMTimeGetSeconds(AVAsset(url: pathURL).duration)) *  10.0) - 1) / 10.0 )
        
        player = AVQueuePlayer()
        playerLayer = AVPlayerLayer(player: player)
        playerItem = AVPlayerItem(url: pathURL)
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem, timeRange: CMTimeRange(start: CMTime.zero, end: CMTimeMake(value: duration, timescale: 1)))
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.frame = view.layer.bounds
        view.layer.insertSublayer(playerLayer, at: 1)
        player.play()
        self.view.bringSubviewToFront(signupOutlet)
        self.view.bringSubviewToFront(loginOutlet)
        self.view.bringSubviewToFront(imageOutlet)
    }
    
    @IBOutlet weak var signupOutlet: UIButton!
    
    @IBOutlet weak var loginOutlet: UIButton!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    
    
    
}

