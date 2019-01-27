//
//  MainMenu.swift
//  Foxed
//
//  Created by Owen Campbell on 2019-01-26.
//  Copyright © 2019 Owen Campbell. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet weak var gameCollection: UICollectionView!
    
    private let reuseIdentifier = "GameCell"
    
    private var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        games.append(Game(name: "Kings Cup", description: "Draw cards and drinks until all four kings are drawn", imageName: "KingsCup"))
        games.append(Game(name: "Kings Cup", description: "High or low is also fun", imageName: "KingsCup"))
        gameCollection.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        gameCollection.dataSource = self
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

extension MainMenuViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GameCell
        cell.populate(with: game(for: indexPath))
        
        return cell
    }
    
    
}
