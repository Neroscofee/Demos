//
//  StcCell.m
//  Demos
//
//  Created by Neroscofee on 2020/10/28.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "StcCell.h"

@interface StcCell ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *amount;
@property (nonatomic, strong) UIImageView *arrow;

@end

@implementation StcCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.amount];
        [self.contentView addSubview:self.arrow];
        [self.contentView addSubview:[SNUtility createSeparateLine:CGRectMake(12, 48, SCREEN_WIDTH-12, 1) color:UIColorMake(0xF1F1F1)]];
        
    }
    return self;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(12, 15, 120, 18)];
        _title.font = UIFontMake(17);
        _title.textColor = UIColorMake(0x323334);
        _title.textAlignment = NSTextAlignmentLeft;
    }
    return _title;
}

- (UILabel *)amount {
    if (!_amount) {
        _amount = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-29-120, 15, 120, 18)];
        _amount.font = UIFontMake(17);
        _amount.textAlignment = NSTextAlignmentRight;
        _amount.textColor = UIColorMake(0x999999);
    }
    return _amount;
}

- (UIImageView *)arrow {
    if (!_arrow) {
        _arrow = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-23, 20, 12, 8)];
        _arrow.image = UIImageMake(@"unfold.png");
    }
    return _arrow;
}

- (void)loadData {
    if (self.model.num == 1) {
        self.amount.textColor = UIColorMake(0x999999);
        self.arrow.image = UIImageMake(@"222.png");
    } else {
        self.amount.textColor = UIColorMake(0xE0E0E0);
        //lightunfold@2x.png
        self.arrow.image = UIImageMake(@"111.png");
    }
    self.title.text = self.model.titleName;
    self.amount.text = self.model.amountName;
}

@end
