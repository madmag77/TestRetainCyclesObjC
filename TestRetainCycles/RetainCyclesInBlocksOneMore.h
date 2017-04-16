//
//  RetainCyclesInBlocksOneMore.h
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassABlocksOneMore : NSObject
@property (readwrite, nonatomic, copy) void (^callBackToClassB)();

@end

@interface ClassBBlocksOneMore : NSObject
@property (strong, readwrite, nonatomic) ClassABlocksOneMore *classA;
- (id)init;
@end
