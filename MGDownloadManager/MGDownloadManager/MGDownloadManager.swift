//
//  MGDownloadManager.swift
//  MGDownloadManager
//
//  Created by Marco Guerrieri on 08/04/18.
//  Copyright © 2018 Marco Guerrieri. All rights reserved.
//

import Foundation
import UIKit

public class MGDownload : NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    
    public private(set) var id : Int64?
    public private(set) var url : URL
    public private(set) var localPath : String
    public private(set) var size : Int64?
    public private(set) var error : String?
    
    fileprivate var task : URLSessionDownloadTask?
    fileprivate var data : Data?
    fileprivate var session : URLSession?
    fileprivate var configuration : URLSessionConfiguration
    fileprivate var queue : OperationQueue
    
    init(url: URL, localPath: String, session: URLSession, configuration:
        URLSessionConfiguration, queue: OperationQueue) {
        self.url = url
        self.localPath = localPath
        self.configuration = configuration
        self.queue = queue
        super.init()
        self.session = URLSession.init(configuration: configuration, delegate: self, delegateQueue: queue)
        //TODO  shared session created by manager could be better
    }
    
    public func start() {
        self.task?.resume()
    }
    
    public func restart() {
        self.task?.cancel()
        self.data = nil
        self.task?.resume()
    }

    private func retry() {
        self.task?.cancel()
        self.task = nil
        if let data = self.data {
            // TODO check for ios 10 problem
            // https://stackoverflow.com/questions/39346231/resume-nsurlsession-on-ios10
            self.task = self.session!.downloadTask(withResumeData: data)
        }
        else {
            self.task = self.session!.downloadTask(with: url)
        }
        self.task?.resume()
    }
    
    public func pause() {
        self.task?.suspend()
    }
    
    public func cancel() {
        self.task?.cancel()
    }
    
    private func cancelTemporary() {
        self.task?.cancel(byProducingResumeData: { (data) in
            self.data = data
        })
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
    }
}

public class MGDownloadManager {
    public let shared = MGDownloadManager()
    
    private var downloadPath : String?
    
    private var simultaneusDownloads : Int?
    private var scheduledDownloads : [MGDownload] = []
    private var runningDownloads : [MGDownload] = []
    private var completedDownloads : [MGDownload] = []
    private var alreadyDownloading : Bool = false
    
    private var downloadFolderUsedSpace : CUnsignedLongLong?
    private var freeSpaceForResources : CLongLong?
    private var deviceFreeSpace : CUnsignedLongLong?
    private var generalAvailableSpace : CUnsignedLongLong?
    
    private var downloadQueue : DispatchQueue = DispatchQueue.init(label: "mg.mgdownloadmanager.downloadQueue", attributes: .concurrent)
    private var commandQueue : DispatchQueue = DispatchQueue.init(label: "mg.mgdownloadmanager.commandQueue", attributes: .concurrent)
    
    init() {
    }

    public func pauseAllDownloads() {
        commandQueue.sync {
            for download in self.runningDownloads {
                download.pause()
            }
        }
    }
    
    public func resumeAllDownloads() {
        commandQueue.sync {
            for download in self.runningDownloads {
                download.task?.resume()
            }
        }
    }
    
    public func cancelAllDownloads() {
        commandQueue.sync {
            for download in self.runningDownloads {
                download.cancel()
            }
            self.runningDownloads.removeAll()
        }
    }

    public func newDownload(startImmediatly: Bool? = false, addToQueue: Bool? = false) -> MGDownload? {
        var download : MGDownload?
        return download
    }
    
    public func addDownloadInQueue(download: MGDownload){
        
    }
    
    
    


}
