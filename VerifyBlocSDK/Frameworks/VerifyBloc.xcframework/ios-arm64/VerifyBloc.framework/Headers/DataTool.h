//
//  NSData_SHA1.h
//  SwiftyRSA
//
//  Created by Paul Wilkinson on 19/04/2016.
//  Copyright © 2016 Scoop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTool : NSObject

+ (nonnull NSData*)SwiftyRSASHA1:(NSData * _Nullable)data;
+ (nonnull NSData*)SwiftyRSASHA224:(NSData * _Nullable)data;
+ (nonnull NSData*)SwiftyRSASHA256:(NSData * _Nullable)data;
+ (nonnull NSData*)SwiftyRSASHA384:(NSData * _Nullable)data;
+ (nonnull NSData*)SwiftyRSASHA512:(NSData * _Nullable)data;

@end
