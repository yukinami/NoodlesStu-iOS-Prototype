//
//  NOSRecruitmentListViewController.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/9.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSRecruitmentListViewController.h"

#import <LinqToObjectiveC/NSArray+LinqExtensions.h>
#import "NOSRecruitmentCell.h"
#import "NOSTableViewBindingHelper.h"
#import "NOSRecruitmentCellViewModel.h"

static NSString *const NOSRecruitmentCellIdentifier = @"NOSRecruitmentCell";

@interface NOSRecruitmentListViewController ()

@end

@implementation NOSRecruitmentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _viewModel = [[NOSRecruitmentListViewModel alloc] init];

    // Binding TableView
    [NOSTableViewBindingHelper bindingHelperForTableView:self.tableView
                                           sourceSignal:RACObserve(self.viewModel, recruitments)
                                       selectionCommand:nil
                                           templateCell:[NOSRecruitmentCell new]];

    // Initialize refresh control
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(loadRecruitments) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;

    [self.viewModel.executeFind.executing subscribeNext:^(id x) {
        BOOL executing = [(NSNumber *)x boolValue];
        if (executing) {
            [self.refreshControl beginRefreshing];
        }

        if (!executing && self.refreshControl.refreshing) {
            [self.refreshControl endRefreshing];
        }
    }];

    [self.viewModel.findErrors subscribeNext:^(NSError *error) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An Error Has Occurred"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
#pragma clang diagnostic pop
    }];

    [self loadRecruitments];
}

- (void)loadRecruitments {
    [self.viewModel.executeFind execute:nil];
}

@end
