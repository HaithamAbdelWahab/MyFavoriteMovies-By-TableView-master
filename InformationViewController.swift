import UIKit

class InformationViewController : UIViewController {
    
    var ReceiveInformation : MoviesObject!
    
    @IBOutlet weak var allHieght: NSLayoutConstraint!
    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextView.text = ReceiveInformation.About
        theImage.image = ReceiveInformation.Image
        Name.text = ReceiveInformation.Name
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
let fixedWidth = myTextView.frame.size.width
        myTextView.sizeThatFits(CGSize(width: fixedWidth, height:CGFloat.greatestFiniteMagnitude))
        let newSize = myTextView.sizeThatFits(CGSize(width: fixedWidth , height: CGFloat.greatestFiniteMagnitude))
        var newFrame = myTextView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        //AllHieght.constant = newFrame.size.height + 224
        view.layoutIfNeeded()
        allHieght.constant = newFrame.size.height + 224
    }
}
