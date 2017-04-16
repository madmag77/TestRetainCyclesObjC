//
//  RetainCycleInBlocks.h
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassABlocks : NSObject
@property (readwrite, nonatomic, copy) void (^callBackToClassB)();

@end

@interface ClassBBlocks : NSObject
@property (strong, readwrite, nonatomic) ClassABlocks *classA;
@property (strong, readwrite, nonatomic) NSString *propertyForRetainCycle;
- (id)init;
@end
