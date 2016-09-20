//
//  ToDoTableViewCell.h
//  EveryDo
//
//  Created by Dan Christal on 2016-09-20.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end
