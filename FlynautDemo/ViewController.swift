import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let carouselData : [CellDataModal] = [CellDataModal(image:"first", title: ""),CellDataModal(image:"second", title: ""),CellDataModal(image:"third", title: "")]
    let headerData = [CellDataModal(image:"", title: "")]
    let topTenData = [CellDataModal(image:"tone", title: "Zombie Pacer Long Name"),
                      CellDataModal(image:"ttwo", title: "Zombie Pacer Long Name"),
                      CellDataModal(image:"t3", title: "Zombie Pacer Long Name"),
                      CellDataModal(image:"t4", title: "Zombie Pacer Long Name"),
                      CellDataModal(image:"t5", title: "Zombie Pacer Long Name"),
                      CellDataModal(image:"t6", title: "Zombie Pacer Long Name"),
                      CellDataModal(image:"t7", title: "Zombie Pacer Long Name"),
                      CellDataModal(image:"t8", title: "Zombie Pacer Long Name")];

    let gridData = [CellDataModal(image:"adventure", title: "Adventure"),
                    CellDataModal(image:"ai", title: "Fantasy"),
                    CellDataModal(image:"sci-fi", title: "Sci-Fi"),
                    CellDataModal(image:"Mystery", title: "Mystery"),
                    CellDataModal(image:"adventure", title: "Adventure"),
                    CellDataModal(image:"ai", title: "Fantasy"),
                    CellDataModal(image:"sci-fi", title: "Sci-Fi"),
                    CellDataModal(image:"Mystery", title: "Mystery")]
    
    let bottomTenData = [CellDataModal(image:"b1", title: "Zombie Pacer Long Name"),
                         CellDataModal(image:"b2", title: "Zombie Pacer Long Name"),
                         CellDataModal(image:"b3", title: "Zombie Pacer Long Name"),
                         CellDataModal(image:"b4", title: "Zombie Pacer Long Name"),
                         CellDataModal(image:"b5", title: "Zombie Pacer Long Name"),
                         CellDataModal(image:"b6", title: "Zombie Pacer Long Name"),
                         CellDataModal(image:"b7", title: "Zombie Pacer Long Name"),
                         CellDataModal(image:"b8", title: "Zombie Pacer Long Name")]
    
    var data = [[CellDataModal]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [carouselData, headerData, topTenData, gridData, bottomTenData]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 360
        case 1:
            return 80
        case 2, 4:
            let width = tableView.bounds.width / 2
            var count = data[indexPath.row].count
            count = count%2 == 0 ? count : count+1
            count = count/2
            let val = (width + 70) * CGFloat(count)
            return val
        case 3:
            return view.frame.width / 3 + 40
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselCell", for: indexPath) as! CarouselCell
            cell.setupCarousalView(data: data[indexPath.row])
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            cell.setupCarousalView(data:data[indexPath.row])
            cell.numberOfCells = 2.0
            if indexPath.row == 3 {
                cell.numberOfCells = 3.0
                cell.setupCarousalView(data:data[indexPath.row],isHorizontal: true)
            }
            return cell
        }
    }
}


struct CellDataModal {
    
    var image : String
    var title : String
}
