//
//  HeroHeadUIView.swift
//  Netflex Clone
//
//  Created by ChuantaiHu on 2023-03-02.
//

import UIKit

class HeroHeadUIView: UIView {
    
    private let downloadButton:UIButton = {
       
        let button  = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButton:UIButton = {
       
        let button  = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    private let heroImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroimage")
        return imageView
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    private func applyConstraints(){
        
        let playButtonconstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        let downloadButtonconstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(playButtonconstraints)
        NSLayoutConstraint.activate(downloadButtonconstraints)
    }
    
    public func configure(with model:TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        heroImageView.sd_setImage(with: url, completed: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
