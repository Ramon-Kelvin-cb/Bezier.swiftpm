import SpriteKit

class SKCircle : SKNode{
    var circulo: SKShapeNode
    var tocado = false
    
    init(pos: CGPoint){
        self.circulo = SKShapeNode(circleOfRadius: 17)
        
        super.init()
        self.isUserInteractionEnabled = true
        
        self.name = "point"
        self.circulo.zPosition = +4
        self.circulo.fillColor = .black
        self.circulo.strokeColor = .black
        
        self.circulo.position = pos
        
        self.addChild(self.circulo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tocado = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        if tocado{
            self.circulo.position = location!
        }
    } //move o elemento de lugar
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        if self.tocado{
            self.circulo.position = location!
            self.tocado = false
        }
    
    }
    
}
