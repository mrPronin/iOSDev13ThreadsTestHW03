//
//  RITStudent.h
//  13ThreadsTestHW01
//
//  Created by Aleksandr Pronin on 11.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RITStudent : NSObject

@property (strong, nonatomic) NSString* name;

- (void) guessTheAnswer:(NSInteger) rightAnswer
      withRangeFromLeft:(NSInteger) left
                toRight:(NSInteger) right
         andResultBlock: (void(^)(NSString*, NSInteger, CGFloat)) block;

@end
