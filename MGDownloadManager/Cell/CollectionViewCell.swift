//
//  CollectionViewCell.swift
//  MGDownloadManager
//
//  Created by Marco Guerrieri on 11/06/18.
//  Copyright © 2018 Marco Guerrieri. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var completionLbl: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    
    public var download : MGDownload? {
        didSet{
            if download != nil {
                self.createCellFor(download: download!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func createCellFor(download: MGDownload){
        self.nameLbl.text = download.fileName ?? ""
        self.statusLbl.text = "\(download.status)"
        self.sizeLbl.text = "\(download.size)"
        self.completionLbl.text = "\(download.completion)"
        
        self.startBtn.isEnabled = true
        self.pauseBtn.isEnabled = false
        self.cancelBtn.isEnabled = false
        self.restartBtn.isEnabled = true
        self.removeBtn.isEnabled = true
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
        print("START \(self.download?.fileName ?? "")")
        download?.start()
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
        print("PAUSE \(self.download?.fileName ?? "")")
        download?.pause()
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        print("CANCEL \(self.download?.fileName ?? "")")
        download?.cancel()
    }
    
    @IBAction func restartBtnPressed(_ sender: Any) {
        print("RESTART \(self.download?.fileName ?? "")")
        download?.restart()
    }
    
    @IBAction func removeBtnPressed(_ sender: Any) {
        print("REMOVE \(self.download?.fileName ?? "")")
        download?.remove()
    }
}
