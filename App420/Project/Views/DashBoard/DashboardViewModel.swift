//
//  DashboardViewModel.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI
import CoreData

final class DashboardViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""
    
    @AppStorage("totalBalance") var totalBalance = ""
    @AppStorage("Change") var Change = ""
    @AppStorage("Earning") var Earning = ""
    @AppStorage("Lost") var Lost = ""
    
    @Published var TB = ""
    @Published var Chan = ""
    @Published var Ear = ""
    @Published var Los = ""

    @Published var metals: [String] = ["Gold", "Silver", "Platinum"]
    
    @Published var transTypes: [String] = ["Earning", "Loss"]
    @Published var currentTransType = ""

    @Published var currentMetal = ""
    @Published var currentTrans = ""

    @Published var transMetal: String = ""
    @Published var transTrans: String = ""
    @Published var transAmount: String = ""
    @Published var transDate: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false

    @Published var transactions: [TransModel] = []
    @Published var selectedTransaction: TransModel?

    func addTransaction() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TransModel", into: context) as! TransModel

        loan.transMetal = transMetal
        loan.transTrans = transTrans
        loan.transAmount = transAmount
        loan.transDate = transDate

        CoreDataStack.shared.saveContext()
    }
    
    func fetchTransactions() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TransModel>(entityName: "TransModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.transactions = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.transactions = []
        }
    }
    
    
    
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
        
            self.inventories = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.inventories = []
        }
    }
}

