import SpriteKit

class Types2 : SKScene{
    var background = SKSpriteNode(imageNamed: "background")
    var button1 = Button(imageNamed: "next")
    
    var image1 = SKSpriteNode(imageNamed: "three types")
    var image2 = SKSpriteNode(imageNamed: "02")
    var msg = SKSpriteNode(imageNamed: "instruction")
    
    var pontos:[SKCircle] = []
    var curvas:[SKCurve] = []
    
    override func sceneDidLoad() {
        self.size = UIScreen.main.bounds.size
        self.scaleMode = .aspectFill
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        background.setScale(0.75 * UIScreen.main.bounds.width / background.size.width)
        self.addChild(background)
        
        msg.setScale(0.25)
        msg.position = CGPoint(x: 0, y: -250)
        self.addChild(msg)
        
        image2.setScale(0.25)
        image2.position = CGPoint(x: 140, y: 280)
        self.addChild(image2)
        
        image1.setScale(0.25)
        image1.position = CGPoint(x: -140, y: 280)
        self.addChild(image1)
        
        
        let circ1 = SKCircle(pos: CGPoint(x: -200, y: -110))
        let circ2 = SKCircle(pos: CGPoint(x: 200, y: -110))
        let circ3 = SKCircle(pos: CGPoint(x: 0, y: 140))
        
        self.pontos.append(circ1)
        self.pontos.append(circ3)
        self.pontos.append(circ2)
        
        self.curvas.append(SKCurve(pontos: self.pontos))
        self.addChild(self.curvas[0])
        
        self.addChild(circ1)
        self.addChild(circ3)
        self.addChild(circ2)
        
        self.button1.setScale(0.2)
        self.button1.position.y = -335
        self.addChild(button1)
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if self.button1.tocado{
            let nextScene = Types3()
            self.view?.presentScene(nextScene)
        }
        
        self.curvas[0].drawQuad()
        
        
        
    }
}
