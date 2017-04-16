//
//  ViewController.m
//  TestRetainCycles
//
//  Created by Artem Goncharov on 13/04/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

#import "ViewController.h"
#import "RetainCycleDirectReference.h"
#import "RetainCycleInBlocks.h"
#import "RetainCyclesInBlocksOneMore.h"
#import "RealExampleOfRetainCycle.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 }

- (IBAction)directTap:(UIButton *)sender {
    sender.enabled = false;
    ClassBDirect *classB = [ClassBDirect new];
}

- (IBAction)blockTap:(UIButton *)sender {
    sender.enabled = false;
    ClassBBlocks *classB = [ClassBBlocks new];
}

- (IBAction)block2Tap:(UIButton *)sender {
    sender.enabled = false;
    ClassBBlocksOneMore *classB = [ClassBBlocksOneMore new];
}

- (IBAction)realLifeTap:(UIButton *)sender {
    sender.enabled = false;
    CoolDataDisplayViewController *vc = [CoolDataDisplayViewController new];
    [vc startReceivingData];
}

@end
