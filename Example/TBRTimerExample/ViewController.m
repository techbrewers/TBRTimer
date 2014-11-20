//
//  ViewController.m
//  TBRTimerExample
//
//  Created by Luciano Marisi on 20/11/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "ViewController.h"
#import "TBRTimer.h"

static const NSTimeInterval timeInterval = 3.0;

@interface ViewController ()

@property (nonatomic, strong) TBRTimer *timer;

@end

@implementation ViewController

- (IBAction)startTimer:(UIButton *)sender
{
  self.timer = [TBRTimer scheduledTimerWithTimeInterval:timeInterval
                                                  block:^{
                                                    NSLog(@"TBRTimer fired");
                                                  }];
}

- (IBAction)stopTimer:(UIButton *)sender
{
  [self.timer invalidate];
}

@end