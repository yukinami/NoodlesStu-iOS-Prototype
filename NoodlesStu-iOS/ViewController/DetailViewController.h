//
//  DetailViewController.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/21.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

