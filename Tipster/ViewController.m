//
//  ViewController.m
//  Tipster
//
//  Created by mloirraqi on 6/25/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *billText;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipController;
@property (weak, nonatomic) IBOutlet UITextField *twoPeopleBill;
@property (weak, nonatomic) IBOutlet UITextField *threePeopleBill;
@property (weak, nonatomic) IBOutlet UITextField *fourPeopleBill;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    
    NSArray *percentages = @[@(0.10),@(0.15),@(0.18),@(0.22)];
    
    double tipPercent = [percentages[self.tipController.selectedSegmentIndex] doubleValue];
    double bill = [self.billField.text doubleValue];
    double tip = tipPercent * bill;
    double total = tip + bill;
    
    //calculating tip and total bill values
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f" , total ];
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f" , tip ];
    
    //splitting bill cost
    self.twoPeopleBill.text = [NSString stringWithFormat:@"$%.2f" , total / 2];
    self.threePeopleBill.text = [NSString stringWithFormat:@"$%.2f" , total / 3];
    self.fourPeopleBill.text = [NSString stringWithFormat:@"$%.2f" , total / 4];
}

- (IBAction)onEditBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x - 30,self.billField.frame.origin.y + 30,self.billField.frame.size.width + 15 ,self.billField.frame.size.height + 20);
    }];
    
}
- (IBAction)onEditEnd:(id)sender {
    
    CGRect newFrame = self.billField.frame;
    newFrame.origin.x += 30;
    newFrame.origin.y -= 30;
    newFrame.size.width -= 15;
    newFrame.size.height -= 20;
  
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];
    
}

@end
