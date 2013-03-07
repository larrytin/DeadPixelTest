//
//  GDViewController.m
//  DeadPixelTest
//
//  Created by dev on 13-3-6.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import "GDViewController.h"

@interface GDViewController ()

@property(strong, nonatomic) NSArray *colors;

@end

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


-(void)viewWillAppear:(BOOL)animated {
  [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(dismissTip) userInfo:nil repeats:NO];
}

-(void)dismissTip{
  self.tip.hidden = YES;
}

@end
