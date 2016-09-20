//
//  AddToDoItemViewController.h
//  EveryDo
//
//  Created by Dan Christal on 2016-09-20.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddToDoItemProtocol <NSObject>
@required
-(void)addToDoItem:(ToDo *)item;

@end

@interface AddToDoItemViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) id<AddToDoItemProtocol> delegate;

@end
