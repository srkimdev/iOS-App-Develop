//
//  RestaurantLocationViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/30/24.
//

import UIKit
import MapKit
import CoreLocation

class RestaurantLocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var locationButton: UIButton!
    
    let locationManager = CLLocationManager()
    
    var list: [Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        filtering(data: list, category: "전체보기")
        
        let map = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonClicked))
        navigationItem.rightBarButtonItem = map
        navigationItem.rightBarButtonItem?.tintColor = .gray
        
        locationButton.addTarget(self, action: #selector(locationButtonClicked), for: .touchUpInside)
    
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
        
        // 클로저 동작원리
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
    
    @objc func locationButtonClicked() {
        
        var status: CLAuthorizationStatus
        status = locationManager.authorizationStatus
        
        if status == .denied {

            let alert = UIAlertController(
                title: "위치 권한 거부",
                message: "iOS 설정 화면으로 이동하여 위치 권한을 허용해주세요",
                preferredStyle: .alert)

            let open = UIAlertAction(title: "이동", style: .default) {_ in 
                
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
                        
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)")
                    })
                }
                
            }
            
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            
            alert.addAction(cancel)
            alert.addAction(open)

            present(alert, animated: true)
            
        }
        
    }

}

extension RestaurantLocationViewController {
    
    func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            print(#function)
            checkCurrentLocationAuthorization()
        } else {
            print("x")
        }
    }
    
    func checkCurrentLocationAuthorization() {
        var status: CLAuthorizationStatus
        status = locationManager.authorizationStatus
        switch status {
            
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            let center = CLLocationCoordinate2D(latitude: 37.51790, longitude: 126.88658)
            setRegionAndAnnotation(center: center)
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            print(status)
        }
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "현위치"
        annotation.coordinate = center
        
        mapView.addAnnotation(annotation)
        
    }
}

extension RestaurantLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(#function)
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    
}
