import Foundation

public protocol Factory {
    
    func createCar(_ car: Cars)
}

public class ImportFactory: Factory { // Witness Table Dispatch
    
    public var delegate: FactoryDelegate?
    public static var amoutCars = 0
    
    private var racingCarParking = [RacingCar]()
    private var passengerCarParking = [PassengerCar]()
    private var truckParking = [Truck]()
    private var suvParking = [SUV]()
    
    public init() {}
    
    public func createCar(_ car: Cars) {
        ImportFactory.amoutCars += 1
        
        var newcar: Car
        switch car{
        case .racingCar:
            let racingCar = RacingCar()
            newcar = racingCar
            racingCarParking.append(racingCar)
        case .passengerCar:
            let passengerCar = PassengerCar()
            newcar = passengerCar
            passengerCarParking.append(passengerCar)
        case .truck:
            let truck = Truck()
            newcar = truck
            truckParking.append(truck)
        case .SUV:
            let suv = SUV()
            newcar = suv
            suvParking.append(suv)
        }
        
        delegate?.createdCars(car: newcar, of: car)
    }
}

public enum Cars {
    case racingCar
    case passengerCar
    case truck
    case SUV
}

public protocol CarProtocol {
    
    var vin: Int { get set }
    var model: String {get set}
    var wheels: Int { get set }
    var steeringWheel: Int { get set }
    var engine: Engine { get set }
    var areDoorsOpen: StatesOfCars { get set }
    var carEngine: StatesOfCars { get set }
    var tankCondition: StatesOfCars { get set }
    
    mutating func changeWheel()
}

public enum StatesOfCars {
    case on, off
    
    mutating func changeState(){
        switch self {
        case .on: self = .off
        case .off: self = .on
        }
        
    }
}

public protocol Car: CarProtocol {
    mutating func openOrCloseTheDoor()
    mutating func drive()
}

extension Car { // Static(Direct) Dispatch
    
    public mutating func openOrCloseTheDoor() {
        areDoorsOpen.changeState()
    }
    
    public mutating func drive() {
        if tankCondition == StatesOfCars.on {
            print ("Поехали!")
        } else {
            tankCondition = StatesOfCars.on
            print ("Вы заправили машину и поехали!")

        }
    }
}
extension CarProtocol {
    
    public mutating func changeWheel() {
        carEngine.changeState()
        areDoorsOpen.changeState()
        print("Вы достаете запасное колесо и заменяете неисправное")
    }
}


public struct Engine {
    let block = 1
    var cylinder = 4
    var piston = 1
    var pistonRings = 2
    var connectingRod = "average quality"
    
    mutating func update(){
        if (connectingRod == "average quality"){
            connectingRod = "excellent quality"
        }
        
        if (cylinder < 8){
            cylinder += 2
        }
        if (piston == 1){
            piston += 1
            cylinder += 2
        }
    }
}

protocol RacingCarProtocol: Car {
    var maxSpeed: Int {get set}
    
    mutating func maxSpeedAndEngine()
}

public struct RacingCar: RacingCarProtocol {
    
    var maxSpeed = 400

    mutating func maxSpeedAndEngine() {
        if maxSpeed == 666 {
            let daemon = "Boo"
            print(daemon)
        } else if maxSpeed > 666 {
            var racingEngine = Engine(cylinder: 4, piston: 1, pistonRings: 2, connectingRod: "average quality")
            racingEngine.update()
        }
    }


    public var vin = Int.random(in: 1000..<10000)
    public var model = "Bugatti Veyron"
    public var wheels = 4
    public var steeringWheel = 720
    public var engine = Engine()
    public var areDoorsOpen: StatesOfCars = .off
    public var carEngine: StatesOfCars = .on
    public var tankCondition: StatesOfCars = .on
}

protocol PassengerCarProtocol: Car {
    var family: Int {get set}
    var mashineSize:String {get set}
    
    mutating func TripAtDacha()
}

public struct PassengerCar: PassengerCarProtocol {
    var family = 4
    
    var mashineSize = ""
    
    mutating func TripAtDacha() {
        if family <= 5 && wheels >= 4 {
            mashineSize = "Идеально"
        } else {
            mashineSize = "Отвратительно"
        }
    }
    
    public var vin = Int.random(in: 1000..<10000)
    public var model = "Hyundai Grand Santa"
    public var wheels = 4
    public var steeringWheel = 600
    public var engine = Engine()
    public var areDoorsOpen: StatesOfCars = .off
    public var carEngine: StatesOfCars = .on
    public var tankCondition: StatesOfCars = .on
}

protocol TruckProtocol: Car {
    var loadCapacity: Int {get set}
    var body: String {get set}
    
    mutating func forLoadCapacity()
}

public struct Truck: TruckProtocol {
    var loadCapacity = 10000
    
    var body = "1-5м"
    
    mutating func forLoadCapacity() {
        if loadCapacity > 13000 {
            body = "6-7м"
        } else {
            body = "1-5м"
        }
    }
    
    public var vin = Int.random(in: 1000..<10000)
    public var model = "KAMAZ"
    public var wheels = 4
    public var steeringWheel = 700
    public var engine = Engine()
    public var areDoorsOpen: StatesOfCars = .off
    public var carEngine: StatesOfCars = .on
    public var tankCondition: StatesOfCars = .on
}

protocol SUVProtocol: Car {
    var wheelSize: Int {get set}
    var clean: String {get set}
    
    mutating func goToForest()
}

public struct SUV: SUVProtocol {
    var wheelSize = 40
    
    var clean = ""
    
    mutating func goToForest() {
        if wheelSize > 50 {
            clean = "Чистая"
        } else {
            clean = "Грязная"
        }
    }
    
    public var vin = Int.random(in: 1000..<10000)
    public var model = "Ford Everest"
    public var wheels = 4
    public var steeringWheel = 670
    public var engine = Engine()
    public var areDoorsOpen: StatesOfCars = .off
    public var carEngine: StatesOfCars = .on
    public var tankCondition: StatesOfCars = .on
}

public protocol FactoryDelegate: AnyObject {
    func createdCars(car: Car, of type: Cars)
}

public class Dealer: FactoryDelegate { // Witness Table Dispatch
    
    private var racingCarCount: [RacingCarProtocol] = []
    private var passengerCarCount: [PassengerCarProtocol] = []
    private var truckCount: [TruckProtocol] = []
    private var suvCount: [SUVProtocol] = []
    
    public init() {}
    
    public func createdCars(car: Car, of type: Cars) {
        switch type{
        case .racingCar:
            if let auto = car as? RacingCarProtocol {
                racingCarCount.append(auto)
            }
        case .passengerCar:
            if let auto = car as? PassengerCarProtocol {
                passengerCarCount.append(auto)
            }
        case .truck:
            if let auto = car as? Truck {
                truckCount.append(auto)
            }
        case .SUV:
            if let auto = car as? SUVProtocol {
                suvCount.append(auto)
            }
            
        }
    }
    
    public func extradition(_ car: Cars) -> Car {
        switch car {
        case .racingCar:
            if let auto = racingCarCount.popLast() {
                return auto
            }
        case .passengerCar:
            if let auto = passengerCarCount.popLast() {
                return auto
            }
        case .truck:
            if let auto = truckCount.popLast() {
                return auto
            }
        case .SUV:
            if let auto = suvCount.popLast(){
                return auto
            }
        }
        return car as! Car
    }
}

