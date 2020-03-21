#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    if ([minutes intValue] > 59 ||
        [minutes intValue] < 0 ||
        [hours intValue] > 23 ||
        [hours intValue] < 0)
        return @"";
   NSString *result;
   NSArray<NSString*> *time = [NSArray arrayWithObjects:
                               @"o' clock",
                               @"one", @"two", @"three", @"four", @"five",
                               @"six", @"seven", @"eight", @"nine", @"ten",
                               @"eleven", @"twelve", @"thirteen", @"fourteen", @"quarter",
                               @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty",
                               @"twenty one", @"twenty two", @"twenty three", @"twenty four",
                               @"twenty five", @"twenty six", @"twenty seven", @"twenty eight",
                               @"twenty nine", @"half", nil];
    if ([minutes intValue] == 0)
        result = [NSString stringWithFormat:@"%@ %@",
                  [time objectAtIndex:[hours intValue]],
                  [time objectAtIndex:0]];
    else if ([minutes intValue] >= 1 && [minutes intValue] <= 30) {
        if ([minutes intValue] == 15 || [minutes intValue] == 30)
            result = [NSString stringWithFormat: @"%@ past %@",
                      [time objectAtIndex:[minutes intValue]],
                      [time objectAtIndex:[hours intValue]]];
        else
            result = [NSString stringWithFormat:@"%@ minutes past %@",
                  [time objectAtIndex:[minutes intValue]],
                  [time objectAtIndex:[hours intValue]]];
    }
    else {
        if (60-[minutes intValue] == 15)
            result = [NSString stringWithFormat: @"%@ to %@",
                      [time objectAtIndex:60-[minutes intValue]],
                      [time objectAtIndex:[hours intValue]+1]];
        else
            result = [NSString stringWithFormat:@"%@ minutes to %@",
                      [time objectAtIndex:60-[minutes intValue]],
                      [time objectAtIndex:[hours intValue]+1]];
    }
    
    return result;
}
@end
