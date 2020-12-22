//
//  LLChatMessageTextCell.m
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import "LLChatMessageTextCell.h"
#import <Masonry.h>

@interface LLChatMessageTextCell()

@end

@implementation LLChatMessageTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillWithData:(LLChatMessageData *)data {
    [super fillWithData:data];
    _textData = (LLChatMessageTextData *) data;
}

// MARK: - Private methods
- (void)setupUI {
    _contentLabel = [[YYLabel alloc] init];
    _contentLabel.userInteractionEnabled = YES;
    _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(15);
        make.bottom.mas_equalTo(5);
    }];
}


@end
