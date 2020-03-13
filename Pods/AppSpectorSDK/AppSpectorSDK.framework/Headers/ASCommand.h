//
//  ASCommand.h
//  AppSpectorSDK
//
//  Created by Deszip on 20.08.2019.
//  Copyright © 2019 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ASCommand;
typedef void(^ASCommandBlock)(__kindof ASCommand *command);
typedef void(^ASCommandCompletion)(_Nullable id result);
typedef void(^ASCommandFailure)(void);

@interface ASCommand : NSObject

@property (class, copy, nonatomic, readonly) NSString *name;
@property (class, copy, nonatomic, readonly) NSString *category;
@property (class, copy, nonatomic, readonly) NSString *identifier;

@property (copy, nonatomic) ASCommandCompletion complete;
@property (copy, nonatomic) ASCommandFailure fail;

@end

NS_ASSUME_NONNULL_END
