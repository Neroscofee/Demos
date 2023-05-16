//
//  NearToFarCollectionViewCell.m
//  Demos
//
//  Created by Neroscofee on 2023/2/28.
//  Copyright © 2023 Neroscofee. All rights reserved.
//

#import "NearToFarCollectionViewCell.h"

@implementation NearToFarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    }
    return _imageView;
}


@end
