//
//  TBRTimer.m
//  TBRTimerExample
//
//  Created by Luciano Marisi on 20/11/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRTimer.h"


@interface TBRTimer ()

@property (nonatomic, strong) dispatch_source_t gcdTimer;

@end

@implementation TBRTimer

#pragma mark - Public methods

+ (id)scheduledTimerOnQueue:(dispatch_queue_t)queue
               timeInterval:(NSTimeInterval)timeInterval
                      block:(void (^)())block
{
  TBRTimer *tbrTimer = [TBRTimer new];
  
  tbrTimer.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
  dispatch_source_set_timer(tbrTimer.gcdTimer, DISPATCH_TIME_NOW, timeInterval * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
  dispatch_source_set_event_handler(tbrTimer.gcdTimer, ^{
    block();
  });
  
  [tbrTimer startTimerAfter:timeInterval];
  
  return tbrTimer;
}

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                               block:(void (^)())block
{
  return [self.class scheduledTimerOnQueue:dispatch_get_main_queue()
                              timeInterval:timeInterval
                                     block:block];
}

- (void)invalidate
{
  if (self.gcdTimer) {
    dispatch_source_cancel(self.gcdTimer);
    self.gcdTimer = nil;
  }
}

#pragma mark - Private methods

- (void)startTimerAfter:(NSTimeInterval)timeInterval
{
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    if (self.gcdTimer) {
      dispatch_resume(self.gcdTimer);
    }
  });
}

@end
