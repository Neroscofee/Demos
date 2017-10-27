//
//  RecipeView.h
//  Demos
//
//  Created by Neroscofee on 2017/9/4.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipeModel;

@interface RecipeView : UITableViewCell

@property (nonatomic, strong) RecipeModel *recipeModel;

- (void)initRecipeCell;
- (void)loadData;

@end
