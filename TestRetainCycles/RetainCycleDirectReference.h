//
//  RetainCycleDirectReference.h
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClassBDirect;

@interface ClassADirect : NSObject
@property (strong, readwrite, nonatomic) ClassBDirect *classB;

@end

@interface ClassBDirect : NSObject
@property (strong, readwrite, nonatomic) ClassADirect *classA;
- (id)init;
@end
