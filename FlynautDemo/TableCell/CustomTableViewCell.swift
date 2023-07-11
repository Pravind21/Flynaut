import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!

    var horizontal = false
    var numberOfCells = 2.0
    var data = [CellDataModal]()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupCarousalView(data : [CellDataModal], isHorizontal: Bool = false) {
        self.data = data
        horizontal = isHorizontal
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = horizontal ? .horizontal : .vertical
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = horizontal
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension CustomTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if horizontal {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AICollectionViewCell", for: indexPath) as! AICollectionViewCell
            cell.setupCarousalView(data : data[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCollectionViewCell", for: indexPath) as! UserProfileCollectionViewCell
            cell.setupCarousalView(data : data[indexPath.row])
            return cell
        }
    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = bounds.width / CGFloat(numberOfCells)
        let spacing: CGFloat = 25.0
        let availableWidth = collectionViewWidth - spacing
        return CGSize(width: availableWidth, height: availableWidth + (horizontal ? 20 : 80))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
