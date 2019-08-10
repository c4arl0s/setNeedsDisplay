# setNeedsDisplay

using setNeedsDisplay method

- Marks the receiver’s entire bounds rectangle as needing to be redrawn.

``` objective-c
//
//  ViewController.m
//  secondsAliveApp
//
//  Created by Carlos Santiago Cruz on 8/10/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelSecondsAlive;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelSecondsAlive.text = @"seconds";
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshViewMethod:) userInfo:nil repeats:YES];
}

-(void)refreshViewMethod:(NSTimer *)timer
{
    // setting my birthDay
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:1981];
    [dateComponents setMonth:3];
    [dateComponents setDay:2];
    [dateComponents setHour:19];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *dateOfBirth = [calendar dateFromComponents:dateComponents];
    NSDate *nowDate = [[NSDate alloc] init];
    double numberOfSecondsAlive = [nowDate timeIntervalSinceDate:dateOfBirth];
    NSLog(@"I have been alive %d", (int)numberOfSecondsAlive);
    
    self.labelSecondsAlive.text = [NSString stringWithFormat:@"%.0lf", numberOfSecondsAlive];
    [self.view setNeedsDisplay];
}

@end
```

![Screen Shot 2019-08-10 at 2 54 54 PM](https://user-images.githubusercontent.com/24994818/62826302-d8422e00-bb7e-11e9-95f3-dfc913a0e386.png)
![Screen Shot 2019-08-10 at 2 51 42 PM](https://user-images.githubusercontent.com/24994818/62826291-a335db80-bb7e-11e9-9bd2-5f797d74a3c9.png)



