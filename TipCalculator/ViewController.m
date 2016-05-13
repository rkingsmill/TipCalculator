//
//  ViewController.m
//  TipCalculator
//
//  Created by Rosalyn Kingsmill on 2016-05-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UITextField* billAmountTextField;
@property (nonatomic) UIButton* calculateTipButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    [self setupTextField];
    [self setupTipButton];
    
    

    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTextField {
    
    
    UITextField *billAmount = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    self.billAmountTextField = billAmount;
    self.billAmountTextField.borderStyle = UITextBorderStyleRoundedRect;
    //self.billAmountTextField.font = [UIFont systemFontOfSize:15];
    self.billAmountTextField.placeholder = @"Enter Bill Amount";
    self.billAmountTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    //self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.billAmountTextField.returnKeyType = UIReturnKeyDone;
    self.billAmountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.billAmountTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //self.billAmountTextField.delegate = self;
    [self.view addSubview:self.billAmountTextField];
 
    //[self customizeKeyboard];
    
}

-(void)setupTipButton {
    
    UIButton *tipButton = [[UIButton alloc]initWithFrame:CGRectMake(330, 100, 60, 40)];
    self.calculateTipButton = tipButton;
    //self.calculateTipButton.buttonType = UIButtonTypeRoundedRect;
    self.calculateTipButton.backgroundColor = [UIColor whiteColor];
    self.calculateTipButton.titleLabel.textColor = [UIColor blackColor];
    //self.calculateTipButton.font = [UIFont systemFontOfSize:10];
    [self.calculateTipButton setTitle:@"Tip" forState:UIControlStateNormal];
    [self.calculateTipButton addTarget:self action:@selector(calculateTip:) forControlEvents:UIControlEventTouchUpInside];
    //self.calculateTipButton.titleLabel.text = @"Tip";
    [self.view addSubview:self.calculateTipButton];
    
}

-(float)calculateTip:(float)bill {
    
    float tip;
    tip = 0.15 * bill;
    
    return tip;
}

//- (void)customizeKeyboard {
//    
//    self.billAmountTextField.autocorrectionType = NO;
//    self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
//}




@end


