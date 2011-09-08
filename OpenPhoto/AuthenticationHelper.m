//
//  AuthenticationHelper.m
//  OpenPhoto
//
//  Created by Patrick Santana on 07/09/11.
//  Copyright (c) 2011 OpenPhoto. All rights reserved.
//

#import "AuthenticationHelper.h"

@implementation AuthenticationHelper


- (BOOL) isValid{
    /*
     * check if the client id is valid. 
     * Possible values: nil, INVALID or other
     *
     * If it is nil or text INVALID, return that is INVALID = NO
     */
    if (![[NSUserDefaults standardUserDefaults] stringForKey:kAuthenticationClientId] || 
        [[[NSUserDefaults standardUserDefaults] stringForKey:kAuthenticationClientId] isEqualToString:@"INVALID"]){
        return NO;
    }
    
    // otherwise return that it is valid
    return YES;
}

- (void) invalidateClientId{
    // set the variable client id to INVALID
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setValue:@"INVALID" forKey:kAuthenticationClientId];
    
    // synchronize the keys
    [standardUserDefaults synchronize];
}
@end
