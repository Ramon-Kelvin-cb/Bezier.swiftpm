import Foundation
import SpriteKit

class GameScene : SKScene{
    
    var lastUpdateTime : TimeInterval = 0
    var dt : TimeInterval = 0
    
    var circles: [SKCircle] = []
    var curves: [SKCurve] = []
    
    var casoPadrao = 0
    
    
    var info1 = SKSpriteNode(imageNamed: "add by")
    var info2 = SKSpriteNode(imageNamed: "move freely")
    var background = SKSpriteNode(imageNamed: "background")
    var deleteButton = Button(imageNamed: "Delete points")
    var linearButton = Button(imageNamed: "linear")
    var quadButton = Button(imageNamed: "quad")
    var cubicButton = Button(imageNamed: "cubic")
    
    override func didMove(to view: SKView) {
        self.size = UIScreen.main.bounds.size
        self.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        self.scaleMode = .aspectFill
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        background.setScale(0.75 * UIScreen.main.bounds.width / background.size.width)
        self.addChild(background)
        
        
        self.addChild(info1)
        info1.setScale(0.17)
        info1.position.y = (-UIScreen.main.bounds.height / 2) + 210
        info1.position.x = -190
        
        self.addChild(info2)
        info2.setScale(0.17)
        info2.position.y = (-UIScreen.main.bounds.height / 2) + 210
        info2.position.x = 190
        
        
        self.addChild(deleteButton)
        deleteButton.imagem.setScale(0.17)
        deleteButton.imagem.position.y = (-UIScreen.main.bounds.height / 2) + 210
        deleteButton.imagem.zPosition = +5
        
        self.addChild(linearButton)
        linearButton.imagem.setScale(0.17)
        linearButton.imagem.position.y = (UIScreen.main.bounds.height / 2) - 250
        linearButton.imagem.position.x = (UIScreen.main.bounds.width / 2) - 593
        linearButton.imagem.zPosition = +5
        
        self.addChild(quadButton)
        quadButton.imagem.setScale(0.17)
        quadButton.imagem.position.y = (UIScreen.main.bounds.height / 2) - 250
        quadButton.imagem.zPosition = +5
        
        self.addChild(cubicButton)
        cubicButton.imagem.setScale(0.17)
        cubicButton.imagem.position.y = (UIScreen.main.bounds.height / 2) - 250
        cubicButton.imagem.position.x = (UIScreen.main.bounds.width / 2) - 217
        cubicButton.imagem.zPosition = +5
        
        
        
        let curve = SKCurve(pontos: self.circles)
        curves.append(curve)
        
        self.addChild(curve)
    }


    
    let velocity = CGPoint(x: 100.0, y: 100.0)
    
    func createCirce(location: CGPoint){
        let circ = SKCircle(pos: location)
        self.addChild(circ)
        circles.append(circ)
    }
    
    func reseta(){
        self.childNode(withName: "curva")?.removeFromParent()
        self.enumerateChildNodes(withName: "point", using: { (node, true) in
            node.removeFromParent()})
        self.circles = []
        self.curves[0].caminho = CGMutablePath()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            createCirce(location: touch.location(in: self))
            
        }
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0{
            dt = currentTime - lastUpdateTime
        }else{
            dt = 0
        }
        lastUpdateTime = currentTime
        
        self.curves[0].points = self.circles
        
        
        if self.casoPadrao == 0{
            self.curves[0].drawLin()
        }else if self.casoPadrao == 1{
            self.curves[0].drawQuad()
        }else if self.casoPadrao == 2{
            self.curves[0].drawCubic()
        }
        
        
        if self.linearButton.tocado{
            self.reseta()
            self.casoPadrao = 0
        }else if self.quadButton.tocado{
            self.reseta()
            self.casoPadrao = 1
        }else if self.cubicButton.tocado{
            self.reseta()
            self.casoPadrao = 2
        }
        
        
        if self.deleteButton.tocado{
            self.reseta()
            
        }
        
        self.deleteButton.tocado = false
        self.linearButton.tocado = false
        self.quadButton.tocado = false
        self.cubicButton.tocado = false
    }
    
}
