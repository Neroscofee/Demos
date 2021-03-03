//
//  NSAttributedString+AttributedString.h
//  Demos
//
//  Created by Neroscofee on 2021/3/1.
//  Copyright © 2021 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (AttributedString)

- (CGSize)size;
- (CGSize)sizeWithMaxSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
