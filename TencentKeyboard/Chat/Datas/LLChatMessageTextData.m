//
//  LLChatMessageTextData.m
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import "LLChatMessageTextData.h"
#import "MessageUtil.h"

@implementation LLChatMessageTextData

#pragma mark - Setter & Getter
- (NSAttributedString *)attributedString
{
    if (!_attributedString) {
        _attributedString = [MessageUtil formatMessageString:self.content textFont:[UIFont systemFontOfSize:14]];
    }
    return _attributedString;
}

@end
