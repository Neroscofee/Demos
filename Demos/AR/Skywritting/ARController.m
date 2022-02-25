//
//  ARController.m
//  Demos
//
//  Created by Neroscofee on 2021/10/26.
//  Copyright © 2021 Neroscofee. All rights reserved.
//

#import "ARController.h"
#import "Scene.h"

@interface ARController ()<ARSKViewDelegate>
{
    NSInteger num;
    NSArray *arr;
}

@property (nonatomic, strong) ARSKView *sceneView;


@end

@implementation ARController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"空中文字";
    
    num = 0;
    arr = [NSArray arrayWithObjects:@"郭总",@"智总",@"朝总",@"北爷", nil];
    
    
    [self.view addSubview:self.sceneView];
    self.sceneView.delegate = self;
    self.sceneView.showsFPS = YES;
    self.sceneView.showsNodeCount = YES;
    
    Scene *scene = (Scene *)[SKScene nodeWithFileNamed:@"Scene"];//加载那个Scene文件
    [self.sceneView presentScene:scene];
    // Do any additional setup after loading the view.
}

- (ARSKView *)sceneView {
    if (!_sceneView) {
        _sceneView = [[ARSKView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_NavigationBar_Height-Fit_Bottom_Safe_Height)];
    }
    return _sceneView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.sceneView.session pause];
}

#pragma mark - ARSKViewDelegate
- (SKNode *)view:(ARSKView *)view nodeForAnchor:(ARAnchor *)anchor {
    if (num >= arr.count) {
        num = 0;
    }
    SKLabelNode *labelNode = [SKLabelNode labelNodeWithText:[arr objectAtIndex:num]];
    labelNode.fontSize = 12;
    labelNode.fontColor = [UIColor randomColor];
//    if (num < 6) {
//        labelNode.fontColor = [UIColor blueColor];
//    } else if (num >= 6 && num <= 14) {
//        labelNode.fontColor = [UIColor redColor];
//    } else {
//        labelNode.fontColor = [UIColor orangeColor];
//    }
    labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    num++;
    return labelNode;
}

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
 
 9级  1张
 10级 2张
 11级 4张
 12级 7张
 13级 12张
 14级 20张
 15级 32张
 你先把所有金卡是几级列出来,然后再去数每张里多的相加就好了啊
 比如
 哈利11 赫敏11 麦格11 罗恩10
 飞贼10 钻心10 阿瓦达10 水牢10 龙蛋11 白龙10 凤凰10 闪电10 厉火10 石墩10
 
 
*/

@end
