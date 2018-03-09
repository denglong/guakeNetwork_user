//
//  HomeLoopCell.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/8.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "HomeLoopCell.h"

@implementation HomeLoopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _cycleView.placeholderImage = [UIImage imageNamed:@"apicloud-bg"];
    _cycleView.autoScrollTimeInterval = 4.0;
    _cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleView.titleLabelBackgroundColor = [UIColor clearColor];
    [SDCycleScrollView clearImagesCache];
}

- (void)setCycleViewImage:(NSArray *)imgList {
    _cycleView.localizationImageNamesGroup = imgList;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
