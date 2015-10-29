//
//  NOSRecruitmentCell.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/16.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NOSReactiveView.h"

@interface NOSRecruitmentCell : UITableViewCell <NOSReactiveView>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *positionLabel;
@property (nonatomic, strong) UILabel *collegeLabel;
@property (nonatomic, strong) UILabel *viewTimesLabel;


@end
