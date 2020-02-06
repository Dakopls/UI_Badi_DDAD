//
//  DetailViewController.swift
//  Badi
//
//  Created by user on 28/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher
import TinyConstraints

class DetailViewController: UIViewController {

//    @IBOutlet weak var photo: UIImageView!
//    @IBOutlet weak var name: UILabel!
//    @IBOutlet weak var price: UILabel!
//    @IBOutlet weak var desc: UILabel!
//    @IBOutlet weak var bio: UILabel!
//    @IBOutlet weak var map: MKMapView!
    
    // MARK: - Properties
    var presenter: DetailPresenter?
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    lazy var labelWidth = self.view.frame.width - 40.0
    
    // MARK: - Views
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        return view
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"),for: .normal)
        button.height(18.0)
        button.width(20.0)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .systemYellow
        return photo
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 24)
        label.textAlignment = NSTextAlignment.left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 21)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    lazy var desc: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 17)
        label.textAlignment = NSTextAlignment.left
        label.numberOfLines = 0
        label.backgroundColor = .systemYellow
        label.sizeToFit()
        return label
    }()
    
    lazy var owner: UILabel = {
        let label = UILabel()
        label.text = "Propietario/a"
        label.font = UIFont(name: "verdana", size: 21)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    lazy var bio: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 17)
        label.textAlignment = NSTextAlignment.left
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    lazy var location: UILabel = {
        let label = UILabel()
        label.text = "Ubicación"
        label.font = UIFont(name: "verdana", size: 21)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    lazy var map: MKMapView = {
        let map = MKMapView()
        map.mapType = MKMapType.standard
        return map
    }()

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        self.presenter?.fetchRoomDetail()
    }
    
    fileprivate func viewSettings() {
        addViews()
        addConstraints()
    }
    
    fileprivate func addViews() {
        view.addSubview(scrollView)
        view.addSubview(backButton)
        scrollView.addSubview(containerView)
        containerView.addSubview(photo)
        containerView.addSubview(name)
        containerView.addSubview(price)
        containerView.addSubview(desc)
        containerView.addSubview(owner)
        containerView.addSubview(bio)
        containerView.addSubview(location)
        containerView.addSubview(map)
    }
    
    fileprivate func addConstraints() {
        backButton.top(to: view, offset: 62)
        backButton.left(to: view, offset: 20)
        photo.edgesToSuperview(excluding: .bottom)
        photo.height(314.0)
        name.topToBottom(of: photo, offset: 18.0)
        name.left(to: containerView, offset: 20.0)
        name.right(to: containerView, offset: -20.0)
        price.topToBottom(of: name, offset: 10.0)
        price.left(to: containerView, offset: 20.0)
        price.right(to: containerView, offset: -20.0)
        desc.topToBottom(of: price, offset: 10.0)
        desc.left(to: containerView, offset: 20.0)
        desc.right(to: containerView, offset: -20.0)
        owner.topToBottom(of: desc, offset: 20)
        owner.left(to: containerView, offset: 20.0)
        owner.right(to: containerView, offset: -20.0)
        bio.topToBottom(of: owner, offset: 10)
        bio.left(to: containerView, offset: 20.0)
        bio.right(to: containerView, offset: -20.0)
        location.topToBottom(of: bio, offset: 20)
        location.left(to: containerView, offset: 20.0)
        location.right(to: containerView, offset: -20.0)
        map.topToBottom(of: location, offset: 18)
        map.height(314.0)
        map.left(to: containerView, offset: 0.0)
        map.right(to: containerView, offset: 0.0)
    }
    
    @objc func backButtonPressed(sender: Any) {
        self.presenter?.backButtonPressed()
    }

}

// MARK: - Protocols
extension DetailViewController: ViewProtocol {
    func populate<T>(content: T) {
        let room_detail = content as! RoomDetail
        self.photo.kf.setImage(with: URL(string: room_detail.photos[0].url_big!))
        self.name.text = room_detail.title
        self.price.text = room_detail.price
        self.desc.text = room_detail.description
        self.bio.text = room_detail.owner.display_bio
        self.map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: room_detail.lat, longitude:room_detail.lng), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)), animated: false)
    }
}
