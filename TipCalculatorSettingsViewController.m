//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Hrishi Mantri on 1/22/17.
//  Copyright © 2017 Yahoo. All rights reserved.
//

#import "TipCalculatorSettingsViewController.h"

@interface TipCalculatorSettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSelector;

@end

@implementation TipCalculatorSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveDefaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger: self.defaultTipSelector.selectedSegmentIndex  forKey:@"defaultTip"];
    [defaults synchronize];
}

@end
