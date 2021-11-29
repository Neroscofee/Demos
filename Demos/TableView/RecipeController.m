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
 
 复活石 传说 10费
 立即原位置复活最后阵亡的两个单位
 
 骚扰虻 稀有 3费
 空中单位,移动速度极快
 接触到敌人混乱敌人,使敌方下一个可造成直接伤害的魔咒对敌人自己施放
 
 隐形衣 传说 2费
 隐身2秒免疫一切伤害
 
 老魔杖 传说 8费
 装备老魔杖,接下来10秒内普攻与魔咒攻击伤害提升100%,若是召唤生物,则生物提升50%的移速与30%的攻速
 
 小矮星彼得的回响
 每受到400点伤害,获得一张1费回溯牌,打出回溯牌自身变为一只老鼠,获得一层伤害吸收盾及一次魔法免疫,持续5秒,时间结束后吸收盾的伤害以自身为中心爆炸造成伤害
 
 邓布利多的回响
 每使用两张大于等于5费的魔咒,获得一张0费魔咒大师卡,该卡有七种随机效果,
 赤色卡:隐身持续2秒,免疫一切伤害
 橙色卡:召唤一道从天而降的天火打击敌人,2秒后在施法位置造成对方当前血量10%的伤害
 黄色卡:闪现,原地留下幻影,幻影反伤350%的攻击伤害
 绿色卡:立即回复目标单位满血15%的血量
 蓝色卡:水牢,伤害与控制效果只有正常水牢的四分之一
 靛色卡:移除目标区域内友方的debuff(眩晕控制持续掉血等)并对区域内的敌方召唤生物造成20%的当前生命值伤害
 紫色卡:打出紫色卡会出现格林德沃,复制你下一个使用的魔咒,并与你攻击相同的目标
 
 伏地魔的回响
 将起始血量分为七份作为自己生命值参与战斗,每次复生获得一张0费阿瓦达,使用自己的第1 2份生命时,阿瓦达为1层,为3 4时,阿瓦达为2层,为5 6时阿瓦达为3层,为7时是满层阿瓦达
 
}
*/

@end
