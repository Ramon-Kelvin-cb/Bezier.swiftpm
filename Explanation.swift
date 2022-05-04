import SpriteKit

class Explanation: SKScene {
    var background = SKSpriteNode(imageNamed: "background")
    var exp1 = SKSpriteNode(imageNamed: "explanation")
    var exp2 = SKSpriteNode(imageNamed: "explaining")
    var botaoProx = Button(imageNamed: "next")
    
    var pontos : [SKCircle] = []
    
    
    override func sceneDidLoad() {
        self.size = UIScreen.main.bounds.size
        self.scaleMode = .aspectFill
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        background.setScale(0.75 * UIScreen.main.bounds.width / background.size.width)
        self.addChild(background)
        
        
        self.exp1.setScale(0.5)
        self.exp1.position.y = 210
        self.addChild(self.exp1)
        
        
        
        
        let circ1 = SKCircle(pos: CGPoint(x: -250, y: -200))
        circ1.isUserInteractionEnabled = false
        let circ2 = SKCircle(pos: CGPoint(x: 250, y: -200))
        circ2.isUserInteractionEnabled = false
        let circ3 = SKCircle(pos: CGPoint(x: 0, y: 50))
        circ3.isUserInteractionEnabled = false
        self.addChild(circ1)
        self.addChild(circ2)
        self.addChild(circ3)
        
        
        var lerp01: [CGPoint] = []
        var lerp12: [CGPoint] = []
        
        for i in 0...9{
            lerp01.append(lerp(p1: circ1.circulo.position, p2: circ3.circulo.position, t: CGFloat(i)))
        }
        for i in 0...9{
            lerp12.append(lerp(p1: circ3.circulo.position, p2: circ2.circulo.position, t: CGFloat(i)))
        }
        
        
        for i in 1...9{
            let caminho = CGMutablePath()
            let forma = SKShapeNode()
            
            caminho.move(to: lerp01[i])
            caminho.addLine(to: lerp12[i])
            forma.path = caminho
            forma.strokeColor = .blue
            forma.lineWidth = 3
            self.addChild(forma)
        }
        
        
        self.botaoProx.setScale(0.2)
        self.botaoProx.position.y = -335
        self.addChild(botaoProx)
    }
    
    
    func lerp(p1: CGPoint, p2: CGPoint, t: CGFloat) -> CGPoint{
        let x = p1.x + (p2.x - p1.x) * t/9
        let y = p1.y + (p2.y - p1.y) * t/9
        return CGPoint(x: x, y: y)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if self.botaoProx.tocado{
            let nextScene = Types1()
            self.view?.presentScene(nextScene)
        }
    }
    
    
}
