TBRTimer
=======================

[![Build Status](https://travis-ci.org/techbrewers/TBRTimer.png)](https://travis-ci.org/techbrewers/TBRTimer)

Objective-C wrapper of a GCD based timer


Installation
-------------

* Add the class `TBRTimer` class to your project

Example
-----------------------
```objc
//Start timer on main queue
TBRTimer *mainQueueTimer = [TBRTimer scheduledTimerWithTimeInterval:5.0
                                                   block:^{
                                                     NSLog(@"TBRTimer fired on mainqueue");
                                                   }];
//Start timer on background queue
TBRTimer *backgroundQueueTimer = [TBRTimer scheduledTimerOnQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                                                  timeInterval:5.0
                                                         block:^{
                                                           NSLog(@"TBRTimer fired on background queue");
                                                         }];

//Stop timer
[mainQueueTimer invalidate];
```

License
==================

The MIT License (MIT)

Copyright (c) 2014 TechBrewers LTD.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.