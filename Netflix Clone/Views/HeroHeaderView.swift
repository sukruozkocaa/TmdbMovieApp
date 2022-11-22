//
//  HeroHeaderView.swift
//  Netflix Clone
//
//  Created by Şükrü Özkoca on 1.11.2022.
//

import UIKit

class HeroHeaderView: UIView {
    
    var titlename: String?
    var titleOverView: String?
    
    var delegate: CollectionViewTableViewCellDelegate?
    
    private let watchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Watch", for: .normal)
        button.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 25)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapWatchButton), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "ABC DENEME"
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func didTapWatchButton() {
        APICaller.shared.getMovie(with: self.titlename ?? "Netflix" + " trailer") { [weak self] result in
            switch result {
            case .success(let videoElement):
                
                                
                let viewModel = TitlePreviewViewModel(title: self?.titlename ?? "" , youtubeView: videoElement, titleOverView: self?.titleOverView ?? "")
                
                guard let strongSelf = self else {return}
             
                self?.delegate?.collectionViewTableViewCellDidTapCell(CollectionViewTableViewCell(), viewModel: viewModel)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "hero")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()

        addSubview(titleLabel)
        addSubview(watchButton)

        applyConstraints()
        
    }
    
    private func applyConstraints() {
       let watchButtonConstraints = [
            watchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            watchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            watchButton.widthAnchor.constraint(equalToConstant: 300)]
        
       let titleLabelConstraints = [
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -100)
       ]
       
        NSLayoutConstraint.activate(watchButtonConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)

    }
    
    public func configure(with model: TitleViewModel, title: String, titleOverView: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL ?? "")") else { return }
        heroImageView.sd_setImage(with: url,placeholderImage: UIImage(named: "logo"))
        self.titlename = title
        self.titleOverView = titleOverView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
