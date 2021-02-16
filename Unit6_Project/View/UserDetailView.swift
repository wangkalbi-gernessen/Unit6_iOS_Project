//
//  UserDetailView.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-14.
//

import UIKit

class UserDetailView: UIView {

    let nameLabel: UILabel = {
        let nL = UILabel()
        nL.textAlignment = .left
        nL.numberOfLines = 1
        nL.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return nL 
    }()
    
    let categoryLabel: UILabel = {
        let cg = UILabel()
        cg.textAlignment = .right
        cg.numberOfLines = 1
        cg.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return cg
    }()
    
    let infoLabel: UILabel = {
        let info = UILabel()
        info.textAlignment = .left
        info.numberOfLines = 0
        info.font = UIFont.preferredFont(forTextStyle: .headline)
        return info
    }()
    
    lazy var hStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [nameLabel,categoryLabel])
        stackview.axis = .horizontal
        stackview.spacing = 12
        stackview.distribution = .equalSpacing
        stackview.alignment = .firstBaseline
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    lazy var VstackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [hStackView,infoLabel])
        stackview.axis = .vertical
        stackview.spacing = 16
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    
    
    
    
    lazy var secondVstackView: UIStackView = {
        let secondSV = UIStackView()
        secondSV.axis = .vertical
        secondSV.spacing = 20
        secondSV.distribution = .fill
        secondSV.alignment = .fill
        secondSV.translatesAutoresizingMaskIntoConstraints = false
        return secondSV
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addSubview(VstackView)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        VstackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        VstackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        VstackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16).isActive = true
    }
}
