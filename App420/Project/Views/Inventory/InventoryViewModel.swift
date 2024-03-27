//
//  InventoryViewModel.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI
import CoreData

final class InventoryViewModel: ObservableObject {

    @AppStorage("metals") var metals: [String] = []
    
    @Published var statuses: [String] = ["Earning", "Available"]
    @Published var currentStatus = "Earning"
    @Published var currentAddStatus = ""
    
    @Published var colors: [String] = ["Gold", "Silver", "Platinum"]
    @Published var selectedColor = ""
    
    @Published var directions: [String] = ["Up", "Down"]
    @Published var currentDirection = ""

    @Published var invName: String = ""
    @Published var invStatus: String = ""
    @Published var invColor: String = ""
    @Published var invDescription: String = ""
    @Published var invPrice: String = ""
    @Published var invChange: String = ""
    @Published var invDirection: String = ""

    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false

    @Published var inventories: [InventoryModel] = []
    @Published var selectedInventory: InventoryModel?

    func addInventory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "InventoryModel", into: context) as! InventoryModel

        loan.invName = invName
        loan.invStatus = invStatus
        loan.invColor = invColor
        loan.invDescription = invDescription
        loan.invPrice = invPrice
        loan.invChange = invChange
        loan.invDirection = invDirection

        CoreDataStack.shared.saveContext()
    }
    
    func fetchInventories() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<InventoryModel>(entityName: "InventoryModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.inventories = result.filter{($0.invStatus ?? "") == currentStatus}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.inventories = []
        }
    }
}
