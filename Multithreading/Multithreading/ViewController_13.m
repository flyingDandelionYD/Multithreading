//
//  ViewController_13.m
//  Multithreading
//


#import "ViewController_13.h"
#import "NSConditionDemo.h"

@interface ViewController_13 ()

@end

@implementation ViewController_13

- (void)viewDidLoad {
    [super viewDidLoad];
    NSConditionDemo  *demo = [[NSConditionDemo alloc]init];
    [demo otherTest];
}

@end
