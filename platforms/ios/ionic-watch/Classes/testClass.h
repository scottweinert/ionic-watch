//
//  testClass.h
//  ionic-watch
//
//  Created by Scott Weinert on 4/27/15.
//
//

#import <Foundation/Foundation.h>
#import "MMWormhole.h"
@interface testClass : NSObject
@property (nonatomic, strong) MMWormhole* wormhole;
@property (weak, nonatomic) UILabel *testLabel;
@end
