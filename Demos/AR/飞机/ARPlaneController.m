//
//  ARPlaneController.m
//  Demos
//
//  Created by Neroscofee on 2021/10/26.
//  Copyright © 2021 Neroscofee. All rights reserved.
//

#import "ARPlaneController.h"

@interface ARPlaneController ()<ARSCNViewDelegate, ARSessionDelegate>

@property (nonatomic, strong) ARSCNView *arscnView;

@end

@implementation ARPlaneController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"鲫鱼号飞船";
    
    [self.view addSubview:self.arscnView];
    self.arscnView.delegate = self;
    self.arscnView.showsStatistics = YES;
    
    self.arscnView.session = [[ARSession alloc] init];
    
    SCNScene *scene = [SCNScene sceneNamed:@"tool.scnassets/ship.scn"];
    self.arscnView.scene = scene;
    
    // Do any additional setup after loading the view.
    
}

- (ARSCNView *)arscnView {
    if (!_arscnView) {
        _arscnView = [[ARSCNView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_NavigationBar_Height-Fit_Bottom_Safe_Height)];
    }
    return _arscnView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    configuration.planeDetection = ARPlaneDetectionHorizontal;
    configuration.lightEstimationEnabled = YES;

    // Run the view's session
    [self.arscnView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.arscnView.session pause];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1. 使用场景加载scn文件
    SCNScene *scene = [SCNScene sceneNamed:@"tool.scnassets/ship.scn"];
    
    SCNNode *shipNode = scene.rootNode.childNodes.firstObject;
    shipNode.position = SCNVector3Make(0, -1, -1);
    
    [self.arscnView.scene.rootNode addChildNode:shipNode];
}

#pragma mark - ARSCNViewDelegate

/*
// Override to create and configure nodes for anchors added to the view's session.
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    SCNNode *node = [SCNNode new];
 
    // Add geometry to the node...
 
    return node;
}
*/

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
*/

@end
