//
//  OnBoardingViewController.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 06.03.23.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.addTarget(self, action: #selector(didTapNextButtonAction), for: .touchUpInside)
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var currentPage: Int = 0 {
        didSet {
            didCurrentPageChange()
        }
    }
    
    private let viewModel: OnBoardingViewModel = OnBoardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        viewModel.getItems()
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
    }

    private func didCurrentPageChange() {
        pageControl.currentPage = currentPage
        if currentPage == viewModel.list.count - 1 {
            nextButton.setTitle("Finish", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    @objc
    private func didTapNextButtonAction() {
        if currentPage < viewModel.list.count - 1 {
            currentPage += 1
            
            collectionView.isPagingEnabled = false

            let nextIndexPath = IndexPath(item: currentPage, section: 0)
            
            collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            
            collectionView.isPagingEnabled = true

        } else {
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                performSegue(withIdentifier: "toDashboard", sender: nil)
        }
    }

}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardingCell", for: indexPath) as? OnBoardingCollectionViewCell {
            
            cell.configure(item: viewModel.list[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
