//
//  RecipeController.m
//  Demos
//
//  Created by Neroscofee on 2017/9/4.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "RecipeController.h"
#import "RecipeModel.h"
#import "RecipeView.h"

@interface RecipeController ()

@property (nonatomic, strong) NSMutableArray *recipeArray;

@end

static NSString *const recipeCell = @"recipeCell";
@implementation RecipeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRecipeData];
    [self.tableView registerClass:[RecipeView class] forCellReuseIdentifier:recipeCell];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)getRecipeData {
    _recipeArray = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipeData" ofType:@"plist"];
    NSArray *temp = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in temp) {
        RecipeModel *model = [[RecipeModel alloc] init];
        //model.title = [dic valueForKey:@"title"];
        model.title = dic[@"title"];//字面量字典
        model.detail = [dic valueForKey:@"detail"];
        model.price = [dic valueForKey:@"price"];
        [_recipeArray addObject:model];
    }
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
    return self.recipeArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecipeView *cell = [tableView dequeueReusableCellWithIdentifier:recipeCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!cell) {
        cell = [[RecipeView alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:recipeCell];
    }

    cell.recipeModel = (RecipeModel *)[self.recipeArray objectAtIndex:indexPath.row];
    [cell loadData];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
