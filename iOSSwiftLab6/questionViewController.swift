//
//  questionViewController.swift
//  iOSSwiftLab6
//
//  Created by Gates on 2017/3/15.
//  Copyright © 2017年 Gates. All rights reserved.
//

import UIKit

class questionViewController: UIViewController {

    @IBOutlet weak var logoBtn1: UIButton!
    @IBOutlet weak var logoBtn2: UIButton!
    @IBOutlet weak var logoBtn3: UIButton!
    @IBOutlet weak var logoBtn4: UIButton!
    
    @IBOutlet weak var logoNameLabel: UILabel!
    
    @IBOutlet weak var scoreImg1: UIImageView!
    @IBOutlet weak var scoreImg2: UIImageView!
    @IBOutlet weak var scoreImg3: UIImageView!
    
    var score = 0
    var time = 10
    var allNumbersArray:[Int] = []
    var getNumbersArray:[Int] = []
    let logoNameArray = ["彼得潘","Apple","美商科高","可口可樂","微軟","豐田","IBM","三星","亞馬遜","賓士","奇異電子","BMW","麥當勞","迪士尼","英特爾","臉書","思科","甲骨文","耐吉","LV","H&M","喜美汽車","SAP","百事可樂","Gillette吉列","美國運通","IKEA","ZARA","幫寶適","UPS","百威啤酒","摩根大通","ebay","福特汽車","愛馬仕","現代汽車","雀巢咖啡","埃森哲","德國奧迪","家樂氏","福斯汽車","飛利浦","佳能","裕隆汽車","惠普企業","巴黎萊雅","安盛集團","匯豐銀行","惠普","花旗","保時捷","安聯人壽","西門子","GUCCI","高盛","達能集團","雀巢","高露潔","新力","3M","愛迪達","VISA","卡地亞","奧多比","星巴克","摩根史坦利","湯森路透","樂高","松下電器","KIA汽車","桑坦德銀行","探索頻道","華為","嬌生","Tiffany","肯德基","萬事達卡","DHL","Land Rover汽車","FedEx","哈雷機車","PRADA","Caterpillar","Burberry","全錄","傑克丹尼威士忌","雪碧","海尼根","MINI汽車","迪奧","PayPal","John Deere","荷蘭皇家殼牌","可樂娜啤酒","MTV音樂頻道","約翰走路","思美洛","酩悅香檳","Ralph Lauren","聯想","特斯拉汽車"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initQuestion()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initNumbersArray() {
        for i in 0...100 {
            allNumbersArray.append(i)
        }
    }
    
    func getRandomNum() {
        let randomNum = Int(arc4random()) % allNumbersArray.count
        getNumbersArray.append(randomNum)
        allNumbersArray.remove(at: randomNum)
    }
    
    func initQuestion() {
        initNumbersArray()
        for _ in 1...4 {
            getRandomNum()
        }
        print(getNumbersArray.description)
        
        let logoNameRandomNum:Int! = Int(arc4random()) % 4
        print("logoNameRandomNum - \(logoNameRandomNum)")
        let indexOflogoNameArray:Int! = getNumbersArray[logoNameRandomNum]
        print(indexOflogoNameArray)
        logoNameLabel.text = logoNameArray[indexOflogoNameArray]
        logoNameLabel.tag = indexOflogoNameArray
        
        logoBtnAction(targetBtn: logoBtn1, targetNumber: getNumbersArray[0])
        logoBtnAction(targetBtn: logoBtn2, targetNumber: getNumbersArray[1])
        logoBtnAction(targetBtn: logoBtn3, targetNumber: getNumbersArray[2])
        logoBtnAction(targetBtn: logoBtn4, targetNumber: getNumbersArray[3])
    }

    func logoBtnAction(targetBtn:UIButton!, targetNumber:Int?) {
        let btnimgName = "logo\(targetNumber!)"
        targetBtn.setImage(UIImage(named: btnimgName), for: UIControlState.normal)
        targetBtn.tag = targetNumber!
        targetBtn.addTarget(self, action: #selector(self.logoBtnPressedAction(sender:)), for: UIControlEvents.touchUpInside)
    }

    func logoBtnPressedAction(sender:UIButton!) {
        if (sender.tag == logoNameLabel.tag) {
            score += 10
            print("score \(score)")
        }
        scoreFontShow(targetScore: String(score))
        getNumbersArray.removeAll()
        allNumbersArray.removeAll()
        initQuestion()
    }
    
    func scoreFontShow(targetScore: String?) {
        let countOftargetScore:Int = (targetScore?.characters.count)!
        switch countOftargetScore {
        case 1:
            scoreImg1.image = UIImage(named: "0")
            scoreImg2.image = UIImage(named: "0")
            scoreImg3.image = UIImage(named: targetScore!)
            break
        case 2:
            scoreImg1.image = UIImage(named: "0")
            let digitalOfscoreImg2 = Int(targetScore!)! / 10
            scoreImg2.image = UIImage(named: "\(digitalOfscoreImg2)")
            scoreImg3.image = UIImage(named: "0")
            break;
        case 3:
            let digitalOfscoreImg1 = Int(targetScore!)! / 100
            let digitalOfscoreImg2 = (Int(targetScore!)! - digitalOfscoreImg1 * 100) / 10
            scoreImg1.image = UIImage(named: "\(digitalOfscoreImg1)")
            scoreImg2.image = UIImage(named: "\(digitalOfscoreImg2)")
            scoreImg3.image = UIImage(named: "0")
            break;
        default:
            break
        }
    }
}
