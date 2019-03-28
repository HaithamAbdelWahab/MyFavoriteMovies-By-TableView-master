import UIKit

class MyCircleButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius=self.frame.size.height/2
    }
}
