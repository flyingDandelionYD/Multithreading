//
//  SynchronizedDemo.m
//  Multithreading
//


#import "SynchronizedDemo.h"

@implementation SynchronizedDemo
- (void)__drawMoney{
    @synchronized([self class]) {
        [super __drawMoney];
    }
}

- (void)__saveMoney{
    @synchronized([self class]) { // objc_sync_enter
        [super __saveMoney];
    } // objc_sync_exit
}

- (void)__saleTicket{
    static NSObject *lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc] init];
    });
    @synchronized(lock) {
        [super __saleTicket];
    }
}

- (void)otherTest{
    static int i = 0;
    @synchronized([self class]) {
        i++;
        NSLog(@"i=%d",i);
        if(i==10){
            NSLog(@"over");
        }else{
             [self otherTest];
        }
    }
}

@end
