//
//  UIButton+Action.h
//  Demos
//
//  Created by Neroscofee on 2017/3/3.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

/*runtime里的关联

 让一个对象和另一个对象关联,那么这个对象就保持了对另一个对象的引用,并获取那个对象
 即使另一个对象消失,我也能通过当前对象获取到另一个对象的信息
 
 
 附:获取苹果私有API的方法
 
 */

#import <UIKit/UIKit.h>
typedef void(^ActionBlock) (UIButton *button);
@interface UIButton (Action)

@property (nonatomic, copy) ActionBlock actionBlock;

+ (UIButton *)initWithFrame:(CGRect)frame title:(NSString *)title fontSize:(NSInteger)fontSize actionBlock:(ActionBlock)block;

@end
