//
//  ViewController_19.m
//  Multithreading
//


#import "ViewController_19.h"
#import <pthread.h>

@interface ViewController_19 ()
@property (assign, nonatomic) pthread_rwlock_t lock;
@property (nonatomic,assign)int  age;
@end

@implementation ViewController_19
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化锁
    pthread_rwlock_init(&_lock, NULL);
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }
    
    sleep(5);
    NSLog(@"%@--age=%d",[NSThread currentThread],self.age);
}

- (void)read {
    pthread_rwlock_rdlock(&_lock);
    NSLog(@"%s--%@--age=%d", __func__,[NSThread currentThread],self.age);
    pthread_rwlock_unlock(&_lock);
}

- (void)write{
    pthread_rwlock_wrlock(&_lock);
    self.age+=1;
    NSLog(@"%s--%@--age=%d", __func__,[NSThread currentThread],self.age);
    pthread_rwlock_unlock(&_lock);
}

- (void)dealloc{
    pthread_rwlock_destroy(&_lock);
}

@end
