import UIKit

/// Copy-on-write demo using plain Swift Strings
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
        
        // I half expected this to trigger the copy of second through fifth because they were all pointed at the memory this line is copying. However this is not the case. It looks like Swift knows the other four properties are still pointing at the original allocation so they don't need to be copied.
//        firstString.append("")
    }
}

/// Copy-on-write demo using custom Struct
///
/// Why is this not working as I expected?
///
/// Expected: Changing useCount should trigger copy-on-write for all properties of Word instance.
/// Actual: No noticable memory increase which leads me to believe the string property memory is not being copied yet.

//struct Word {
//    var useCount: Int = 0
//    var string: String
//    
//    init(string: String) {
//        self.string = string
//    }
//}
//
//class ViewController: UIViewController {
//    
//    // MARK: - Stored Properties
//    
//    let string: String = {
//        let image: UIImage = #imageLiteral(resourceName: "Billie")
//        let data = UIImageJPEGRepresentation(image, 1.0)!
//        return data.base64EncodedString()
//    }()
//    
//    lazy var firstWord: Word = {
//        return Word(string: self.string)
//    }()
//    var secondWord: Word?
//    var thirdWord: Word?
//    var fourthWord: Word?
//    var fifthWord: Word?
//    
//    // MARK: - Actions
//    
//    @IBAction func assignTapped(_ sender: Any) {
//        secondWord = firstWord
//        thirdWord = firstWord
//        fourthWord = firstWord
//        fifthWord = firstWord
//    }
//    
//    var nextStringToMutateIndex = 2
//    
//    @IBAction func mutateNextTapped(_ sender: Any) {
//        switch nextStringToMutateIndex {
//        case 1: firstWord.useCount = 1
//        case 2: secondWord?.useCount = 1
//        case 3: thirdWord?.useCount = 1
//        case 4: fourthWord?.useCount = 1
//        case 5: fifthWord?.useCount = 1
//        default: break
//        }
//        
//        if nextStringToMutateIndex < 5 {
//            // Move to the next string
//            nextStringToMutateIndex += 1
//        } else {
//            // Start at the first string.
//            nextStringToMutateIndex = 1
//        }
//    }
//}
