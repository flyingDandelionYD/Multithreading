//
//  ViewController_12.m
//  Multithreading
//


#import "ViewController_12.h"
#import "NSLockDemo.h"

@interface ViewController_12 ()

@end

@implementation ViewController_12

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLockDemo *demo = [[NSLockDemo alloc]init];
    [demo ticketTest];
    [demo moneyTest];
}
@end
