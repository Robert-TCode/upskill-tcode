//  Created by TCode on 21/01/2021.

import Foundation
import CoreData

extension NSPersistentStoreDescription {
    public static var sql: NSPersistentStoreDescription {
        guard let appGroupIdentifier = Bundle.main.infoDictionary?["AppGroupIdentifier"] as? String else {
            fatalError("AppGroupIdentifier string not found")
        }
        let appGroupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier)!
        let url = appGroupURL.appendingPathComponent("Database.sqlite")

        let persistentStoreDescription = NSPersistentStoreDescription(url: url)
        persistentStoreDescription.configuration = nil
        persistentStoreDescription.type = NSSQLiteStoreType

        return persistentStoreDescription
    }

    public static var inMemory: NSPersistentStoreDescription {
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        return persistentStoreDescription
    }
}

extension NSManagedObjectModel {
    public static var domain: NSManagedObjectModel {
        guard let modelURL = Bundle(for: PersistentContainer.self).url(forResource: "Database.momd", withExtension: nil) else {
            fatalError("Managed Object Model not found")
        }
        guard let managedOjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Managed Object Model not found at \(modelURL)")
        }

        return managedOjectModel
    }
}

class PersistentContainer: NSPersistentContainer {

    public static func loadedSQL() throws -> PersistentContainer {
        let persistentContainer = PersistentContainer(name: "Database", managedObjectModel: .domain)
        persistentContainer.persistentStoreDescriptions = [.sql]

        var throwableError: Error?

        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            guard error != nil else {
                return
            }

            do {
                // If loading fails, remove and reload store
                try FileManager.default.removeItem(at: persistentStoreDescription.url!)

                persistentContainer.loadPersistentStores { (_, error) in
                    throwableError = error
                }
            } catch let error {
                throwableError = error
            }
        }

        guard throwableError == nil else {
            throw throwableError!
        }

        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.mergePolicy = NSOverwriteMergePolicy

        return persistentContainer
    }

    public static func loadedInMemory() throws -> PersistentContainer {
        let persistentContainer = PersistentContainer(name: "Database", managedObjectModel: .domain)
        persistentContainer.persistentStoreDescriptions = [.inMemory]

        var throwableError: Error?

        persistentContainer.loadPersistentStores { (_, error) in
            throwableError = error
        }

        guard throwableError == nil else {
            throw throwableError!
        }

        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.mergePolicy = NSOverwriteMergePolicy

        return persistentContainer
    }
}
