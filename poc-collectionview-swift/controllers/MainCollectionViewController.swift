//
//  MainCollectionViewController.swift
//  poc-collectionview-swift
//
//  Created by MacBook on 08/02/18.
//  Copyright © 2018 RYam corp. All rights reserved.
//

import UIKit

private let kMainHeaderCellId = "MainHeaderCellId"
private let kMainMenuCellId = "MainMenuCellId"
private let mainHeaderCellXibName = "MainHeaderCollectionViewCell"
private let mainMenuCellXibName = "MainMenuCollectionViewCell"
private let kNumberOfSections = 1
private let kNumberOfItemsInSection = 4

private let kMainHeaderHeight: CGFloat = 200
private let kMainMenuItemHeight: CGFloat = 50
private let kMenuOptions = ["Abrir", "Configurar", "Sair"]


class MainCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerClasses()
        registerNibs()
    }
    
    func registerClasses() {
        self.collectionView!.register(MainHeaderCollectionViewCell.self, forCellWithReuseIdentifier: kMainHeaderCellId)
        self.collectionView!.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: kMainMenuCellId)
    }
    
    func registerNibs() {
        self.collectionView!.register(UINib.init(nibName:mainHeaderCellXibName , bundle: Bundle.main), forCellWithReuseIdentifier: kMainHeaderCellId)
        self.collectionView!.register(UINib.init(nibName:mainMenuCellXibName , bundle: Bundle.main), forCellWithReuseIdentifier: kMainMenuCellId)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return kNumberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kNumberOfItemsInSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        if (indexPath.row == 0) {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMainHeaderCellId, for: indexPath)
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMainMenuCellId, for: indexPath)
            (cell as! MainMenuCollectionViewCell).menuTitleLabel.text = kMenuOptions[indexPath.row - 1]
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height: (indexPath.row == 0 ? kMainHeaderHeight : kMainMenuItemHeight))
    }
}
