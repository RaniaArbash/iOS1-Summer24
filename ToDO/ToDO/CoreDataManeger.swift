//
//  CoreDataManeger.swift
//  ToDO
//
//  Created by Rania Arbash on 2024-07-25.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static var shared = CoreDataManager()
    
    func getAllTasks()->[ToDoTask]{
        var alltodo = [ToDoTask]()
        
        let fetchRequest = NSFetchRequest<ToDoTask>(entityName: "ToDoTask")
        // select * from ToDoTask
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
       
        do {
            alltodo = try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            
            print (error)
        }
        return alltodo

    }

    func getTasksBeginWith(text: String)->[ToDoTask]{
        var alltodo = [ToDoTask]()
        
        let fetchRequest = NSFetchRequest<ToDoTask>(entityName: "ToDoTask")
        //select * from ToDoTask where name BEGINS WITH text
        
        fetchRequest.predicate = NSPredicate(format: "name BEGINSWITH [c] %@", text)
        
        do {
            alltodo = try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            
            print (error)
        }
        return alltodo

    }
    
    
    func addNewTask(name : String, isU : Bool){
        let newTask = ToDoTask(context: persistentContainer.viewContext)
        newTask.name = name
        newTask.isUrgent = isU
        saveContext()
        
    }
    
    func updateATask(tobeUpdated: ToDoTask, updated_name: String, updated_isU: Bool){
        tobeUpdated.name = updated_name
        tobeUpdated.isUrgent = updated_isU
        saveContext()
    }
    func deleteOneTask(tobeDeleted: ToDoTask){
        
        persistentContainer.viewContext.delete(tobeDeleted)
        saveContext()
    }
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "ToDO")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
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

}
