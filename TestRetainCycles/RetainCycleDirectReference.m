//
//  RetainCycleDirectReference.m
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import "RetainCycleDirectReference.h"

@implementation ClassADirect

@end

@implementation ClassBDirect
- (id)init {
    self = [super init];
    if (self) {
        self.classA = [ClassADirect new];
        self.classA.classB = self;
    }
    return self;
}
@end
