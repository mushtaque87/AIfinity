                                                                                                                                                                                                                                                                                                                                                                                  //
//  FirstTab_ViewController.swift
//  AI
//
//  Created by Philips on 17/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import AVKit

class FirstTab_ViewController: UIViewController {

    @IBOutlet weak var liveEventTableView: UITableView!
    var eventData : NSMutableArray = []
    
    let eventType: NSArray = ["Dancing","Eating","Fighting","Not on seat","Playing","Running","Shouting","Sleeping","Studing"]
    let eventDate: NSArray  = ["21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17","21/05/17"]
    let eventTime: NSArray  = ["12:00","02:00","15:00","09:00","11:00","10:00","12:00","11:00","15:00"]
    let eventCount: NSArray  = [2,3,4,5,1,7,3,9,13]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //liveEventTableView.delegate = self
        //self.liveEventTableView.register(LiveDetailsTableViewCell.self, forCellReuseIdentifier: "LiveDetailCell")
        
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
    

extension FirstTab_ViewController : UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 65
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            
          //  let player = AVPlayer(url: URL(string: "http://avikam.com/wp-content/uploads/2016/09/SpeechRecognitionTutorial.mp4")!)
          /* let player = AVPlayer(url: URL(string: "rtsp://abhay:Abhay2134@192.168.9.250:554/profile2/media.smp")!)
            //http://192.168.9.18/zm/cgi-bin/zms?scale=100&width=640&height=480&mode=jpeg&maxfps=30&buffer=1000&monitor=2&connkey=635274&rand=1511695259
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.present(playerController, animated: true) {
                player.play()
                */
                
                
                
                let videoURL = NSURL(string: "rtsp://abhay:Abhay2134@192.168.9.250:554/profile2/media.smp")
               let avPlayer = AVPlayer(url: videoURL! as URL)
                let playerLayer = AVPlayerLayer(player: avPlayer)
                playerLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 3.0 / 4.0)
                self.view.layer.addSublayer(playerLayer)
                avPlayer.play()
            }
            
        }
                                                                                                                                                                                                                                                                                                                                                                                  
    
extension FirstTab_ViewController : UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return eventData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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


