import SpriteKit

class Abertura: SKScene {
    var background = SKSpriteNode(imageNamed: "background")
    var imagemAbertura = SKSpriteNode(imageNamed: "do you know?")
    var botaoProx = Button(imageNamed: "next")
    
    override func sceneDidLoad() {
        background.setScale(0.75 * UIScreen.main.bounds.width / background.size.width)
        self.addChild(background)
        
        
        self.imagemAbertura.setScale(0.5)
        self.imagemAbertura.position.y = 45
        self.addChild(self.imagemAbertura)
        
        self.botaoProx.setScale(0.2)
        self.botaoProx.position.y = -150
        self.addChild(botaoProx)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if self.botaoProx.tocado{
            let nextScene = Explanation()
            self.view?.presentScene(nextScene)
        }
    }
    
    
}
    
    
