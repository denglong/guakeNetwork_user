//
//  ClassifyCell.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/8.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "ClassifyCell.h"

@implementation ClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
