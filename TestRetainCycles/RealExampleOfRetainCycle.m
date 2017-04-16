//
//  RealExampleOfRetainCycle.m
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import "RealExampleOfRetainCycle.h"

@implementation CoolDataReceivingService {
    void (^dataCallback)(NSArray *data);
}

- (void)getLastDataWithResultBlock:(void(^)(NSArray *data))resultBlock {
    dataCallback = resultBlock;
    //making some async calls to REST through lib where service is delegate - simulated with dispatch
    dispatch_async(dispatch_get_main_queue(), ^{
        [self receiveTheData:[NSArray new]];
    });
}

#pragma mark - Methods AsyncLibDelegate
- (void)receiveTheData:(NSArray *)data {
    if (dataCallback) {
        dataCallback(data);
    }
    //next line is the crucial for breaking of retain cycle here
    //dataCallback = nil;
}
@end

@implementation CoolDataDisplayViewController {
    NSMutableArray *data;
}

- (id)init {
    self = [super init];
    if (self) {
        self.dataService = [CoolDataReceivingService new];
        data = [NSMutableArray new];
    }
    return self;
}

- (void)startReceivingData {
    [self.dataService getLastDataWithResultBlock:^(NSArray *dataFromService) {
        [data addObjectsFromArray:dataFromService];
    }];
}
@end
