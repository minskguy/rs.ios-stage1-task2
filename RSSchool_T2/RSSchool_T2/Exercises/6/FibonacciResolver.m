#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int beforePrevious = 0, previous = 1, current = 1;
    while (current*previous < [number intValue]) {
        beforePrevious = previous;
        previous = current;
        current = beforePrevious + previous;
    }
    if (current*previous == [number intValue])
        return @[[NSNumber numberWithInt:previous],[NSNumber numberWithInt:current], [NSNumber numberWithInt:1]];
    else return @[[NSNumber numberWithInt:previous],[NSNumber numberWithInt:current], [NSNumber numberWithInt:0]];
}
@end
