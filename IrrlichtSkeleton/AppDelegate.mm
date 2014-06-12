#import "AppDelegate.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

using namespace irr;

#pragma comment(lib, "Irrlicht.lib")

void IrrlichtApp::initialize()
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    SIrrlichtCreationParameters param;
    param.DriverType = video::EDT_OGLES2;
    param.WindowSize = core::dimension2d<u32>(0,0);
    param.WindowId = delegate.window;
    param.Bits = 24;
    param.ZBufferBits = 16;
    param.AntiAlias  = 0;
    
    device = createDeviceEx(param);
}

void IrrlichtApp::update()
{
    while (device)
    {
        NSAutoreleasePool* tPool = [[NSAutoreleasePool alloc] init];
        while(CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.002f, TRUE) == kCFRunLoopRunHandledSource);
        [tPool release];
        
        if(device->run())
        {
            device->getVideoDriver()->beginScene(true, true, video::SColor(0,100,0,0));
            device->getSceneManager()->drawAll();
            device->getGUIEnvironment()->drawAll();
            device->getVideoDriver()->endScene ();
        }
    }
}

void IrrlichtApp::destroy()
{
    device->drop();
}

@implementation AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication*)application
{
    app.initialize();
    [self performSelectorOnMainThread:@selector(applicationUpdate) withObject:nil waitUntilDone:NO];
}

- (void) applicationUpdate
{
	app.update();
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // you should pause rendering here, because some iOS versions,
    // doesn't allow to send OpenGL rendering commands, when app
    // is inactive.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // you should unpause rendering here.
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // you should pause rendering here, because some iOS versions,
    // doesn't allow to send OpenGL rendering commands, when app
    // is inactive.
}

- (void)applicationDidBecomeActive:(UIApplication *)application 
{
    // you should unpause rendering here.
}

- (void)applicationWillTerminate:(UIApplication *)application 
{
    app.destroy();
}

- (void)dealloc 
{
	[window release];
	[super dealloc];
}
@end