import UIKit

extension UIColor {
    
    //カラーコードをRGBへと変更させる
    convenience init(code: String) {
        var color: UInt32 = 0
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
        if Scanner(string: code.replacingOccurrences(of: "#", with: "")).scanHexInt32(&color) {
            r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            g = CGFloat((color & 0x00FF00) >>  8) / 255.0
            b = CGFloat( color & 0x0000FF       ) / 255.0
        }
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

extension UIColor {
    
    //唐紅色
    class func haikei() -> UIColor {
        let karakurenaiColor = UIColor.init(code: "#060E1E")
        return karakurenaiColor
    }
    
    class func tabBar() -> UIColor {
        let karakurenaiColor = UIColor.init(code: "#060E1E")
        return karakurenaiColor
    }
}
