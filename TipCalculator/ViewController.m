//
//  ViewController.m
//  TipCalculator
//
//  Created by Rosalyn Kingsmill on 2016-05-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UITextField* billAmountTextField;
@property (nonatomic) UIButton* calculateTipButton;
@property (nonatomic, strong) UILabel* tipAmountLabel;
@property (nonatomic) UITextField* tipTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.billAmountTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    [self setupTextField];
    
    self.calculateTipButton = [[UIButton alloc]initWithFrame:CGRectMake(330, 100, 60, 40)];
    [self setupTipButton];
    
    self.tipAmountLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 200, 100, 40)];
    [self setupTipLabel];
    
    self.tipTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 50, 150, 40)];
    [self setupTipTextField];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTextField {

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
    
    //self.calculateTipButton.buttonType = UIButtonTypeRoundedRect;
    self.calculateTipButton.backgroundColor = [UIColor whiteColor];
    //self.calculateTipButton.font = [UIFont systemFontOfSize:10];
    [self.calculateTipButton setTitle:@"Go" forState:UIControlStateNormal];
    [self.calculateTipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.calculateTipButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.calculateTipButton addTarget:self action:@selector(calculateAndDisplayTip) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.calculateTipButton];
    
}

-(void)setupTipLabel {
    
    self.tipAmountLabel.textColor = [UIColor redColor];
    self.tipAmountLabel.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tipAmountLabel];
}

- (void)setupTipTextField {
    
    self.tipTextField.borderStyle = UITextBorderStyleRoundedRect;
    //self.billAmountTextField.font = [UIFont systemFontOfSize:15];
    self.tipTextField.placeholder = @"Enter Tip Percent";
    self.tipTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    //self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.tipTextField.returnKeyType = UIReturnKeyGo;
    self.tipTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tipTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //self.billAmountTextField.delegate = self;
    [self.view addSubview:self.tipTextField];
    
    //[self customizeKeyboard];
    
}

-(void)calculateAndDisplayTip {

    NSDecimalNumber *inputValue = [NSDecimalNumber decimalNumberWithString:self.billAmountTextField.text];
    NSDecimalNumber *percent = [NSDecimalNumber decimalNumberWithString:self.tipTextField.text];
    NSDecimalNumber *convert = [NSDecimalNumber decimalNumberWithString:@"100"];
    NSDecimalNumber *decimal = [percent decimalNumberByDividingBy:convert];
    //NSDecimalNumber *percent = [NSDecimalNumber decimalNumberWithString:@"0.15"];
    NSDecimalNumber *output = [inputValue decimalNumberByMultiplyingBy:decimal];
    
    NSDecimalNumber *tipAmount = output;
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    NSString *tip = [formatter stringFromNumber:tipAmount];
    self.tipAmountLabel.text = tip;
    
}



//- (void)customizeKeyboard {
//    
//    self.billAmountTextField.autocorrectionType = NO;
//    self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
//}




@end


