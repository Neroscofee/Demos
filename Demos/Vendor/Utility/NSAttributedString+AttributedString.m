//
//  NSAttributedString+AttributedString.m
//  Demos
//
//  Created by Neroscofee on 2021/3/1.
//  Copyright © 2021 Neroscofee. All rights reserved.
//

#import "NSAttributedString+AttributedString.h"

@implementation NSAttributedString (AttributedString)

- (CGSize)size {
    return [self sizeWithMaxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
}

- (CGSize)sizeWithMaxSize:(CGSize)size {
    if (self.length == 0) {
        return CGSizeZero;
    }
    CGSize boundingRect = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return CGSizeMake(ceil(boundingRect.width), ceil(boundingRect.height));
}

@end
