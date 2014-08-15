//
//  ViewController.m
//  LocationsWithPins
//
//  Created by John Malloy on 5/16/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    
    MKPointAnnotation * annotation1 = [[MKPointAnnotation alloc] init];
    annotation1.title = @"Miami";
    annotation1.subtitle = @"Annotation1";
    annotation1.coordinate = CLLocationCoordinate2DMake(25.802, -80.132);
    
    MKPointAnnotation * annotation2 = [[MKPointAnnotation alloc] init];
    annotation2.title = @"Denver";
    annotation2.subtitle = @"Annotation 2";
    annotation2.coordinate = CLLocationCoordinate2DMake(39.733, -105.018);
    
    MKPointAnnotation * annotation3 = [[MKPointAnnotation alloc] init];
    annotation3.title = @"Chicago";
    annotation3.subtitle = @"Sweet Home Chicago";
    annotation3.coordinate = CLLocationCoordinate2DMake(41.8782, -87.6297);
    
    [self.mapView addAnnotation:annotation1];
    [self.mapView addAnnotation:annotation2];
    [self.mapView addAnnotation:annotation3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //Don't create annotation views for the user location
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        //Create and return our own annotation view here
        
        static NSString * userPinAnnotationId = @"userPinAnnotation";
        
        //Create an annotation view, but reuse a cached one if available
        MKPinAnnotationView * annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:userPinAnnotationId];
        if (annotationView)
        {
            // Cached View found. It'll have the pin color set but not annotation
            annotationView.annotation = annotation;
        }
        else
        {
            //No cached views were available, create a new one
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:userPinAnnotationId];
            
            //Purple indicates user defined pin
            annotationView.pinColor = MKPinAnnotationColorPurple;
        }
        return annotationView;
    }
    
    
    //Returning nil will result in a default annotation view being used
    return nil;
}

@end
