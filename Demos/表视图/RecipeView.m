//
//  RecipeView.m
//  Demos
//
//  Created by Neroscofee on 2017/9/4.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "RecipeView.h"
#import "RecipeModel.h"

@interface RecipeView ()
{
    UILabel *titleLabel;
    UILabel *detailLabel;
    UILabel *priceLabel;
}
@end

@implementation RecipeView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initRecipeCell];
    }
    return self;
}

- (void)initRecipeCell {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor randomColor];
    [self.contentView addSubview:titleLabel];
    detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    detailLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:detailLabel];
    priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 20)];
    priceLabel.backgroundColor = [UIColor lightGrayColor];
    priceLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:priceLabel];
}

- (void)loadData {
    titleLabel.text = self.recipeModel.title;
    detailLabel.text = self.recipeModel.detail;
    priceLabel.text = [NSString stringWithFormat:@"%@元",self.recipeModel.price];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
