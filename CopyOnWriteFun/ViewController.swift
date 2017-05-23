import UIKit

class ViewController: UIViewController {
    
    // MARK: - Stored Properties
    
    var firstString: String = {
        let image: UIImage = #imageLiteral(resourceName: "Billie")
        let data = UIImageJPEGRepresentation(image, 1.0)!
        return data.base64EncodedString()
    }()
    
    var secondString: String?
    var thirdString: String?
    var fourthString: String?
    var fifthString: String?
    
    // MARK: - Actions
    
    @IBAction func assignTapped(_ sender: Any) {
        secondString = firstString
        thirdString = firstString
        fourthString = firstString
        fifthString = firstString
    }
    
    var nextStringToMutateIndex = 2
    
    @IBAction func mutateNextTapped(_ sender: Any) {
        switch nextStringToMutateIndex {
        case 1: firstString.append("")
        case 2: secondString?.append("")
        case 3: thirdString?.append("")
        case 4: fourthString?.append("")
        case 5: fifthString?.append("")
        default: break
        }
        
        if nextStringToMutateIndex < 5 {
            // Move to the next string
            nextStringToMutateIndex += 1
        } else {
            // Start at the first string.
            nextStringToMutateIndex = 1
        }
    }
}

