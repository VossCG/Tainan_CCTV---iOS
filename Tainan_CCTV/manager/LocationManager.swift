import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published private(set) var location: CLLocation? {
        didSet {
            if let location = location {
                latitude = location.coordinate.latitude
                longitude = location.coordinate.longitude
            }
        }
    }
    @Published var latitude: CLLocationDegrees = 0.0
    @Published var longitude: CLLocationDegrees = 0.0
    @Published var status: CLAuthorizationStatus?
    
    static let shared = LocationManager()
    
    private override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    
    static func getCurrentLocation() -> CLLocationCoordinate2D {
        
        guard let location = shared.location else {
            return CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        }
        return location.coordinate
    }
}
