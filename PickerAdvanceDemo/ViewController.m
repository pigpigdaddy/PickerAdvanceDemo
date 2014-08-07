//
//  ViewController.m
//  PickerAdvanceDemo
//
//  Created by linfeng on 14-8-7.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.minute = 0;
    self.hour = 0;
    [self initPickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initPickerView
{
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 300)];
    [self.view addSubview:picker];
    picker.delegate = self;
    picker.dataSource = self;
    [picker selectRow:1 inComponent:1 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return 2;
    }else{
        return 60;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d", row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.hour = row;
    }else{
        self.minute = row;
    }
    if ((self.hour == 0 && component == 1 && row == 0) || (self.minute == 0 && component == 0 && row == 0)) {
        [pickerView selectRow:1 inComponent:1 animated:YES];
    }
    
}

@end
