//
//  PersonDetailsVC.swift
//  16. დავალება - UITableView
//
//  Created by gvantsa gvagvalia on 4/13/24.
//

import UIKit

class PersonDetailsVC: UIViewController {
    
    let topView: UIImageView = {
        let topView = UIImageView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .darkGray
        return topView
    }()
    
    var myAvatar: UIImageView = {
        let myAvatar = UIImageView()
        myAvatar.translatesAutoresizingMaskIntoConstraints = false
        myAvatar.contentMode = .scaleAspectFill
        myAvatar.clipsToBounds = true
        myAvatar.layer.cornerRadius = 85
        return myAvatar
    }()
    
    var myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.textColor = .white
        myLabel.numberOfLines = 0
        myLabel.textAlignment = .center
        myLabel.font = UIFont.systemFont(ofSize: 23)
        return myLabel
    }()
    
    let detailsStackView: UIStackView = {
        let details = UIStackView()
        details.translatesAutoresizingMaskIntoConstraints = false
        details.backgroundColor = .white
        details.spacing = 15
        details.layer.cornerRadius = 15
        details.axis = .vertical
        details.distribution = .fill
        return details
    }()
    
    let genderView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    let ageView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    let hobbyView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    let genderLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.numberOfLines = 0
        return myLabel
    }()
    
    let ageLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.numberOfLines = 0
        return myLabel
    }()
    
    let hobbyLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.textAlignment = .right
        myLabel.numberOfLines = 0
        return myLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTopView()
        addDetailsStackView()
        view.backgroundColor = .systemGray5
    }
    
    func addTopView() {
        view.addSubview(topView)
        if let navigationController = navigationController {
            additionalSafeAreaInsets.top = navigationController.navigationBar.frame.height
        }
        topView.addSubview(myAvatar)
        topView.addSubview(myLabel)
        
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400),
            
            myAvatar.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            myAvatar.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            myAvatar.widthAnchor.constraint(equalToConstant: 160),
            myAvatar.heightAnchor.constraint(equalTo: myAvatar.widthAnchor),
            
            myLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            myLabel.topAnchor.constraint(equalTo: myAvatar.bottomAnchor, constant: 10),
            myLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor)
        ])
    }
    
    func addDetailsStackView() {
        let textForGender = UILabel()
        textForGender.translatesAutoresizingMaskIntoConstraints = false
        textForGender.text = "Gender:"
        
        let textForAge = UILabel()
        textForAge.translatesAutoresizingMaskIntoConstraints = false
        textForAge.text = "Age (Years):"
        
        let textForHobby = UILabel()
        textForHobby.translatesAutoresizingMaskIntoConstraints = false
        textForHobby.text = "Hobby:"
        
        let thinLine = UIView()
        thinLine.translatesAutoresizingMaskIntoConstraints = false
        thinLine.backgroundColor = .systemGray
        
        view.addSubview(detailsStackView)
        detailsStackView.addArrangedSubview(genderView)
        detailsStackView.addArrangedSubview(ageView)
        detailsStackView.addArrangedSubview(hobbyView)
        genderView.addSubview(genderLabel)
        ageView.addSubview(ageLabel)
        hobbyView.addSubview(hobbyLabel)
        
        genderView.addSubview(textForGender)
        ageView.addSubview(textForAge)
        hobbyView.addSubview(textForHobby)
        genderView.addSubview(thinLine)
        
        NSLayoutConstraint.activate([
            detailsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            detailsStackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            detailsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            genderView.leadingAnchor.constraint(equalTo: detailsStackView.leadingAnchor, constant: 10),
            genderView.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor, constant: -10),
            
            ageView.leadingAnchor.constraint(equalTo: detailsStackView.leadingAnchor, constant: 10),
            ageView.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor, constant: -10),
            
            hobbyView.leadingAnchor.constraint(equalTo: detailsStackView.leadingAnchor, constant: 10),
            hobbyView.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor, constant: -10),
            
            genderLabel.topAnchor.constraint(equalTo: genderView.topAnchor, constant: 0),
            genderLabel.trailingAnchor.constraint(equalTo: genderView.trailingAnchor, constant: -10),
            genderLabel.bottomAnchor.constraint(equalTo: genderView.bottomAnchor, constant: 0),
            
            textForGender.topAnchor.constraint(equalTo: genderView.topAnchor, constant: 0),
            textForGender.leadingAnchor.constraint(equalTo: genderView.leadingAnchor, constant: 0),
            textForGender.bottomAnchor.constraint(equalTo: genderView.bottomAnchor, constant: 0),
            
            ageLabel.topAnchor.constraint(equalTo: ageView.topAnchor, constant: 0),
            ageLabel.trailingAnchor.constraint(equalTo: ageView.trailingAnchor, constant: 0),
            ageLabel.bottomAnchor.constraint(equalTo: ageView.bottomAnchor, constant: 0),
            
            textForAge.topAnchor.constraint(equalTo: ageView.topAnchor, constant: 0),
            textForAge.leadingAnchor.constraint(equalTo: ageView.leadingAnchor, constant: 0),
            textForAge.bottomAnchor.constraint(equalTo: ageView.bottomAnchor, constant: 0),
            
            hobbyLabel.widthAnchor.constraint(equalTo: hobbyView.widthAnchor, multiplier: 0.55),
            hobbyLabel.topAnchor.constraint(equalTo: hobbyView.topAnchor, constant: 0),
            hobbyLabel.trailingAnchor.constraint(equalTo: hobbyView.trailingAnchor, constant: 0),
            hobbyLabel.bottomAnchor.constraint(equalTo: hobbyView.bottomAnchor, constant: 0),
            
            textForHobby.topAnchor.constraint(equalTo: hobbyView.topAnchor, constant: 0),
            textForHobby.leadingAnchor.constraint(equalTo: hobbyView.leadingAnchor, constant: 0),
            textForHobby.bottomAnchor.constraint(equalTo: hobbyView.bottomAnchor, constant: 0),
        ])
    }
}

//#Preview {
//    PersonDetailsVC()
//}
