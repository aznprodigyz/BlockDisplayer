
import UIKit


extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class BlockViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var previousHashLbl: UILabel!
    @IBOutlet weak var rootLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tokenListViewer: UITextView!
    
    var block:Block?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightLbl.text = String((block?.height)!)
        previousHashLbl.text = (block?.previousHash)!
        
        tokenListViewer.text = getTokenList()
        rootLbl.text = (block?.root)!
        dateLbl.text = (block?.date)!
//        let urlString = "https://api.opendota.com"+(block?.img)!
//        let url = URL(string: urlString)
//
//        imageView.downloadedFrom(url: url!)
    }
    
    func getTokenList() -> String {
        var tokenList = ""
        for token in (block?.tokenList)! {
            for out in token.outAddress{
                tokenList = tokenList + "Out Address: " + out.stringAddress
            }
            
            
            tokenList = tokenList + "\nAmount: " + String(token.amount)
            
            tokenList = tokenList + "\nTime Stamp: " + token.timeStamp + "\n"
            
        }
        return tokenList
    }
}

