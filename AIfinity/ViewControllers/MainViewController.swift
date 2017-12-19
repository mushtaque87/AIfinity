//
//  ViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit
import SlideMenuControllerSwift
import AVKit
import MediaPlayer

class MainViewController: UIViewController{

    @IBOutlet weak var liveEventTableView: UITableView!
    
    var searchActive : Bool = false
    var searchString = ""
    var newSearchString  = ""

    var maxCount = 0
    var searchMaxCount = 0
    var nextPageToken:NSString = ""
    @IBOutlet weak var activityindicator : UIActivityIndicatorView!
    var eventData : NSMutableArray = []
    
    let eventType: NSArray = ["Dancing","Eating","Fighting","Not on seat","Playing","Running","Shouting","Sleeping","Studing"]
    let eventDate: NSArray  = ["21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17"]
    let eventTime: NSArray  = ["12:00","02:00","15:00","09:00","11:00","10:00","12:00","11:00","15:00"]
    let eventCount: NSArray  = [2,3,4,5,1,7,3,9,13]

   

    
   //"channelId": "UCooe8FmsQSI-Hs70Hz53fxg",
    
    
   //#define youTubeURL [NSURL URLWithString: @"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLNngVRDXb8azV_H7ZkX6cl6RCdSF6_trz&key=AIzaSyCOMLqATGL5jS_UAp79mBkpzf-lN58y0R0&maxResults=20"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.registerCellNib(DataTableViewCell.self)
      //  startHttpConnection();
        self.definesPresentationContext = true
        
        let searchbar : UISearchBar = UISearchBar();
       // searchbar.delegate = self
        searchbar.placeholder = "Search the whole channel"
        searchbar.returnKeyType = UIReturnKeyType.search
        self.navigationItem.titleView =  searchbar
        self.definesPresentationContext = true;
        
        
        for count in 0..<eventType.count
        {
            let event = Event()
            event.event = eventType[count] as? String
            event.date = eventDate[count] as? String
            event.time = eventTime[count] as? String
            event.eventCount = eventCount[count] as? Int
            eventData.add(event)
        }
        
        
         self.liveEventTableView.register(UINib(nibName: "LiveDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "LiveDetailCell")
        
        
    
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.setNavigationBarItem()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
       
        let playerItem = AVPlayerItem.init(url: URL.init(string:"rtsp://abhay:Abhay2134@192.168.9.250:554/profile2/media.smp")!)
       // http://192.168.9.18/zm/cgi-bin/zms?scale=100&width=640&height=480&mode=jpeg&maxfps=30&buffer=1000&monitor=2&connkey=635274&rand=1511695259
       // http://192.168.9.250/stw-cgi/video.cgi?msubmenu=stream&action=view&Profile=1
        let player = AVPlayer.init(playerItem: playerItem)
        //player.addObserver(self, forKeyPath: "status", options: 0, context: AVPlayerStatus)
        
        
        
        
//       // var streamPlayer : MPMoviePlayerController =  MPMoviePlayerController(contentURL: NSURL(string:"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"))
//        let url = URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
//        let streamPlayer = MPMoviePlayerController(contentURL: url)
//        streamPlayer?.isFullscreen = true
//        // Play the movie!
//        streamPlayer?.play()
        
        
        
        
    }
}

extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = liveEventTableView.dequeueReusableCell(withIdentifier: "LiveDetailCell", for: indexPath)
        let cell = liveEventTableView.dequeueReusableCell(withIdentifier: "LiveDetailCell", for: indexPath) as! LiveDetailsTableViewCell
        
        //let cell = self.liveEventTableView.dequeueReusableCell(withIdentifier: "LiveDetailCell") as! LiveDetailsTableViewCell
        let event: Event = eventData[indexPath.row] as! Event
        
        cell.eventType.text = event.event
        cell.eventDate.text = event.date
        cell.eventTime.text = event.time
        cell.eventCount.text = "\(event.eventCount ?? 0)"
        cell.eventlogo.image = UIImage(named:event.event!)
        return cell
    }
    
}

extension MainViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
