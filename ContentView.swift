import SpriteKit
import SwiftUI

struct ContentView: View {
    var scene: SKScene {
        let scene = Abertura()
        

        scene.size = UIScreen.main.bounds.size
               scene.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
               scene.scaleMode = .aspectFill
        
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
               return scene
    }
    
    var body: some View {
            SpriteView(scene: scene)
                .frame(width: 1080, height: 1080)
                .ignoresSafeArea()
        }
    
}
