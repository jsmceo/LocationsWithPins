//
//  ViewController.h
//  LocationsWithPins
//
//  Created by John Malloy on 5/16/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
