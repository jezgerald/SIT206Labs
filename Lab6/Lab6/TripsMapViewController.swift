//
//  TripsMapViewController.swift
//  Lab5
//
//  Created by Jessica Fitzgerald on 29/4/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import MapKit

class TripsMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var tripsMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tripsMap.delegate = self
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
