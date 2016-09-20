//
//  ToDoTableViewController.m
//  EveryDo
//
//  Created by Dan Christal on 2016-09-20.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import "ToDoTableViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"
#import "CellDetailsViewController.h"
#import "AddToDoItemViewController.h"

@interface ToDoTableViewController ()

@property (nonatomic, strong) NSMutableArray<ToDo*> *todoList;


@end

@implementation ToDoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    ToDo *laundry = [[ToDo alloc] init];
    laundry.title = @"Laundry";
    laundry.todoDescription = @"Take all dirty laundry to the laundry mat.";
    laundry.priority = @2;
    laundry.completed = NO;
    
    ToDo *homework = [[ToDo alloc] init];
    homework.title = @"Homework";
    homework.todoDescription = @"Complete unfinished homework assignments";
    homework.priority = @1;
    homework.completed = NO;
    
    ToDo *housework = [[ToDo alloc] init];
    housework.title = @"Housework";
    housework.todoDescription = @"Tidy up around the house";
    housework.priority = @3;
    housework.completed = YES;
    
    self.todoList = [[NSMutableArray alloc] init];
    
    [self.todoList addObject:laundry];
    [self.todoList addObject:homework];
    [self.todoList addObject:housework];
    
 
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    [swipeRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.tableView addGestureRecognizer:swipeRecognizer];
    swipeRecognizer.delegate = self;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    
    
}
- (void)swipeHandler:(UISwipeGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
        
    ToDo *item = [self.todoList objectAtIndex:indexPath.row];
    if(!item.completed){
        item.completed = YES;
    } else{
        item.completed = NO;
    }
    
    [self.todoList replaceObjectAtIndex:indexPath.row withObject:item];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoItemCell" forIndexPath:indexPath];
    
    ToDo *item = self.todoList[indexPath.row];
   
    if(item.completed){
        NSMutableAttributedString *strikeThroughString = [[NSMutableAttributedString alloc] init];
        strikeThroughString = [strikeThroughString initWithString:item.title];
        
        [strikeThroughString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range:NSMakeRange(0, [strikeThroughString length])];
        
        cell.titleLabel.attributedText = strikeThroughString;
        
        strikeThroughString = [strikeThroughString initWithString:item.todoDescription];
        [strikeThroughString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range:NSMakeRange(0, [strikeThroughString length])];
        cell.descriptionLabel.attributedText = strikeThroughString;
        
        strikeThroughString = [strikeThroughString initWithString:[item.priority stringValue]];
        [strikeThroughString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range:NSMakeRange(0, [strikeThroughString length])];
        cell.priorityLabel.attributedText = strikeThroughString;
        
    }else{
        
        cell.titleLabel.text = item.title;
        cell.descriptionLabel.text = item.todoDescription;
        cell.priorityLabel.text = [item.priority stringValue];
    }
    
    return cell;
}

-(void)addToDoItem:(ToDo *)item{
    
    
    [self.todoList addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.todoList indexOfObject:item] inSection:0];
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView endUpdates];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.todoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    if(fromIndexPath.row == toIndexPath.row)
        return;
    
    ToDo *itemToMove = self.todoList[fromIndexPath.row];
    
    [self.todoList removeObjectAtIndex:fromIndexPath.row];
    [self.todoList insertObject:itemToMove atIndex:toIndexPath.row];
    
    [self.tableView reloadData];
    
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        
        
        CellDetailsViewController *cellDetailVC = segue.destinationViewController;
        
        ToDoTableViewCell *cell = (ToDoTableViewCell *)sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        [cellDetailVC setDetails:self.todoList[indexPath.row]];
        
    }
    if([segue.identifier isEqualToString:@"addToDoItemSegue"]){
        
        AddToDoItemViewController *addItemVC = segue.destinationViewController;
        addItemVC.delegate = self;
        
    }
    
    
}


@end
