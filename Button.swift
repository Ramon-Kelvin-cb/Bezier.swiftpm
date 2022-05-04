import SpriteKit

class Button : SKNode{
    var imagem: SKSpriteNode
    var tocado = false
    
    init(imageNamed name: String){
        self.imagem = SKSpriteNode(imageNamed: name)
        
        super.init()
        
        self.name = "botao"
        
        self.addChild(self.imagem)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tocado = true
    }
    
    
}

    
