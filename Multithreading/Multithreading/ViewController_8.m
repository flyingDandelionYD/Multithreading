//
//  ViewController_8.m
//  Multithreading
//


#import "ViewController_8.h"
#import "OSUnfairLockDemo.h"

@interface ViewController_8 ()

@end

@implementation ViewController_8

- (void)viewDidLoad {
    [super viewDidLoad];
    OSUnfairLockDemo *demo = [[OSUnfairLockDemo  alloc]init];
    [demo ticketTest];
    [demo moneyTest];
}

@end
