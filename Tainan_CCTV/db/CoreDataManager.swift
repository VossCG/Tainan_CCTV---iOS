//
//  CoreDataManager.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/8/2.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    // Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CCTV")
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Save Context
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // Insert CCTV
    func insertCCTV(cctvDto: CCTVDto) {
        let context = persistentContainer.viewContext
        let cctv = CCTV(context: context)
        cctv.id = cctvDto.id
        cctv.name = cctvDto.name
        cctv.longitude = cctvDto.longitude
        cctv.latitude = cctvDto.latitude
        cctv.url = cctvDto.url
        cctv.source = cctvDto.source
        cctv.updateTime = cctvDto.updateTime
        
        saveContext()
    }
    
    // Fetch CCTV
    func fetchCCTV() -> [CCTV] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<CCTV> = CCTV.fetchRequest()
        
        do {
            let cctvs = try context.fetch(fetchRequest)
            return cctvs
        } catch {
            print("Failed to fetch CCTV: \(error)")
            return []
        }
    }
    
    // Delete CCTV
    func deleteCCTV(cctv: CCTV) {
        let context = persistentContainer.viewContext
        context.delete(cctv)
        saveContext()
    }
}
