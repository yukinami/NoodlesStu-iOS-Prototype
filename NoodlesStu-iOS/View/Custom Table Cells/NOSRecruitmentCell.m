//
//  NOSRecruitmentCell.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/16.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSRecruitmentCell.h"
#import "NOSConstants.h"
#import "UIColor+HEX.h"

@implementation NOSRecruitmentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonSetup];
    }
    
    [UIStackView new];
    return self;
}

- (void)awakeFromNib {
    [self commonSetup];
}

- (void) commonSetup {
    UIView *superview = self.contentView;

    UIEdgeInsets padding = UIEdgeInsetsMake(12, 10, 12, 10);
    CGFloat verticalMargin = 9.f;

    self.titleLabel = [UILabel new];
    [self.titleLabel setFont: kFontBold16];
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.top).with.offset(padding.top);
        make.left.equalTo(superview.left).with.offset(padding.left);
    }];
    
    
    self.dateLabel = [UILabel new];
    [self.dateLabel setFont:kFont12];
    [self.dateLabel setTextColor: kColorBlue];
    
    [self.contentView addSubview:self.dateLabel];
    [self.dateLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.left);
        make.top.equalTo(self.titleLabel.bottom).with.offset(verticalMargin);
    }];
    
    
    self.positionLabel = [UILabel new];
    [self.positionLabel setFont:kFont10];
    [self.positionLabel setTextColor:kColorGray];
    
    [self.contentView addSubview:self.positionLabel];
    [self.positionLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.left);
        make.top.equalTo(self.dateLabel.bottom).with.offset(verticalMargin);
        make.bottom.equalTo(superview.bottom).with.offset(-padding.bottom);
    }];
    
    
    self.collegeLabel = [UILabel new];
    [self.collegeLabel setFont:kFont12];
    [self.collegeLabel setTextColor: kColorBlue];
    
    [self.contentView addSubview:self.collegeLabel];
    [self.collegeLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLabel.top);
        make.right.equalTo(superview.right).with.offset(-padding.right);
    }];
    
    
    self.viewTimesLabel = [UILabel new];
    [self.viewTimesLabel setFont:kFont10];
    [self.viewTimesLabel setTextColor:kColorGray];
    
    [self.contentView addSubview:self.viewTimesLabel];
    [self.viewTimesLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.positionLabel.top);
        make.right.equalTo(self.collegeLabel.right);
    }];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
