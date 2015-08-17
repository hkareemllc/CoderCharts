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

-(void)viewDidAppear:(BOOL)animated {
    [self performSelector:@selector(segueToDeveloper) withObject:nil afterDelay:5.0];
}

- (void)segueToDeveloper {
    [self performSegueWithIdentifier:@"ClientToDeveloper" sender:self];
}

-(IBAction)unwindToClient:(UIStoryboardSegue *)segue {
    
}

@end
