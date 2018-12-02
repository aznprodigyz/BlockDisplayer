import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var blocks = [Block]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blocks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        //cell.textLabel?.text = "Block " + blocks[indexPath.row].localized_name.capitalized
        cell.textLabel?.text = "Block " + String(blocks[indexPath.row].height)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BlockViewController {
            destination.block = blocks[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

    
    func downloadJSON(completed: @escaping () -> ()) {
        
        //let url = URL(string: "https://api.opendota.com/api/heroStats")
        let url = URL(string: "https://login.secureidentityledger.com/api/users/getblockchain")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.blocks = try JSONDecoder().decode([Block].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }
}














