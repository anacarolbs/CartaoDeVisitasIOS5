//
//  OnboardingViewController.swift
//  CartaoDeVisitasIOS5
//
//  Created by Ana Carolina Barbosa de Souza on 18/06/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variables
    let titleArray = [
        "Cartão de Visitas",
        "Facilitar o Networking",
        "Sustentabilidade"
    ]
    let subtitleArray = [
        "Um cartão de visitas é uma ferramenta muito importante para o networking e marketing pessoal. E na era digital, porque não um cartão de visitas virtual?",
        "Ao participar de eventos, reuniões ou conferências, você pode trocar cartões de visitas com outras pessoas. Isso ajuda a criar conexões profissionais e lembrar de quem você conheceu.",
        "Reduz a necessidade de imprimir cartões físicos, contribuindo para um ambiente mais sustentável."
    ]
    let imageArray = [
        ImageHelper.onboarding1,
        ImageHelper.onboarding2,
        ImageHelper.onboarding3,

    ]
    
    // MARK: Action
    @IBAction func skipButtonAction(_ sender: UIButton) {
    }
    @IBAction func signupButtonAction(_ sender: UIButton) {
    }
    @IBAction func loginButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func pageValueChanged(_ sender: Any) {
        showItem(at: pageControl.currentPage)
    }
    
    }
    

    // MARK: - View Life Cicle
extension OnboardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//// MARK: - IBActions
//extension OnboardingViewController {
//    
//}

// MARK: - Private functions
extension OnboardingViewController {
    private func skipShow(_ bool: Bool) {
        skipButton.isHidden = !bool
        signupButton.isHidden = bool
        loginButton.isHidden = bool
    }
    
    private func showItem(at index: Int) {
        skipShow(index != 2)
        pageControl.page = index
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally, .centeredVertically], animated: true)
    }
}

// MARK: -  UICollectionView Delegate and Datasources
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidht = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidht / 2) / pageWidht) + 1)
        pageControl.page = page
        
        skipShow(page != 2)
    }
}

extension UIPageControl {
    var page: Int {
        get {
            return currentPage
        } set {
            currentPage = newValue
            setIndicatorImage(ImageHelper.pageSelected, forPage: newValue)
            for index in 0..<numberOfPages where index != newValue { preferredIndicatorImage = ImageHelper.page
            }
        }
    }
}

