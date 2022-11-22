//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Şükrü Özkoca on 1.11.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let titlesPosterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imdbImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "imdb_logo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        contentView.addSubview(imdbImageView)
        contentView.addSubview(imdbLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        let titlesPosterUIImageViewConstraints = [
            titlesPosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterImageView.widthAnchor.constraint(equalToConstant: 100)
            
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterImageView.trailingAnchor, constant: 30),
           // titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 220)
        ]
        
        let playTitleButtonConstraints = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView .trailingAnchor, constant: -10),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ]
        
        let imdbLogoImageViewConstraints = [
           // imdbImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 10),
            imdbImageView.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 50),
            imdbImageView.leftAnchor.constraint(equalTo: titlesPosterImageView.rightAnchor,constant: 30),
            imdbImageView.widthAnchor.constraint(equalToConstant: 50),
            imdbImageView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let imdbLabelConstraints = [
            imdbLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 50),
            imdbLabel.leftAnchor.constraint(equalTo: titlesPosterImageView.rightAnchor,constant: 90),
            imdbLabel.widthAnchor.constraint(equalToConstant: 50),
            imdbLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
        NSLayoutConstraint.activate(imdbLogoImageViewConstraints)
        NSLayoutConstraint.activate(imdbLabelConstraints)
        
    }
    
    public func configure(with model: TitleViewModel, votePopularity: Double) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL ?? "")") else { return }
        
        titlesPosterImageView.sd_setImage(with: url,completed: nil)
        titleLabel.text = model.titleName
        imdbLabel.text = String(votePopularity)
        imdbLabel.font = UIFont(name: "GillSans-Bold", size: 18)!
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
