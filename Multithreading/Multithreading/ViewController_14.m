//
//  ViewController_14.m
//  Multithreading
//


#import "ViewController_14.h"
#import "NSConditionLockDemo.h"

@interface ViewController_14 ()

@end

@implementation ViewController_14

- (void)viewDidLoad {
    [super viewDidLoad];
    NSConditionLockDemo *demo = [[NSConditionLockDemo alloc]init];
    [demo otherTest];
}


@end
