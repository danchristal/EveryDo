//
//  ToDo.h
//  EveryDo
//
//  Created by Dan Christal on 2016-09-20.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic, strong) NSNumber *priority;
@property BOOL completed;

@end
