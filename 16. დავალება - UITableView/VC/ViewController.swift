//
//  ViewController.swift
//  16. დავალება - UITableView
//
//  Created by gvantsa gvagvalia on 4/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    let studentsInfo: StudentsInfo? = nil
    
    let myInfo = StudentsInfo(name: "გვანცა გვაგვალია", gender: .female, age: 25, hobbby: "watching movies, tv shows; doing yoga. in their free time enjoys listening to Bobby Lee and Theo Von's podcasts.", avatar: "Avatar2")
    
    lazy var sectionTitle: [String] = {
        let title =  Array(Set(namesArray.compactMap { $0.name.prefix(1).uppercased()}))
        title.forEach({sectionDictionary[$0] = [StudentsInfo]()})
        namesArray.forEach({sectionDictionary[String($0.name.prefix(1).uppercased())]?.append($0)})
        return title.sorted()
    }()
    
    var sectionDictionary = [String: [StudentsInfo]]()
    
    let contactsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.contentInsetAdjustmentBehavior = .automatic
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableview
    }()
    
    let header: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.accessibilityIdentifier = "cellHeader"
        return header
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "iOS Squad"
        addTableView()
    }
    
    func addTableView() {
        
        view.addSubview(contactsTableView)
        
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.numberOfLines = 0
        myLabel.text = myInfo.name
        myLabel.font = UIFont.systemFont(ofSize: 23)
        
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.image = UIImage(named: myInfo.avatar ?? "")
        myImage.contentMode = .scaleAspectFill
        myImage.clipsToBounds = true
        myImage.layer.cornerRadius = 50
        
        contactsTableView.tableHeaderView = header
        header.addSubview(myLabel)
        header.addSubview(myImage)
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        header.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(headerTapped)))
        header.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            header.leadingAnchor.constraint(equalTo: contactsTableView.leadingAnchor),
            header.topAnchor.constraint(equalTo: contactsTableView.topAnchor),
            header.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            header.heightAnchor.constraint(equalToConstant: 100),
            
            myImage.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            myImage.topAnchor.constraint(equalTo: header.topAnchor),
            myImage.bottomAnchor.constraint(equalTo: header.bottomAnchor),
            myImage.widthAnchor.constraint(equalToConstant: 100),
            myImage.heightAnchor.constraint(equalTo: myImage.widthAnchor),
            
            myLabel.leadingAnchor.constraint(equalTo: myImage.trailingAnchor, constant: 10),
            myLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            myLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor),
        ])
    }
    
    @objc func headerTapped() {
        let detailsVC = PersonDetailsVC()
        if let avatarName = myInfo.avatar, !avatarName.isEmpty {
            detailsVC.myAvatar.image = UIImage(named: avatarName) ?? UIImage(named: "defaultAvatar")
        } else {
            detailsVC.myAvatar.image = UIImage(named: "defaultAvatar")
        }
        detailsVC.myLabel.text = myInfo.name
        detailsVC.genderLabel.text = myInfo.gender.rawValue
        detailsVC.ageLabel.text = String(myInfo.age)
        detailsVC.hobbyLabel.text = myInfo.hobbby
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionDictionary[sectionTitle[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let sectionTitle = sectionTitle[indexPath.section]
        if let studentsInSection = sectionDictionary[sectionTitle],
           let firstCarachter = studentsInSection[indexPath.row].name.first {
            cell.textLabel?.text = String(firstCarachter).uppercased() + studentsInSection[indexPath.row].name.dropFirst()
        }
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitle
    }
}

//#Preview {
//    ViewController()
//}
//
