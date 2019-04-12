//
//  MutexDemo.m
//  Multithreading
//


#import "MutexDemo.h"
#import <pthread.h>

@interface MutexDemo()
@property (assign, nonatomic) pthread_mutex_t ticketMutex;
@property (assign, nonatomic) pthread_mutex_t moneyMutex;
@end

@implementation MutexDemo
- (void)__initMutex:(pthread_mutex_t *)mutex{
    // 初始化锁
    pthread_mutex_init(mutex, NULL); //传入空就是Default
}

- (instancetype)init{
    if (self = [super init]) {
        [self __initMutex:&_ticketMutex];
        [self __initMutex:&_moneyMutex];
    }
    return self;
}

- (void)__saleTicket{
    pthread_mutex_lock(&_ticketMutex);
    [super __saleTicket];
    pthread_mutex_unlock(&_ticketMutex);
}

- (void)__saveMoney{
    pthread_mutex_lock(&_moneyMutex);
    [super __saveMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__drawMoney{
    pthread_mutex_lock(&_moneyMutex);
    [super __drawMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)dealloc{
    pthread_mutex_destroy(&_moneyMutex);
    pthread_mutex_destroy(&_ticketMutex);
}
@end
