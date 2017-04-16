//
//  RetainCycleInBlocks.m
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import "RetainCycleInBlocks.h"

@implementation ClassABlocks

@end

@implementation ClassBBlocks
- (id)init {
    self = [super init];
    if (self) {
        self.classA = [ClassABlocks new];
        //In order to break retain cycle we need to weakify self
        //__weak ClassBBlocks *weakSelf = self;

        self.classA.callBackToClassB = ^() {
            //and use weakSelf in the next line instead of self (additionally you can strongify weak self to make sure of consisitency):
            self.propertyForRetainCycle = @"retain cycle";
        };
    }
    return self;
}
@end
