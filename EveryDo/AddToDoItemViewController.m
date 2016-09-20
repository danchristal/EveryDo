//
//  AddToDoItemViewController.m
//  EveryDo
//
//  Created by Dan Christal on 2016-09-20.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()


@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleTextField.delegate = self;
    self.descriptionTextField.delegate = self;
    self.priorityTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return NO;
}

- (IBAction)addItemClicked:(UIButton *)sender {
    
    ToDo *newItem = [[ToDo alloc] init];
    
    newItem.title = self.titleTextField.text;
    newItem.todoDescription = self.descriptionTextField.text;
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    
    numFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *priorityNumber = [[NSNumber alloc] init];
    priorityNumber = [numFormatter numberFromString:self.priorityTextField.text];

    newItem.priority = priorityNumber;
    newItem.completed = NO;
    
    [self.delegate addToDoItem:newItem];
    [self.navigationController popViewControllerAnimated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
