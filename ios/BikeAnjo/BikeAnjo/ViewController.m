//
//  ViewController.m
//  BikeAnjo
//
//  Created by Gabriel Pereira on 30/08/13.
//  Copyright (c) 2013 Gabriel Bernardo Pereira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

@synthesize label;
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    label.text = @"Peça ajuda agora.";
    [mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading];

//    MKCoordinateRegion myRegion = MKCoordinateRegionMakeWithDistance(delegate.locationManager.location.coordinate, 500,500);
//    [self.mapView setRegion:myRegion animated:YES];
//    [self.mapView regionThatFits:myRegion];
    
    [mapView setShowsUserLocation:YES];
    [mapView setZoomEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)callHelp:(UIButton *)sender {
    NSLog(@"help.....");
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = @"RoutePinAnnotation";
    MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc]
                                    initWithAnnotation:annotation reuseIdentifier:identifier];
    pinView.animatesDrop=NO;
    pinView.canShowCallout=YES;
    
//    if(mapView.userLocation==annotation){
//        mapView.userLocation.title=NSLocalizedString(@"Estou Aqui", @"Estou Aqui.");
//        mapView.userLocation.subtitle= [NSString stringWithFormat:@"%@",delegate.localAddress];
//        return nil;
//    }
    
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    } else {
        pinView.pinColor = MKPinAnnotationColorGreen;
        
        //        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        //        [rightButton addTarget:self
        //                        action:@selector(clicaMapa)
        //              forControlEvents:UIControlEventTouchUpInside];
        //        pinView.rightCalloutAccessoryView = rightButton;
    }
    
    //    UIImageView *profileIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pin.png"]];
    //    pinView.leftCalloutAccessoryView = profileIconView;
    
    return pinView;
}

//- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
//{
//    //    MKAnnotationView *annotationView = [views objectAtIndex:0];
//    //    id<MKAnnotation> mp = [annotationView annotation];
//    //    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate] ,250,250);
//    //
//    //    [mv setRegion:region animated:YES];
//}

//-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
//{
//    NSLog(@"%@", @"didSelectAnnotationView");
//    id *annotation = view.annotation;
//    if(![annotation isKindOfClass:[MKUserLocation class]])
//    {
//        //Your code
//    }

//    self.selectedBeach = view.annotation.title;

//    NSLog(@"Selecte: %@",self.selectedBeach);
//}
// When a map annotation point is added, zoom to it (1500 range)
//- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
//{
//NSLog(@"%@", @"didAddAnnotationViews");

//    NSLog(@"%d", self.mapView.annotations.count);
//
//    MKAnnotationView *annotationView = [views objectAtIndex:0];
//      id <MKAnnotation> mp = [annotationView annotation];
//      MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 500, 500);
//      [mv setRegion:region animated:YES];
//[mv selectAnnotation:mp animated:YES];

//}

- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat:%f, long:%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
}
@end
