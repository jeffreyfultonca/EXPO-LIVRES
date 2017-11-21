//
//  CoreDataTestHelper.swift
//  expo-livres
//
//  Created by Jeffrey Fulton on 2015-09-25.
//  Copyright © 2015 Jeffrey Fulton. All rights reserved.
//

import CoreData
@testable import ExpoLivres

func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
    let managedObjectModel = PersistenceService.sharedInstance.managedObjectModel
    
    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    try! persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
    
    let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    
    return managedObjectContext
}

