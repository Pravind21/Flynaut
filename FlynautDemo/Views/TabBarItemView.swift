import UIKit

class TabBarItemView: UIView {
    // Custom properties
    var modal: ItemModel?
    var selected = false
    var iconImageView: UIImageView?
    var backgroundImageView: UIImageView?
    var titleLabel: UILabel?
    var button: UIButton?

    // Custom initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setSelected(status: Bool) {
        let fontName = status ? "Poppins-SemiBold" : "Poppins-Regular"
        let fontSize: CGFloat = 11
        titleLabel?.font = UIFont(name: fontName, size: fontSize)
        titleLabel?.textColor = status ? .white : .gray
        selected = status
        backgroundImageView?.isHidden = !status
    }

    // Setup the custom views and layout
    func setupViews() {
        backgroundColor = .clear
        clipsToBounds = true

        iconImageView = UIImageView(frame: CGRect(x: 17.5, y: 10, width: 26, height: 26))
        iconImageView?.image = UIImage(named: modal?.image ?? "")
        iconImageView?.contentMode = .scaleAspectFit
        addSubview(iconImageView!)

        backgroundImageView = UIImageView(frame: CGRect(x: 4.5, y: 21, width: 57, height: 66))
        backgroundImageView?.image = UIImage(named: "selectedtab")
        backgroundImageView?.contentMode = .center
        backgroundImageView?.isHidden = true
        addSubview(backgroundImageView!)

        titleLabel = UILabel(frame: CGRect(x: 0, y: 40, width: 66, height: 10))
        titleLabel?.text = modal?.title
        titleLabel?.font = UIFont(name: "Poppins-Regular", size: 11)
        titleLabel?.textColor = .gray
        titleLabel?.textAlignment = .center
        addSubview(titleLabel!)

        button = UIButton(frame: bounds)
        addSubview(button!)
    }
}
