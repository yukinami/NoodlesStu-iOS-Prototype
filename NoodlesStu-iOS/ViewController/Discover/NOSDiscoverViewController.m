//
//  NOSDiscoverViewController.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/22.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSDiscoverViewController.h"

@implementation NOSDiscoverViewController


- (void)viewDidLoad {

    _recruitmentViewController =
        [self.storyboard instantiateViewControllerWithIdentifier:@"RecruitmentListViewController"];

    _internshipViewController =
        [self.storyboard instantiateViewControllerWithIdentifier:@"InternshipListViewController"];
    
    [self setViewControllerForIndex:0];
}

- (void)setViewControllerForIndex:(NSInteger)index {
    [self setViewControllers:@[index == 0 ? self.recruitmentViewController : self.internshipViewController]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
}

#pragma mark - UISegmentController

- (IBAction)segmentedControlChanged:(UISegmentedControl *)sender {
    [self setViewControllerForIndex:sender.selectedSegmentIndex];
}


@end
