//
//  LLChatMessageBaseCell.m
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import "LLChatMessageCell.h"

@implementation LLChatMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _colorWhenTouched = [UIColor colorWithRed:219.0/255.0 green:219.0/255.0  blue:219.0/255.0  alpha:1];
        _changeColorWhenTouched = NO;
        self.backgroundColor = [UIColor whiteColor];
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
    _data = data;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.changeColorWhenTouched){
        self.backgroundColor = self.colorWhenTouched;
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.changeColorWhenTouched){
        self.backgroundColor = [UIColor whiteColor];
    }
}


-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.changeColorWhenTouched){
        self.backgroundColor = [UIColor whiteColor];
    }
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.changeColorWhenTouched){
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
