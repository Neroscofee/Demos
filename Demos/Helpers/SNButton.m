//
//  SNButton.m
//  Demos
//
//  Created by Neroscofee on 2020/10/27.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "SNButton.h"

@implementation SNButton

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize btnSize = self.bounds.size;
    [self.titleLabel sizeToFit];
    CGSize tempTitleLabelSize = self.titleLabel.bounds.size;
    CGSize imageViewSize = self.imageSize.width > 0 && self.imageSize.height > 0 ? self.imageSize : self.imageView.image.size;
    CGSize titleLabelSize = self.titleSize.width > 0 && self.titleSize.height > 0 ? self.titleSize : tempTitleLabelSize;
    if (self.layoutType == ButtonLayoutTypeHorizon) {
        self.imageView.frame = CGRectMake(self.gap, (btnSize.height-imageViewSize.height)/2, imageViewSize.width, imageViewSize.height);
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+self.imageAndTitleInset, (btnSize.height-titleLabelSize.height)/2, titleLabelSize.width, titleLabelSize.height);
    } else if (self.layoutType == ButtonLayoutTypeVertical) {
        self.imageView.frame = CGRectMake((btnSize.width-imageViewSize.width)/2, self.gap, imageViewSize.width, imageViewSize.height);
        self.titleLabel.frame = CGRectMake((btnSize.width-titleLabelSize.width)/2, CGRectGetMaxY(self.imageView.frame)+self.imageAndTitleInset, titleLabelSize.width, titleLabelSize.height);
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
