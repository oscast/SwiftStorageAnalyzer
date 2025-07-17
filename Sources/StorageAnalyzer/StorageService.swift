//
//  StorageService.swift
//  AtomPic
//
//  Created by Oscar Castillo on 2/11/24.
//

import Foundation

// MARK: - SystemService Protocol

public protocol SystemService {
    func getStorageInfo() -> (used: Double, total: Double)
}

// MARK: - ViewModel

public class StorageViewModel: ObservableObject {
    @Published public var usedStorage: Double = 0.0
    @Published public var totalStorage: Double = 0.0
    private let systemService: SystemService
    
    public init(systemService: SystemService) {
        self.systemService = systemService
        updateStorageInfo()
    }
    
    public func updateStorageInfo() {
        let storage = systemService.getStorageInfo()
        usedStorage = storage.used
        totalStorage = storage.total
    }
    
    public var usagePercentage: Double {
        totalStorage == 0 ? 0 : (usedStorage / totalStorage)
    }
}

public class DefaultSystemService: SystemService {
    public init() {}
    public func getStorageInfo() -> (used: Double, total: Double) {
        let fileManager = FileManager.default
        if let attributes = try? fileManager.attributesOfFileSystem(forPath: NSHomeDirectory()),
           let totalSpace = attributes[.systemSize] as? NSNumber,
           let freeSpace = attributes[.systemFreeSize] as? NSNumber {
            let total = totalSpace.doubleValue / (1024 * 1024 * 1024) // GB
            let used = total - (freeSpace.doubleValue / (1024 * 1024 * 1024)) // GB
            return (used: used, total: total)
        }
        return (used: 0.0, total: 0.0)
    }
}
