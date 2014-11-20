//
//  TBRTimer.h
//  TBRTimerExample
//
//  Created by Luciano Marisi on 20/11/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBRTimer : NSObject

/**
 *  Creates a GCD based timer to run on the main queue
 *
 *  @param timeInterval The number of seconds between firings of the timer
 *  @param block        The block to execute
 *
 *  @return A new GCDTimer object, configured according to the specified parameters.
 */
+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                               block:(void (^)())block;

/**
 *  Creates a GCD based timer
 *
 *  @param queue        The queue to run the timer on
 *  @param timeInterval The number of seconds between firings of the timer
 *  @param block        The block to execute
 *
 *  @return A new GCDTimer object, configured according to the specified parameters.
 */
+ (id)scheduledTimerOnQueue:(dispatch_queue_t)queue
               timeInterval:(NSTimeInterval)timeInterval
                      block:(void (^)())block;

/**
 *  Invalidates the timer
 */
- (void)invalidate;

@end
