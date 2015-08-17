//
//  DeveloperViewController.m
//  CoderCharts
//
//  Created by Husein Kareem on 8/17/15.
//  Copyright (c) 2015 Husein Kareem. All rights reserved.
//

#import "DeveloperViewController.h"

@interface DeveloperViewController ()

@end

@implementation DeveloperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(unwindToClient) withObject:nil afterDelay:5.0];
}
- (void)unwindToClient {
    [self performSegueWithIdentifier:@"DeveloperToClient" sender:self];
}


@end
