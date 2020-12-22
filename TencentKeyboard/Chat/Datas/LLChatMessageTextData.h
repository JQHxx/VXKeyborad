//
//  LLChatMessageTextData.h
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import "LLChatMessageData.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLChatMessageTextData : LLChatMessageData

/**
 *  消息的文本内容
 */
@property (nonatomic, strong) NSString *content;
/**
 *  可变字符串
 *  文本消息接收到 content 字符串后，需要将字符串中可能存在的字符串表情（比如[微笑]），转为图片表情。
 *  本字符串则负责存储上述过程转换后的结果。
 */
@property (nonatomic, strong) NSAttributedString *attributedString;

@end

NS_ASSUME_NONNULL_END
