//
//  ObjCRuntimeHelpers.h
//
//
//  GitHub
//  https://github.com/DevonBoyer/DBEmptyState
//
//
//  Created by Devon Boyer on 2015-06-10.
//  Copyright (c) 2014 Devon Boyer. All rights reserved.
//
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

void db_swizzle(Class c, SEL orig, SEL new);