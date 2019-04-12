//
//  ViewController_3.m
//  Multithreading
//


#import "ViewController_3.h"

@interface ViewController_3 ()

@end

@implementation ViewController_3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test2];
    
}

//异步开启子线程，执行任务
-(void)test1{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0); //全局并发队列
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
        // <NSThread: 0x6000033da280>{number = 3, name = (null)}
    });
}

//同步，在当前线程执行任务
-(void)test2{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0); //全局并发队列
    dispatch_sync(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
        // <NSThread: 0x600002442c80>{number = 1, name = main}
    });
}

//同步，在当前线程执行任务（并发无效 ）
-(void)test3{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0); //全局并发队列
    dispatch_sync(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务1:%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务2:%@",[NSThread currentThread]);
        }
    });
    
    /*
    执行任务1:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务1:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务1:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务1:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务1:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务2:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务2:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务2:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务2:<NSThread: 0x600002b66980>{number = 1, name = main}
    执行任务2:<NSThread: 0x600002b66980>{number = 1, name = main}
     */
}

//异步，开启新线程执行任务（并发）
-(void)test4{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0); //全局并发队列
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务1:%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务2:%@",[NSThread currentThread]);
        }
    });
    
    /*
     执行任务1:<NSThread: 0x6000018ac740>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x6000018ac4c0>{number = 4, name = (null)}
     执行任务1:<NSThread: 0x6000018ac740>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x6000018ac4c0>{number = 4, name = (null)}
     执行任务2:<NSThread: 0x6000018ac4c0>{number = 4, name = (null)}
     执行任务1:<NSThread: 0x6000018ac740>{number = 3, name = (null)}
     执行任务1:<NSThread: 0x6000018ac740>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x6000018ac4c0>{number = 4, name = (null)}
     执行任务1:<NSThread: 0x6000018ac740>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x6000018ac4c0>{number = 4, name = (null)}
     */
}

//串行队列异步执行任务 （按顺序执行）
-(void)test5{
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL); //串行队列
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务1:%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务2:%@",[NSThread currentThread]);
        }
    });
    /*
     执行任务1:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务1:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务1:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务1:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务1:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     执行任务2:<NSThread: 0x600002de93c0>{number = 3, name = (null)}
     */
}

//在当前线程（此时是主线程），串行执行任务
-(void)test6{
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL); //串行队列
    dispatch_sync(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务1:%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务2:%@",[NSThread currentThread]);
        }
    });
    
    /*
     执行任务1:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600000c69400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600000c69400>{number = 1, name = main}
     */
}

//主队列里面异步执行（此时没有开启新的线程）
-(void)test7{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务1:%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            NSLog(@"执行任务2:%@",[NSThread currentThread]);
        }
    });
    
    /*
     执行任务1:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务1:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600003d7d400>{number = 1, name = main}
     执行任务2:<NSThread: 0x600003d7d400>{number = 1, name = main}
     */
}
@end
