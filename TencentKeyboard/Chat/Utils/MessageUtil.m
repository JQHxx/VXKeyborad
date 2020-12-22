//
//  MessageUtil.m
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import "MessageUtil.h"
#import "LLFaceCell.h"
#import "LLUIKit.h"
#import <YYText/YYText.h>

#ifndef CGFLOAT_CEIL
#ifdef CGFLOAT_IS_DOUBLE
#define CGFLOAT_CEIL(value) ceil(value)
#else
#define CGFLOAT_CEIL(value) ceilf(value)
#endif
#endif

@implementation MessageUtil

+ (NSAttributedString *)formatMessageString:(NSString *)text textFont:(UIFont *)textFont {
    //先判断text是否存在
    if (text == nil || text.length == 0) {
        NSLog(@"TTextMessageCell formatMessageString failed , current text is nil");
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    //1、创建一个可变的属性字符串
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];

    if([LLUIKit sharedInstance].config.faceGroups.count == 0){
        [attributeString addAttribute:NSFontAttributeName value:textFont range:NSMakeRange(0, attributeString.length)];
        return attributeString;
    }

    //2、通过正则表达式来匹配字符串
    NSString *regex_emoji = @"\\[[a-zA-Z0-9\\/\\u4e00-\\u9fa5]+\\]"; //匹配表情

    NSError *error = nil;
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:regex_emoji options:NSRegularExpressionCaseInsensitive error:&error];
    if (!re) {
        NSLog(@"%@", [error localizedDescription]);
        return attributeString;
    }

    NSArray *resultArray = [re matchesInString:text options:0 range:NSMakeRange(0, text.length)];

    LLFaceGroup *group = [LLUIKit sharedInstance].config.faceGroups[0];

    //3、获取所有的表情以及位置
    //用来存放字典，字典中存储的是图片和图片对应的位置
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:resultArray.count];
    //根据匹配范围来用图片进行相应的替换
    for(NSTextCheckingResult *match in resultArray) {
        //获取数组元素中得到range
        NSRange range = [match range];
        //获取原字符串中对应的值
        NSString *subStr = [text substringWithRange:range];

        for (TFaceCellData *face in group.faces) {
            if ([face.name isEqualToString:subStr]) {

                UIImage *image = [[LLImageCache sharedInstance] getFaceFromCache:face.path];
                if (image != nil) {
                    CGSize tmpSize = CGSizeMake(20, 20);
                    CGRect frame;
                    frame.size = tmpSize;
                    frame.origin = CGPointMake(0, 0);

                    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                    imageView.frame = frame;

                    NSMutableAttributedString *imageStr = [NSMutableAttributedString yy_attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.frame.size alignToFont:textFont alignment:YYTextVerticalAlignmentCenter];
                    //把图片和图片对应的位置存入字典中
                    NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
                    [imageDic setObject:imageStr forKey:@"image"];
                    [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
                    //把字典存入数组中
                    [imageArray addObject:imageDic];

                }
                /*
                //face[i][@"png"]就是我们要加载的图片
                //新建文字附件来存放我们的图片,iOS7才新加的对象
                NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                //给附件添加图片
                textAttachment.image = [[TUIImageCache sharedInstance] getFaceFromCache:face.path];
                //调整一下图片的位置,如果你的图片偏上或者偏下，调整一下bounds的y值即可
                textAttachment.bounds = CGRectMake(0, -(self.textFont.lineHeight-self.textFont.pointSize)/2, self.textFont.pointSize, self.textFont.pointSize);
                //把附件转换成可变字符串，用于替换掉源字符串中的表情文字
                NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
                //把图片和图片对应的位置存入字典中
                NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
                [imageDic setObject:imageStr forKey:@"image"];
                [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
                //把字典存入数组中
                [imageArray addObject:imageDic];
                 */
                break;
            }
        }
    }

    //4、从后往前替换，否则会引起位置问题
    for (int i = (int)imageArray.count -1; i >= 0; i--) {
        NSRange range;
        [imageArray[i][@"range"] getValue:&range];
        //进行替换
        [attributeString replaceCharactersInRange:range withAttributedString:imageArray[i][@"image"]];
    }
    // self.textFont
    [attributeString addAttribute:NSFontAttributeName value:textFont range:NSMakeRange(0, attributeString.length)];
    return attributeString;
}

+ (CGSize)contentSize:(NSAttributedString *)attributedString textFont:(UIFont *)textFont width:(CGFloat)width {
    NSMutableAttributedString *nickNameStr = [[NSMutableAttributedString alloc]initWithString:@""];
    [nickNameStr appendAttributedString:attributedString];
    CGRect rect = [nickNameStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    CGSize size = CGSizeMake(CGFLOAT_CEIL(rect.size.width), CGFLOAT_CEIL(rect.size.height));
    
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(width, MAXFLOAT)];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text: nickNameStr];
    //CGSize textSize = textLayout.textBoundingSize;
    //CGPoint textOrigin = CGPointMake(0, 0);
    size.height += 0;
    size.width += 0;
    size.height = MAX(textLayout.textBoundingSize.height, 20);
    return size;
}

@end
