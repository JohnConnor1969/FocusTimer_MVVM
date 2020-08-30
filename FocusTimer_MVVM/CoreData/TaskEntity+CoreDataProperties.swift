//
//  TaskEntity+CoreDataProperties.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 30.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var counter: Int64
    @NSManaged public var title: String?

}
