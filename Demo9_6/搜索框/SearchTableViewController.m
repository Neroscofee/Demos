//
//  SearchTableViewController.m
//  Demo9_6
//
//  Created by 石飞龙 on 2016/12/21.
//  Copyright © 2016年 石飞龙. All rights reserved.
//

#import "SearchTableViewController.h"
#import "TestCollectionViewController.h"
#import "ViewController.h"

@interface SearchTableViewController ()<UISearchDisplayDelegate,UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *searchResult;

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"长歌怀采薇丶";
    
    UISearchBar *sb = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 88)];
//    sb.showsScopeBar = YES;
//    sb.scopeButtonTitles = @[@"设备", @"软件", @"其它"];
//    sb.showsCancelButton = YES;
//    sb.showsSearchResultsButton = YES;
    sb.delegate = self;
    self.searchBar = sb;
    self.tableView.tableHeaderView = self.searchBar;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    /*
     ZS--2
     LR--3
     SM--2
     WS--1
     QS--1
     MS--1
     SS--3
     DH--1
     DZ--3
     FS--3
     XD--2
     DK--2
     
     24个DPS
     6个T
     6个N 奶萨 奶骑 奶僧 神牧 戒律 奶德
     
     
    */
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return self.searchResult.count;
//    } else {
//        return self.products.count;
//    }
    if (self.searchResult.count != 0) {
        return self.searchResult.count;
    } else {
        return self.products.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"XXX"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XXX"];
    }
    SearchData *p = nil;
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        p = (SearchData *)self.searchResult[indexPath.row];
//    } else {
//        p = (SearchData *)self.products[indexPath.row];
//    }
    if (self.searchResult.count != 0) {
        p = (SearchData *)self.searchResult[indexPath.row];
    } else {
        p = (SearchData *)self.products[indexPath.row];
    }
    
    cell.textLabel.text = p.name;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    NSMutableArray *results = [[NSMutableArray alloc] init];
//    for (SearchData *data in self.products) {
//        NSRange rang = [data.name rangeOfString:searchText];
//        if (rang.length > 0) {
//            [results addObject:data];
//        }
//    }
//    self.searchResult = results;
    //
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"self contains[c]%@",searchText];
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (SearchData *data in self.products) {
        if ([pred evaluateWithObject:data.name]) {
            [results addObject:data];
        } else {
            [results removeAllObjects];
        }
    }
    self.searchResult = results;
    
    [self.tableView reloadData];
    
}


//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
//    NSMutableArray *results = [[NSMutableArray alloc] init];
//    for (SearchData *data in self.products) {
//        NSRange rang = [data.name rangeOfString:searchBar.text];
//        if (rang.length > 0) {
//            [results addObject:data];
//        }
//    }
//    self.searchResult = results;
//    
//    return YES;
//}
//
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
//    if (self.searchResult.count != 0) {
//        [self.tableView reloadData];
//        return YES;
//    } else {
//        return NO;
//    }
//}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self updateProductName:searchString type:self.searchDisplayController.searchBar.selectedScopeButtonIndex];
    
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    [self updateProductName:self.searchDisplayController.searchBar.text type:searchOption];
    return YES;
}

- (void)updateProductName:(NSString *)productName type:(NSInteger)type {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (SearchData *s in self.products) {
        NSRange range = [s.name rangeOfString:productName];
        if (s.type == type && range.length >0) {
            [result addObject:s];
        }
    }
    self.searchResult = result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewController *tcvc = [[TestCollectionViewController alloc] init];
//    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:tcvc animated:YES];
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
