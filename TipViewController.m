//
//  ViewController.m
//  tipCalculator
//
//  Created by Hrishi Mantri on 1/22/17.
//  Copyright © 2017 Yahoo. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:(YES)];
    [self updateValues];
}
- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    // Get the default from Settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipValue = [defaults integerForKey:@"defaultTip"];
    NSLog(@"Default value is %d", defaultTipValue);
    // self.tipControl.selectedSegmentIndex = defaultTipValue;
    
    // get the bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    
    //compute the tip and total
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [ tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    // update the UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
@end
