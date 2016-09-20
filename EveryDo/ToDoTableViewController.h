//
//  ToDoTableViewController.h
//  EveryDo
//
//  Created by Dan Christal on 2016-09-20.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddToDoItemViewController.h"

@interface ToDoTableViewController : UITableViewController <AddToDoItemProtocol, UIGestureRecognizerDelegate>

@end
