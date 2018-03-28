//
//  ViewController.swift
//  TXOCR
//
//  Created by lhs7248 on 2018/3/1.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

import UIKit
public enum LSScanType {
    
    case ocr
    
    case front
}
class ViewController: UIViewController {

    
    fileprivate var dataSource = [LSItemCellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         prepareData()
        
    }

    /// 准备数据
    fileprivate func prepareData() -> Void {
        let model1 =  LSItemCellModel("身份证OCR识别", "",  LSScanType.ocr)
        self.dataSource.append(model1)
    }
    
 
    
    

}


fileprivate let reuseIdentifier = "DebitConformCell"
fileprivate let sectionInsets = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
fileprivate let itemsPerRow: CGFloat = 1

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    //1
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//
    //2
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! LSDebitConformCell
        //2
        let cellModel = self.dataSource[indexPath.row]
        //3
        cell.textLabel.text = cellModel.textStr
        cell.itemImageView.image = UIImage(named: cellModel.imageStr!)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cellModel = self.dataSource[indexPath.row]
        
        let takePictureVC = LSTakePicktureViewController.instance()
        takePictureVC.itemModel = cellModel
        self.present(takePictureVC, animated: false, completion: nil)
        
        
        
    }
    
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = UIScreen.main.bounds.size.width - 36 - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 60)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

class LSDebitConformCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
}


class LSItemCellModel: NSObject {
    
    var textStr:String? = "" // 文本信息
    var imageStr:String? = "" // cell的imageStr
    var scanType:LSScanType?//扫描的类型
    
    init(_ textStr:String?,_ imageStr:String?,_ scanType:LSScanType) {
        
        self.textStr = textStr
        self.imageStr = imageStr
        self.scanType = scanType
    }
}
