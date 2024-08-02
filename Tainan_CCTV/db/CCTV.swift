//
//  CCTVCoreDataClassswift.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/8/2.
//

import CoreData

@objc(CCTV)
public class CCTV: NSManagedObject {
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var longitude: String?
    @NSManaged public var latitude: String?
    @NSManaged public var url: String?
    @NSManaged public var source: String?
    @NSManaged public var updateTime: String?
}
