//
//  ViewController_6.m
//  Multithreading
//


#import "ViewController_6.h"

@interface ViewController_6 ()
@property (assign, nonatomic) int ticketsCount;
@property (assign, nonatomic) int money;
@end

@implementation ViewController_6

- (void)viewDidLoad {
    [super viewDidLoad];
    [self moneyTest];
    [self ticketTest];
}

/**
  存钱、取钱演示
  */
- (void)moneyTest{
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self drawMoney];
        }
    });
}

/**
  存钱
  */
- (void)saveMoney{
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存50，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}

/**
  取钱
  */
- (void)drawMoney{
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取20，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}

/**
  卖1张票
  */
- (void)saleTicket{
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"还剩%d张票 - %@", oldTicketsCount, [NSThread currentThread]);
}

/**
  卖票演示
  */
- (void)ticketTest{
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
}
@end
