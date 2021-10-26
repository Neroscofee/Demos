//
//  Scene.m
//  Demos
//
//  Created by Neroscofee on 2021/10/26.
//  Copyright © 2021 Neroscofee. All rights reserved.
//

#import "Scene.h"

@implementation Scene

- (void)didMoveToView:(SKView *)view {
    
}

- (void)update:(CFTimeInterval)currentTime {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (![self.view isKindOfClass:[ARSKView class]]) {
        return;
    }
    
    //class ARSKView (英文)
    //这个视图让您可以利用 SpriteKit 呈现 AR 体验。
    ARSKView *sceneView = (ARSKView *)self.view;
    ARFrame *currentFrame = [sceneView.session currentFrame];
    
    if (currentFrame) {
        matrix_float4x4 translation = matrix_identity_float4x4;
        translation.columns[3].z = -0.2;
        matrix_float4x4 transform = matrix_multiply(currentFrame.camera.transform, translation);
        
        
        //class ARAnchor (英文)
        //关注对象在物理环境中的位置和方向。
        ARAnchor *anchor = [[ARAnchor alloc] initWithTransform:transform];
        [sceneView.session addAnchor:anchor];
    }
    
    
}




@end
