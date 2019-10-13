//
//  PhotosCollectionViewController.swift
//  ImageGallery
//
//  Created by Ashu Abdul on 7/8/18.
//  Copyright © 2018 Ashu Abdul. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    let photos = ["gato1", "gato2", "gato3", "gato4", "gato5"]
    let labels = ["Live stream1", "Live stream2", "Live stream3", "Live stream4", "Live stream5"]
    let urlList = ["http://120.126.16.100:8080/hls/livestream/index.m3u8",
                  "http://120.126.16.100:8080/hls/livestream2/index.m3u8",
                  "http://120.126.16.97:8080/hls/livestream3/index.m3u8",
                  "http://120.126.16.97:8080/hls/livestream4/index.m3u8",
                  "http://120.126.16.100:8080/hls/livestream5/index.m3u8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        cell.imageView.image = UIImage(named: photos[indexPath.row])
        cell.imageLabel.text = labels[indexPath.row]
        cell.url = urlList[indexPath.row]

        return cell
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "liveStream", sender: indexPath)
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let detailViewController = segue.destination as? AVPlayerViewController {
        let selectedIndexPath = sender as? IndexPath
        let urlString = urlList[(selectedIndexPath?.row)!]
        
      
    let url = URL(string: urlString)
              if let url = url {
               detailViewController.player = AVPlayer(url: url)
               detailViewController.player?.play()
               }
            }
    
    }
}

