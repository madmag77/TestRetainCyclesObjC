//
//  RetainCyclesInBlocksOneMore.m
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import "RetainCyclesInBlocksOneMore.h"

@implementation ClassABlocksOneMore

@end

@implementation ClassBBlocksOneMore {
    NSString *ivarForRetainCycle;
}

- (id)init {
    self = [super init];
    if (self) {
        self.classA = [ClassABlocksOneMore new];
        //In order to break retain cycle we need to weakify self:
       // __weak ClassBBlocksOneMore *weakSelf = self;
        self.classA.callBackToClassB = ^() {
            //strongify self - you sshould do it, because direct access to ivar requires non nil object:
            //__strong ClassBBlocksOneMore *strongSelf = weakSelf;
            //use -> to direct access to ivar:
            //strongSelf->ivarForRetainCycle = @"retain cycles";
            ivarForRetainCycle = @"retain cycles";
        };
    }
    return self;
}
@end
