//
//  TKFlowLayoutCell.m
//  AllocationsDemo
//
//  Created by hello on 2020/9/15.
//  Copyright © 2020 TK. All rights reserved.
//

#import "TKFlowImageCell.h"

@implementation TKFlowImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
}

@end
