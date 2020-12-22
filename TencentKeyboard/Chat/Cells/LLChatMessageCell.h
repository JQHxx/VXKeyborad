//
//  LLChatMessageBaseCell.h
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLChatMessageData.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLChatMessageCell : UITableViewCell

@property (readonly) LLChatMessageData *data;
@property UIColor *colorWhenTouched;
@property BOOL changeColorWhenTouched;

- (void)fillWithData:(LLChatMessageData *)data;

@end

NS_ASSUME_NONNULL_END
