//
//  HomeLoopCell.h
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/8.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomeLoopCell : UITableViewCell

@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;

- (void)setCycleViewImage:(NSArray *)imgList;

@end
