//
//  RestaurantLocationViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/30/24.
//

import UIKit
import MapKit

class RestaurantLocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var list: [Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        filtering(data: list, category: "전체보기")
        
        let map = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonClicked))
        navigationItem.rightBarButtonItem = map
    
    }
    
    func filtering(data: [Restaurant], category: String) {
        
        mapView.removeAnnotations(mapView.annotations)
        
        if category == "전체보기" {
            for item in data {
                let annotation = MKPointAnnotation()
                let center = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                
                mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 700, longitudinalMeters: 700)
                annotation.coordinate = center
                annotation.title = item.name
                mapView.addAnnotation(annotation)
            }
        } else {
            
            for item in data {
                if item.category == category {
                    print("dd")
                    let annotation = MKPointAnnotation()
                    let center = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                    
                    mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 700, longitudinalMeters: 700)
                    annotation.coordinate = center
                    annotation.title = item.name
                    mapView.addAnnotation(annotation)
                    
                }
            }
        }
    
    }
    
    @objc func filterButtonClicked() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let korean = UIAlertAction(title: "한식", style: .default) { _ in
            self.filtering(data: self.list, category: "한식")
        }
        
        let china = UIAlertAction(title: "중식", style: .default) { _ in
            self.filtering(data: self.list, category: "중식")
        }
        
        let western = UIAlertAction(title: "양식", style: .default) { _ in
            self.filtering(data: self.list, category: "양식")
        }
        
        let all = UIAlertAction(title: "전체보기", style: .default) { _ in
            self.filtering(data: self.list, category: "전체보기")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(korean)
        alert.addAction(china)
        alert.addAction(western)
        alert.addAction(all)
        
        present(alert, animated: true)
        
    }

}
