//
//  GalaxyViewController.swift
//  PM_Project1
//
//  Created by Admin on 1/31/21.
//

import UIKit

class GalaxyViewController: UIViewController, UICollectionViewDelegate {
    
    private var collectionView: UICollectionView!
    
    var viewModel: GalaxyViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        viewModel?.dataReload = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
    }
    
}

extension GalaxyViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.starsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalaxyCell.cellID,
                                                      for: indexPath) as! GalaxyCell
        
        cell.starPlanetSystemNameLabel.text = viewModel?.starName(for: indexPath)
        cell.starPlanetSystemMassLabel.text = String((viewModel?.starPlanetSystemMass(for: indexPath))!)

        return cell
    }
    
}

fileprivate extension GalaxyViewController {
    
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.register(GalaxyCell.self, forCellWithReuseIdentifier: GalaxyCell.cellID)
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        collectionView.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: cellWidthHeightConstant, height: 44)
        
        return layout
    }
    
}
