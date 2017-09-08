//
//  RecipeView.h
//  Demo9_6
//
//  Created by 石飞龙 on 2017/9/4.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipeModel;

@interface RecipeView : UITableViewCell

@property (nonatomic, strong) RecipeModel *recipeModel;

- (void)initRecipeCell;
- (void)loadData;

@end
