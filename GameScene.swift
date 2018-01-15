//
//  GameScene.swift
//  JoarPong
//
//  Created by Joar Karlson on 2017-06-24.
//  Copyright © 2017 Joar Karlson. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    var topLbl = SKLabelNode()
    var bottomLbl = SKLabelNode()
    
    var scores = [Int]()
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "Ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height/2) - 50
        
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height/2) + 50
        
        topLbl = self.childNode(withName: "topLabel") as! SKLabelNode
        bottomLbl = self.childNode(withName: "bottomLabel") as! SKLabelNode
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        startGame()

    }
    
    func startGame(){
        scores = [0,0]
        topLbl.text = "\(scores[1])"
        bottomLbl.text = "\(scores[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
    }
    
    func addScore(playerWhoWon: SKSpriteNode) {
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == main {
            enemy.position.x = 0
            scores[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
        }
        else if playerWhoWon == enemy {
            scores[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
        }
        bottomLbl.text = "\(scores[0])"
        topLbl.text = "\(scores[1])"
        
        if scores[0] == 10 || scores[1] == 10 {
            
            print("Vunnet")
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .multi {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
                if location.y < 0 {
                    main.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
            else if(currentGameType == .superhard )  {
                main.run(SKAction.moveTo(x: location.x, duration: 0.5))
            }
            else {
                main.run(SKAction.moveTo(x: location.x, duration: 0.1))
            }
        }
            
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .multi {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
                if location.y < 0 {
                    main.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
            else if(currentGameType == .superhard )  {
                main.run(SKAction.moveTo(x: location.x, duration: 0.5))
            }
            else {
                main.run(SKAction.moveTo(x: location.x, duration: 0.1))
            }
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        switch currentGameType {
        case .easy:
            enemy.run(SKAction.moveTo(x: ball.position.x , duration: 1.1))
            break
        case .hard:
            enemy.run(SKAction.moveTo(x: ball.position.x , duration: 0.9))
            break
        case .superhard:
            enemy.run(SKAction.moveTo(x: ball.position.x , duration: 0.8))
            break
        case .multi:
            break
        }
        
        
        
        if ball.position.y <= main.position.y - 30 {
            addScore(playerWhoWon: enemy)
        }
        else if ball.position.y >= enemy.position.y + 30  {
            addScore(playerWhoWon: main)
        }
    }
}
