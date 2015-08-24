//
//  ClientViewController.m
//  CoderCharts
//
//  Created by Husein Kareem on 8/14/15.
//  Copyright (c) 2015 Husein Kareem. All rights reserved.
//

#import "ClientViewController.h"

@interface ClientViewController ()

@property (weak, nonatomic) IBOutlet UIView *expectedView;
@property (weak, nonatomic) IBOutlet UIView *actualView;
@property (weak, nonatomic) IBOutlet UIView *hoursView;
@end

@implementation ClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initial view setup
    self.expectedView.layer.cornerRadius = 2.0;
    self.actualView.layer.cornerRadius = 2.0;
    self.hoursView.layer.cornerRadius = 2.0;
}

-(NSArray *)getEstimateGraphPoints {
    NSString *urlString = [NSString stringWithFormat:@"http://coderexp-api.herokuapp.com/api/v1/project_estimate_graph_points"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableArray *xPoints = [NSMutableArray new];
    NSMutableArray *yPoints = [NSMutableArray new];
    NSHTTPURLResponse *responseCode = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if (!error) {
       NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
       NSArray *projects = [jsonDictionary objectForKey:@"projects"];

       NSArray *totalPoints = projects.firstObject;
       NSDictionary *pointsDictionary = totalPoints.lastObject;
       NSArray *points = [pointsDictionary objectForKey:@"points"];
       for (NSDictionary *coordinates in points) {
           NSString *xPoint = [coordinates objectForKey:@"x_point"];
           NSNumber *yPoint = [coordinates objectForKey:@"y_point"];
           if (xPoint != nil && yPoint != nil) {
               [xPoints addObject:xPoint];
               [yPoints addObject:yPoint];
           }
           NSArray *estimatedPoints = @[xPoints, yPoints];
           return estimatedPoints;
       }
    } else {
       NSLog(@"%@", [error localizedDescription]);
    }
    
    return nil;
}


@end
