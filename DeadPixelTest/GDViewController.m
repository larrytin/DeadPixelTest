//
//  GDViewController.m
//  DeadPixelTest
//
//  Created by dev on 13-3-6.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "GDViewController.h"

@interface GDViewController ()

@property(strong, nonatomic) NSArray *colors;
@property CMMotionManager *motionManager;

@end

// static int kAccelerationThreshold = 1.7;

@implementation GDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.colors = @[[UIColor colorWithRed:0 green:0 blue:0 alpha:1],
                  [UIColor colorWithRed:1 green:1 blue:1 alpha:1],
                  [UIColor colorWithRed:1 green:0 blue:0 alpha:1],
                  [UIColor colorWithRed:0 green:1 blue:0 alpha:1],
                  [UIColor colorWithRed:0 green:0 blue:1 alpha:1],
                  ];
  UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchBackground)];
  [self.view addGestureRecognizer:tapGestureRecognizer];
  
//  self.motionManager = [[CMMotionManager alloc] init];
//  self.motionManager.accelerometerUpdateInterval = 1.0/10.0;
//  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//  [self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
//    if(error) {
//      [self.motionManager stopAccelerometerUpdates];
//    } else {
//      CMAcceleration acceleration = accelerometerData.acceleration;
//      if(acceleration.x > kAccelerationThreshold || acceleration.y > kAccelerationThreshold || acceleration.z > kAccelerationThreshold){
//        [self switchBackground];
//      }
//    }
//  }];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  [self switchBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)switchBackground {
  int idx = [self.colors indexOfObject:self.view.backgroundColor];
  self.view.backgroundColor = [self.colors objectAtIndex: ++idx % self.colors.count];
}

- (BOOL)canBecomeFirstResponder
{
  return YES;
}


-(void)viewWillAppear:(BOOL)animated {
  [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(dismissTip) userInfo:nil repeats:NO];
}

-(void)dismissTip{
  self.tip.hidden = YES;
}

@end
