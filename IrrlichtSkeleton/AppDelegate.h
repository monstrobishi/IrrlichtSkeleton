//
//  AppDelegate.h
//  IrrlichtSkeleton
//
//  Created by Ahmed Hilali on 12/05/13.
//  Copyright (c) 2013 Ahmed Hilali. All rights reserved.
//

#include <irrlicht.h>

class IrrlichtApp
{
    irr::IrrlichtDevice* device;
public:
    void initialize();
    void update();
    void destroy();
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow* window;
    IrrlichtApp app;
}
@property (strong, nonatomic) UIWindow *window;
@end