//
//  ViewController.swift
//  PM_Project1
//
//  Created by Admin on 1/16/21.
//

import UIKit

class UniverseViewController: UIViewController {

    private var collectionView: UICollectionView!

    private let viewModel = UniverseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        viewModel.dataReload = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
}

extension UniverseViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.galaxiesCount
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UniverseCell.cellID,
                                                      for: indexPath) as! UniverseCell
        
        cell.galaxyNameLabel.text = viewModel.galaxyName(for: indexPath)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GalaxyViewController()
        vc.viewModel = viewModel.galaxyViewModel(for: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

fileprivate extension UniverseViewController {
    
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.register(UniverseCell.self, forCellWithReuseIdentifier: UniverseCell.cellID)
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        collectionView.backgroundColor = .red
        
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

// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------

class UniverseCell: UICollectionViewCell {
    
    static var cellID = "UniverseCell"
    
    let galaxyNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        galaxyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(galaxyNameLabel)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            galaxyNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            galaxyNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
