//
//  ViewController_4.m
//  Multithreading
//


#import "ViewController_4.h"

@interface ViewController_4 ()

@end

@implementation ViewController_4

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test6];
    
}


// 问题：以下代码是在主线程执行的，会不会产生死锁？会！
- (void)test1{
    NSLog(@"执行任务1");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    NSLog(@"执行任务3");
}

//开启一个新的串行队列,此时执行不会造成死锁
-(void)test2{
    NSLog(@"执行任务1");
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    NSLog(@"执行任务3");
}


//问题：以下代码是在主线程执行的，会不会产生死锁？不会！(dispatch_async不要求立马在当前线程同步执行任务)
-(void)test3{
    NSLog(@"执行任务1");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
    });
    sleep(10);
    NSLog(@"执行任务3");
}

// 问题：以下代码是在主线程执行的，会不会产生死锁？会！
-(void)test4{
    NSLog(@"执行任务1");
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{ // block0
            NSLog(@"执行任务2");
            dispatch_sync(queue, ^{ // block1
                NSLog(@"执行任务3");
            });
            NSLog(@"执行任务4");
    });
    NSLog(@"执行任务5");
}


// 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
-(void)test5{
    NSLog(@"执行任务1");
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        dispatch_sync(queue2, ^{ // 1
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    NSLog(@"执行任务5");
}


// 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
-(void)test6{
    NSLog(@"执行任务1");
    NSLog(@"%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"执行任务2");
        dispatch_sync(queue, ^{
            NSLog(@"%@",[NSThread currentThread]);
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    NSLog(@"执行任务5");
}
@end
