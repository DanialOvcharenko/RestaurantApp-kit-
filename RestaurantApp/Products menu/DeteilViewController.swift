//
//  DeteilViewController.swift
//  CollectionViewTesting
//
//  Created by Mac on 09.02.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    var indexPath = IndexPath(item: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "DetailProductCell", bundle: nil), forCellWithReuseIdentifier: "DetailProductCell")
        self.collectionView.performBatchUpdates(nil) { (_) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
    }


}

// MARK: - DetailViewController EXT

extension DetailViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailProductCell", for: indexPath) as! DetailProductCell
        
        cell.setupCell(product: self.products[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: UIScreen.main.bounds.width - 10, height: collectionView.frame.height)
        return collectionView.frame.size
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//    }
}
