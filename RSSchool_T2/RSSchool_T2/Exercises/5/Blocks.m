#import "Blocks.h"

@implementation Blocks

- (instancetype)init
{
    self = [super init];
    if (self) {
        _blockA = ^(NSArray *array){};
        _blockB = ^(Class class){};
        _blockC = ^(NSObject *result){};
    }
    return self;
}

@end

