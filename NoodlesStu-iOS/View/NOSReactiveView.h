//
//  RWView.h
//  RWTwitterSearch
//
//  Created by Colin Eberhardt on 25/04/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

/// A protocol which is adopted by views which are backed by view models.
@protocol NOSReactiveView <NSObject>

/// Binds the given view model to the view
- (void)bindViewModel:(id)viewModel;

@end
