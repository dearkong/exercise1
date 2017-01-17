//
//  main.m
//  haha
//
//  Created by cheyipai.com on 16/11/23.
//  Copyright © 2016年 kong. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int i = 2;
        void (^myBlock)() = ^ {
        
            printf("i的值是：%d\n",i);
            
        };
        i = 3;
        myBlock ();
    }
    return 0;
}
