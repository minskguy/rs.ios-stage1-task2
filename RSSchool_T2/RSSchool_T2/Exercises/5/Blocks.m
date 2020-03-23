#import "Blocks.h"

@interface Blocks()

@property (nonatomic, copy) NSArray *array;

@end

@implementation Blocks

-(BlockA)blockA{
    return [^(NSArray *array){self.array = array;} copy];
}

-(BlockB)blockB{
    return [^(Class class) {
        if (class == [NSString class]) {
            NSMutableString *result = [NSMutableString stringWithString:@""];
            for (int i = 0; i < [self.array count]; i++)
                if ([[self.array objectAtIndex:i] isKindOfClass:class])
                    [result appendString:[self.array objectAtIndex:i]];
            NSLog(@"%@", result);
            self.blockC(result);
        }
        else if (class == [NSNumber class]) {
            int result = 0;
            for (int i = 0; i < [self.array count]; i++)
                if ([[self.array objectAtIndex:i] isKindOfClass:class])
                    result+=[[self.array objectAtIndex:i] intValue];
            self.blockC([NSNumber numberWithInt:result]);
        }
        else {
            NSDate *dateNeeded = [NSDate new];
            for (int i = 0; i < [self.array count]; i++)
                if ([[self.array objectAtIndex:i] isKindOfClass: class]
                    && [[self.array objectAtIndex:i] compare:dateNeeded] == NSOrderedDescending)
                    dateNeeded = [self.array objectAtIndex:i];
            NSDateFormatter *ddmmyyyy = [NSDateFormatter new];
            ddmmyyyy.dateFormat = @"dd.MM.yyyy";
            self.blockC([ddmmyyyy stringFromDate:dateNeeded]);
        }
    } copy] ;
}

@end

