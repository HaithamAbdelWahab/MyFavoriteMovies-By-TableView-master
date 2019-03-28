import UIKit
class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Next", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? InformationViewController{
            nextVC.ReceiveInformation = Database.Array[sender as! Int]
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Database.Array.count
    }
    
    
    var Array : [MoviesObject] = []
//     Array.append(MoviesObject(Name: "The Martian", About: TheMartianAbout, Image: "name not image"))

    var Array2 : [String] = [ " Adventure, Drama, Sci-Fi" ,
" Adventure, Drama, History"," Drama, Family, Music"," Action, Crime, Thriller "," Action, Sci-Fi, Thriller "," Drama for McConaughey "," Drama, History, Musical","Action, Biography, Drama "," Crime, Horror, Thriller"]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell

        cell.lblTitle.text = ""
        cell.imageView?.image = nil
        cell.imageView?.image = Database.Array[indexPath.row].Image
        cell.lblTitle.text = Database.Array[indexPath.row].Name
        cell.textFieldDetails?.text = Array2[indexPath.row]

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Database.PutMovies()
    }
    

   
    
}


