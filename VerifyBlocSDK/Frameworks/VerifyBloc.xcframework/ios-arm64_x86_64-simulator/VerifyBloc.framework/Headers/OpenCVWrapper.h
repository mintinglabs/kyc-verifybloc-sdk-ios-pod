//
//  OpenCVWrapper.h
//  testOpenCV
//
//  Created by yangyu on 2023/7/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BrightnessLevel) {
    BrightnessLevelUnknown,
    BrightnessLevelDark,
    BrightnessLevelNormal,
    BrightnessLevelBright
};

@interface OpenCVWrapper : NSObject
         
+ (NSString *)getOpenCVVersion;

+ (Boolean)isImageBlurred: (UIImage *)src;

+ (BrightnessLevel)detectImageBrightness: (UIImage *)src;

@end

NS_ASSUME_NONNULL_END
