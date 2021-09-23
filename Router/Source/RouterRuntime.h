//
//  RouterRuntime.h
//  Router
//
//  Created by 智子 on 2021/9/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


#ifndef RouterNodeImpSectName
#define RouterNodeImpSectName "RouterNodeImp"
#endif

#define RouterDATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))

#define RouterNodeRegist(name) \
char * k##name##_router_node RouterDATA(RouterNodeImp) = ""#name"";

@interface RouterRuntime : NSObject
@end

NS_ASSUME_NONNULL_END
