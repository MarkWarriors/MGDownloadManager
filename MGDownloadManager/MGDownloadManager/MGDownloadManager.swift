//
//  MGDownloadManager.swift
//  MGDownloadManager
//
//  Created by Marco Guerrieri on 08/04/18.
//  Copyright © 2018 Marco Guerrieri. All rights reserved.
//

import Foundation
import UIKit

private class MGDownload : NSObject {
    public private(set) var id : Int64?
    public private(set) var url : URL?
    public private(set) var localPath : String?
    public private(set) var size : Int64?
    
    init(url: String) {
        self.url = URL.init(string: url)!
    }
    
}

public class MGDownloadManager {
    public let shared = MGDownloadManager()
    
    private var simultaneusDownloads : Int?
    private var dataPath : String?
    private var objectsInDownload : [MGDownload] = []
    private var runningTasks : [URLSessionDownloadTask] = []
    private var alreadyDownloading : Bool = false
    private var downloadFolderUsedSpace : CUnsignedLongLong?
    private var freeSpaceForResources : CLongLong?
    private var deviceFreeSpace : CUnsignedLongLong?
    private var generalAvailableSpace : CUnsignedLongLong?
    
    private var downloadQueue : DispatchQueue = DispatchQueue.init(label: "mg.mgdownloadmanager.downloadQueue", attributes: .concurrent)
    private var commandQueue : DispatchQueue = DispatchQueue.init(label: "mg.mgdownloadmanager.commandQueue", attributes: .concurrent)
    
    init() {
    }

    public func pauseAllDownloads(){
        commandQueue.sync {
            for task in self.runningTasks {
                task.suspend()
            }
        }
    }
    
    public func resumeAllDownloads(){
        commandQueue.sync {
            for task in self.runningTasks {
                task.resume()
            }
        }
    }
    
    public func cancelAllDownloads(){
        commandQueue.sync {
            for task in self.runningTasks {
                task.cancel()
            }
        }
        self.runningTasks.removeAll()
    }
    

}
