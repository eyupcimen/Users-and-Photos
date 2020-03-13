//
//  AppSpector.h
//  AppSpectorSDK
//
//  Created by Techery on 5/18/17.
//  Copyright © 2017 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppSpectorConfig.h"
#import "ASExternalEvent.h"
#import "ASAppSpectorLogger.h"
#import "ASCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppSpector : NSObject

/// Starts AppSpector using provided config.
/// First loads and starts configured monitors then establishes session with backend using provided key.
/// Does nothing if AppStore environment detected.
/// @param config AppSpetorConfig instance providing API key, list of monitors to load and metadata.
+ (void)runWithConfig:(AppSpectorConfig *)config;


/// API to manually start and stop SDK
+ (void)start;
+ (void)stop;

/// Current SDK state. `YES` means SDK either working and session is online or in a process of starting it.
+ (BOOL)isRunning;

/// API for external evvents, used by Flutter plugin and some other integrations.
/// If you believe you need this - fell free to contact AppSpector guys for help: mailto:info@appspector.com.
/// @param event ASExternalEvent event model to be passed to SDK monitors
+ (void)sendEvent:(ASExternalEvent *)event;


/// Updates metadata associated with current session. Overwrites metadata.
/// @param metadata ASMetadata
+ (void)updateMetadata:(ASMetadata *)metadata;

/// Updates metadata value. If key was not found - adds it with a passed value.
/// @param value id
/// @param key ASMetadataKey. Only supported key for now is `AS_DEVICE_NAME_KEY` which overwrites device name in sessions list.
+ (void)updateMetadataValue:(id)value forKey:(ASMetadataKey *)key;


/// Adds command to work with Commands monitor
/// @param commandClass Class of the command to add. Instance will be passed as an argument to the callback.
/// @param callback     ASCommandBlock called when command is run. Command instance is passed as an argument.
///                     Either `fail` or `complete` should be called during block execution to finish the command.
+ (void)addCommand:(Class)commandClass withCallback:(ASCommandBlock)callback;

@end

NS_ASSUME_NONNULL_END
