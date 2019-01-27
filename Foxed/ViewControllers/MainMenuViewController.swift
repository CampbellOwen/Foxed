//
//  MainMenu.swift
//  Foxed
//
//  Created by Owen Campbell on 2019-01-26.
//  Copyright © 2019 Owen Campbell. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    private let reuseIdentifier = "GameCell"
    
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
    private var games: [Game] = []
    
    @IBOutlet weak var gamesCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gamesCollection.delegate = self
        gamesCollection.dataSource = self
        
        games.append(Game(name: "Kings Cup", description: "Draw cards and drinks until all four kings are drawn", imageName: "SampleGameImage"))
        games.append(Game(name: "Kings Cup", description: "High or low is also fun", imageName: "SampleGameImage"))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private let itemsPerRow: CGFloat = 1.5

}

extension MainMenuViewController {
    func game(for indexPath: IndexPath) -> Game {
        return games[indexPath.row]
    }
}

extension MainMenuViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView
//            .dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameSquareCell
//        //cell.label.text = "HULLO"
//        cell.populate(with: game(for: indexPath))
//
//
//        // Configure the cell
//        return cell
        
        let g = game(for: indexPath)
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GameCell
        cell.backgroundColor = .black
        cell.gameImage.image = UIImage(named: g.imageName)
        cell.gameDescription.text = g.description
        
        return cell
    }


}

extension MainMenuViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
