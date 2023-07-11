import UIKit

class UserProfileCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var favouriteContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favouriteImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCarousalView(data : CellDataModal) {
        imageView?.addCorner(radius: 50)
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.title
        favouriteContainer?.addCorner(radius: 15)
        contentView.addCorner(radius: 50)
        setupGradientLayer()
    }

    @IBAction func onFavouriteClick(_ sender: Any) {
        favouriteImageView.isHighlighted.toggle()
    }

    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.0).cgColor, UIColor.black.withAlphaComponent(0.06).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        contentView.layer.addSublayer(gradientLayer)
    }
}
