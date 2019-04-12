//
//  ViewController_18.m
//  Multithreading
//


#import "ViewController_18.h"

@interface ViewController_18 ()
@property (atomic,assign)NSInteger age;
@end

@implementation ViewController_18

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for(int i=0;i<20;i++){
            self.age = self.age+1;
            NSLog(@"--1---age = %ld---%@",(long)self.age,[NSThread currentThread]);
        }
    });
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for(int i=0;i<20;i++){
            self.age = self.age+1;
            NSLog(@"--2---age = %ld---%@",(long)self.age,[NSThread currentThread]);
        }
    });
    
    sleep(5);
    NSLog(@"lastAge = %ld---%@",(long)self.age,[NSThread currentThread]);
}

@end
