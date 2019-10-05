//import UIKit
//
//class CardView: UIView {
//
//    let imageView = UIImageView()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
//
//    func setup() {
//        // Shadow
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.25
//        layer.shadowOffset = CGSize(width: 0, height: 1.5)
//        layer.shadowRadius = 4.0
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
//
//        // Corner Radius
//        layer.cornerRadius = 10.0;
//        self.clipsToBounds = true
//
//        let contentView = UIView(frame: self.bounds)
//        self.addSubview(contentView)
//
//        contentView.addSubview(imageView)
//        imageView.snp.makeConstraints { make in
//            make.size.equalTo(contentView)
//            make.center.equalTo(contentView)
//        }
//    }
//
//    func setImage(image: UIImage) {
//        self.imageView.image = image
//    }
//
//}
