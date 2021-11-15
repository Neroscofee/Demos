//
//  SurveyController.m
//  Demos
//
//  Created by Neroscofee on 2021/11/11.
//  Copyright © 2021 Neroscofee. All rights reserved.
//

#import "SurveyController.h"

@interface SurveyController ()<ARSCNViewDelegate>

@property (nonatomic, strong) ARSCNView *arscnView;
@property (nonatomic, strong) ARWorldTrackingConfiguration *arWorldTrackingConfiguration;


@end

@implementation SurveyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"监测水平面放置物品";
    
    [self.view addSubview:self.arscnView];
    self.arscnView.delegate = self;
    
    self.arscnView.session = [[ARSession alloc] init];
    self.arWorldTrackingConfiguration = [[ARWorldTrackingConfiguration alloc] init];
    //设置追踪方向,追踪平面
    self.arWorldTrackingConfiguration.planeDetection = ARPlaneDetectionHorizontal;
    self.arWorldTrackingConfiguration.lightEstimationEnabled = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.arscnView.session runWithConfiguration:self.arWorldTrackingConfiguration];
}

- (ARSCNView *)arscnView {
    if (!_arscnView) {
        _arscnView = [[ARSCNView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_NavigationBar_Height-Fit_Bottom_Safe_Height)];
    }
    return _arscnView;
}

#pragma mark - ARSCNViewDelegate
// 添加节点的时候调用(当开启平地捕捉模式之后，如果捕捉到平地，ARKit会自动添加一个平地节点)
- (void)renderer:(id<SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    if (![anchor isMemberOfClass:[ARPlaneAnchor class]]) {
        return;
    }
    // 添加一个3D平面模型，ARKit只有捕捉能力，锚点只是一个空间位置，想更加清楚看到这个空间，我们需要给控件添加一个平地的3D模型来渲染它
    // 1. 获取捕捉到的平地锚点
    ARPlaneAnchor *planeAnchor = (ARPlaneAnchor *)anchor;
    // 2. 创建一个3D模型(系统捕捉到的平地是一个不规则的大小长方形，这里笔者q将其变成一个长方形，并且对平地做了一个缩放效果)
    // 参数分别是长、宽、高、圆角
    SCNBox *planeBox = [SCNBox boxWithWidth:planeAnchor.extent.x*0.3 height:0 length:planeAnchor.extent.x*0.3 chamferRadius:0];
    // 3. 使用Material渲染3D模型(默认模型是白色的)
    planeBox.firstMaterial.diffuse.contents = [UIColor clearColor];
    // 4. 创建一个基于3D物体模型的节点
    SCNNode *planeNode = [SCNNode nodeWithGeometry:planeBox];
    // 5. 设置节点的位置为捕捉到的平地的锚点的中心位置
    // SceneKit中节点的位置position是一个基于3D坐标系的矢量坐标SCNVector3Make
    planeNode.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z);
    
    [node addChildNode:planeNode];
     
    //4 5 6 2.4
    //50
    //2 2 4 5 6 __ 7 12 14
    //
    //19 38 57
    //17 34 51
    
}


/*
 游走球>>凯文
 11+1凯文的属性是18+1 凯文要24次攻击叠这18+1 即24次攻击满我才可以加19点攻击 满24次攻击才能获得+1凯文提供的+1点攻击
 坐标殿堂 凯文出来就被解了 只能A出大概4-6下 也就是加成 1/24*(4~6)=0.17~0.25点攻击 换算成200%的幻象攻击伤害是 0.34~0.5每次的幻象伤害
 11+1游走球单次伤害是 37+3 终结伤害112+8 总伤482+38 这个加成是怎么算的呢 即5个游走来回即10次弹射 单次+3 总就是3*10+8=38 +1游走球的伤害加成是38(全部命中)

 我看了下自己的历史数据
 游走球整场使用6~10 闪现在20~30次
 +1游走球的整场加成是 6*38~10*38 228~380的总伤
 +1凯文的整场加成是 0.5*20~0.5*30 10~15的总伤
 太少?那算24次A满+1 那么整场加成是20~30的伤害加成 有人说不对 我这个+1的伤害加成还算在平时走位平A里 好吧 那再来 我算你整场都在A对面 A了对面100次 攻击加成是100 整场总伤害加成是幻象的20~30+100 即120~130的伤害加成
 而游走球是228~380的总伤加成 并不是所有游走球都能命中 那么减半 即114~190的总伤加成 仍然大于凯文的极端加成伤害(A满24且整场A了对面100下) 120~130
 综上 结论是+1游走球>>+1凯文 甚至你+1游走球比你+2凯文还重要
 多比回响里最重要的就是游走球加成
 
 
 
 历史数据 每场战斗大概幻象可以生成24~26次
 
 假设每次接球都接到 即接五次球 接5次球可以产生2~3次幻象(走3次闪2次接球是2个幻象 走2次闪3次接球是3个幻象)
 那么幻象加成的伤害按最高10来算 即每次接球 20~30的幻象加成伤害 对比游走球造成的总伤38伤害的加成是少的

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
