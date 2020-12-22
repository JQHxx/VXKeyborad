//
//  LLChatMessageTextCell.h
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import "LLChatMessageCell.h"
#import "LLChatMessageTextData.h"
#import <YYText/YYText.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLChatMessageTextCell : LLChatMessageCell

/**
 *  内容标签
 *  用于展示文本消息的内容。
 */
@property (nonatomic, strong) YYLabel *contentLabel;
/**
 *  文本消息单元数据源
 *  数据源内存放了文本消息的内容信息、消息字体、消息颜色、并存放了发送、接收两种状态下的不同字体颜色。
 */
@property LLChatMessageTextData *textData;

@end

NS_ASSUME_NONNULL_END
