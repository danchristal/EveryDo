//
//  CellDetailsViewController.m
//  EveryDo
//
//  Created by Dan Christal on 2016-09-20.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import "CellDetailsViewController.h"

@interface CellDetailsViewController ()

@property (nonatomic, strong) ToDo *toDoItem;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailPriorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

@implementation CellDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.detailTitleLabel.text = self.toDoItem.title;
    self.detailPriorityLabel.text = [NSString stringWithFormat:@"Priority: %@", self.toDoItem.priority];
    self.detailDescriptionLabel.text = self.toDoItem.todoDescription;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setDetails:(ToDo *)item{
    
    self.toDoItem = item;

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
