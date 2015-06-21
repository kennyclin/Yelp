//
//  YelpClient.m
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "YelpClient.h"
#import "BDBOAuth1RequestSerializer.h"

NSString * const kYelpConsumerKey = @"3YRn-K3weMWMYvh-789R_g";
NSString * const kYelpConsumerSecret = @"e8_d4nZ3xiTnWzbRwrrfs6QTyUw";
NSString * const kYelpToken = @"SCMjzWvS-HZiM8NPyCIJmxKRmIxWvojs";
NSString * const kYelpTokenSecret = @"P2lv-9M7483HpINwXu22gBfW4q0";

@implementation YelpClient

- (id)initWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken accessSecret:(NSString *)accessSecret {
    NSURL *baseURL = [NSURL URLWithString:@"http://api.yelp.com/v2/"];
    self = [super initWithBaseURL:baseURL consumerKey:consumerKey consumerSecret:consumerSecret];
    if (self) {
        BDBOAuthToken *token = [BDBOAuthToken tokenWithToken:accessToken secret:accessSecret expiration:nil];
        [self.requestSerializer saveAccessToken:token];
    }
    return self;
}

-(id)initWithDefaultKey {
    return [self initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
}

- (AFHTTPRequestOperation *)searchWithTerm:(NSString *)term success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
    NSDictionary *parameters = @{@"term": term, @"ll" : @"37.774866,-122.394556"};   // Bay Area?
   // NSDictionary *parameters = @{@"term": term, @"ll" : @"25.022642,121.531197"};  // home
    
    return [self GET:@"search" parameters:parameters success:success failure:failure];
}

@end
