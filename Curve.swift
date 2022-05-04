import SpriteKit

class SKCurve : SKNode{
    var points : [SKCircle]
    var forma = SKShapeNode()
    var caminho = CGMutablePath()
    
    init(pontos: [SKCircle]){
        self.points = pontos
        super.init()
        
    
        self.forma.lineWidth = 3
        self.forma.strokeColor = .blue
        self.forma.name = "curva"
        self.addChild(self.forma)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawCubic(){
        if self.points.count > 1 && self.points.count % 3 == 1{
            self.caminho = CGMutablePath()
            for i in 0...(((self.points.count - 1)/3)-1){
               self.caminho.move(to: self.points[3*i].circulo.position)
               self.caminho.addCurve(to: self.points[3*(i+1)].circulo.position, control1: self.points[3*i + 1].circulo.position, control2: self.points[3*i+2].circulo.position)
            }
            
        }
        
        self.forma.path = self.caminho
    }
    
    
    func drawQuad(){
        if self.points.count > 1 && self.points.count % 2 == 1{
            self.caminho = CGMutablePath()
            for i in 0...(((self.points.count - 1)/2)-1){
               self.caminho.move(to: self.points[2*i].circulo.position)
               self.caminho.addCurve(to: self.points[2*(i+1)].circulo.position, control1: self.points[2*i + 1].circulo.position, control2: self.points[2*(i+1)].circulo.position)
            }
            
        }
        self.forma.path = self.caminho
    }
    
    func drawLin(){
        if self.points.count > 1{
            self.caminho = CGMutablePath()
            for i in 0...(self.points.count - 2){
                self.caminho.move(to: self.points[i].circulo.position)
                self.caminho.addLine(to: self.points[i + 1].circulo.position)
            }
        }
        self.forma.path = self.caminho
    }
    
    
}
