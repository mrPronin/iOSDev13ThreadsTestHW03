//
//  RITStudent.m
//  13ThreadsTestHW01
//
//  Created by Aleksandr Pronin on 11.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITStudent.h"

@interface RITStudent ()

+ (dispatch_queue_t) studentsQueue;

@end

@implementation RITStudent

- (void) guessTheAnswer:(NSInteger) rightAnswer
      withRangeFromLeft:(NSInteger) left
                toRight:(NSInteger) right
         andResultBlock: (void(^)(NSString*, NSInteger, CGFloat)) block {
    
    __weak RITStudent* weakSelf = self;
    
    dispatch_async([RITStudent studentsQueue], ^{
        NSInteger answer = 0;
        
        double startTime = CACurrentMediaTime();
        
        while (!(answer==rightAnswer)) {
            answer = (arc4random() % (right - left) + left);
        }
        
        block(weakSelf.name, answer, CACurrentMediaTime() - startTime);
        
    });
    
}

+ (dispatch_queue_t) studentsQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t  task;
    dispatch_once(&task, ^{
        queue = dispatch_queue_create("rit.Students.Queue", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

@end
