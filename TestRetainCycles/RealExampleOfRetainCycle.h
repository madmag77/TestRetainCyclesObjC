//
//  RealExampleOfRetainCycle.h
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoolDataReceivingService : NSObject
- (void)getLastDataWithResultBlock:(void(^)(NSArray *data))resultBlock;

@end


@interface CoolDataDisplayViewController : NSObject
@property (strong, readwrite, nonatomic) CoolDataReceivingService *dataService;

- (void)startReceivingData;
@end
