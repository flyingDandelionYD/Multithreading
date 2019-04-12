//
//  ViewController_16.m
//  Multithreading
//


#import "ViewController_16.h"
#import "SemaphoreDemo.h"

@interface ViewController_16 ()

@end

@implementation ViewController_16

- (void)viewDidLoad {
    [super viewDidLoad];
    SemaphoreDemo *demo = [[SemaphoreDemo alloc]init];
    [demo moneyTest];
    [demo ticketTest];
    [demo otherTest];
    
}


@end
