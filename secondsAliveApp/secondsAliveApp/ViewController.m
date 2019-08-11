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
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *dateOfBirth = [calendar dateFromComponents:dateComponents];
    NSDate *nowDate = [[NSDate alloc] init];
    double numberOfSecondsAlive = [nowDate timeIntervalSinceDate:dateOfBirth];
    NSLog(@"I have been alive %d", (int)numberOfSecondsAlive);
    
    self.labelSecondsAlive.text = [NSString stringWithFormat:@"%.0lf", numberOfSecondsAlive];
    [self.view setNeedsDisplay];
}

@end
