//
//  ViewController.swift
//  MGDownloadManager
//
//  Created by Marco Guerrieri on 30/05/18.
//  Copyright © 2018 Marco Guerrieri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MGCollectionViewProtocol {

    @IBOutlet weak var collectionView: MGCollectionView!
    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var inDownloadLbl: UILabel!
    @IBOutlet weak var completedLbl: UILabel!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var stoppedLbl: UILabel!
    @IBOutlet weak var canceledLbl: UILabel!
    
    private var downloads : [MGDownload] = []
    private var downloadManager : MGDownloadManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloads = generateArrayOfDownloads()
        downloadManager = MGDownloadManager.init()
        collectionView.protocolDelegate = self
        collectionView.allowsSelection = false
        collectionView.cellNib = UINib.init(nibName: "CollectionViewCell", bundle: self.nibBundle)
        collectionView.cellIdentifier = "CollectionViewCell"
        collectionView.initWithCellFixedNumberOf((iphonePortrait: 1, iphoneLandscape: 2, ipadPortrait: 2, ipadLandscape: 3), cellProportions: (width: 2, height: 1), andSpacing: (top: 4, left: 4, bottom: 4, right: 4))
    }

    
    func collectionViewDisplayItem(_ item: Any, inCell cell: UICollectionViewCell) -> UICollectionViewCell {
        if let cell = cell as? CollectionViewCell, let download = item as? MGDownload {
            cell.download = download
        }
        return cell
    }
    
    func collectionViewRequestDataForPage(page: Int, valuesCallback: @escaping ([Any]?) -> ()) {
        valuesCallback(downloads)
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
        print("START ALL")
        downloadManager?.startAllDownloads()
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
        print("PAUSE ALL")
        downloadManager?.pauseAllDownloads()
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        print("CANCEL ALL")
        downloadManager?.cancelAllDownloads()
    }
    
    @IBAction func restartBtnPressed(_ sender: Any) {
        print("RESTART ALL")
        downloadManager?.restartAllDownloads()
    }
    
    @IBAction func removeBtnPressed(_ sender: Any) {
        print("REMOVE ALL")
        downloadManager?.removeAllDownloads()
    }

}

extension ViewController{
    func generateArrayOfDownloads() -> [MGDownload] {
        let download1 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com/5MB.zip", fileName: "ipv4_80_5MB.zip")
        let download2 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:81/5MB.zip", fileName: "ipv4_81_5MB.zip")
        let download3 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:8080/5MB.zip", fileName: "ipv4_8080_5MB.zip")
        let download4 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com/5MB.zip", fileName: "ipv6_80_5MB.zip")
        let download5 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:81/5MB.zip", fileName: "ipv6_81_5MB.zip")
        let download6 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:8080/5MB.zip", fileName: "ipv6_8080_5MB.zip")
        
        let download7 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com/10MB.zip", fileName: "ipv4_80_10MB.zip")
        let download8 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:81/10MB.zip", fileName: "ipv4_81_10MB.zip")
        let download9 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:8080/10MB.zip", fileName: "ipv4_8080_10MB.zip")
        let download10 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com/10MB.zip", fileName: "ipv6_80_10MB.zip")
        let download11 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:81/10MB.zip", fileName: "ipv6_81_10MB.zip")
        let download12 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:8080/10MB.zip", fileName: "ipv6_8080_10MB.zip")
        
        let download13 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com/20MB.zip", fileName: "ipv4_80_20MB.zip")
        let download14 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:81/20MB.zip", fileName: "ipv4_81_20MB.zip")
        let download15 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:8080/20MB.zip", fileName: "ipv4_8080_20MB.zip")
        let download16 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com/20MB.zip", fileName: "ipv6_80_20MB.zip")
        let download17 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:81/20MB.zip", fileName: "ipv6_81_20MB.zip")
        let download18 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:8080/20MB.zip", fileName: "ipv6_8080_20MB.zip")
        
        let download19 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com/50MB.zip", fileName: "ipv4_80_50MB.zip")
        let download20 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:81/50MB.zip", fileName: "ipv4_81_50MB.zip")
        let download21 = MGDownload.init(url: "http://ipv4.download.thinkbroadband.com:8080/50MB.zip", fileName: "ipv4_8080_50MB.zip")
        let download22 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com/50MB.zip", fileName: "ipv6_80_50MB.zip")
        let download23 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:81/50MB.zip", fileName: "ipv6_81_50MB.zip")
        let download24 = MGDownload.init(url: "http://ipv6.download.thinkbroadband.com:8080/50MB.zip", fileName: "ipv6_8080_50MB.zip")
        
        
        return [download1,
                download2,
                download3,
                download4,
                download5,
                download6,
                download7,
                download8,
                download9,
                download10,
                download11,
                download12,
                download13,
                download14,
                download15,
                download16,
                download17,
                download18,
                download19,
                download20,
                download21,
                download22,
                download23,
                download24]
    }
}
