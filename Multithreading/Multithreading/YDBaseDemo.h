//
//  YDBaseDemo.h
//  Multithreading
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YDBaseDemo : NSObject
- (void)moneyTest;
- (void)ticketTest;
#pragma mark - 暴露给子类去使用
- (void)__saveMoney;
- (void)__drawMoney;
- (void)__saleTicket;
@end

NS_ASSUME_NONNULL_END
