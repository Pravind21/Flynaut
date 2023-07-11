import UIKit

class AICollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCarousalView(data : CellDataModal) {
        imageView?.addCorner(radius: 20)
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.title
        contentView.addCorner(radius: 20)
        setupGradientLayer()
    }

    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.0).cgColor, UIColor.black.withAlphaComponent(0.03).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        contentView.layer.addSublayer(gradientLayer)
    }
}
