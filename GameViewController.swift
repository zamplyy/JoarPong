//
//  GameViewController.swift
//  JoarPong
//
//  Created by Joar Karlson on 2017-06-24.
//  Copyright © 2017 Joar Karlson. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var currentGameType = gameType.easy
var color : UIColor = UIColor.black


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                
                scene.backgroundColor = color
                scene.scaleMode = .aspectFill
                
                scene.size = view.bounds.size
                
                
                // Present the scene
                view.presentScene(scene)
                
                
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = false
        }
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .portrait
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
