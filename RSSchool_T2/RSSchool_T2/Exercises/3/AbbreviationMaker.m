#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    BOOL deleteFlag = false;
    NSMutableString *string = [NSMutableString stringWithString:a];
    for (int i = 0; i < [string length]; i++) {
        if (deleteFlag) {
            i--;
            deleteFlag = false;
            
        }
        char temp = [string characterAtIndex:i];
        if (temp >= 97 && temp <= 122) {
            temp -= 32;
            if (![b containsString: [NSString stringWithFormat:@"%c", temp]]) {
                [string deleteCharactersInRange:NSMakeRange(i, 1)];
                deleteFlag = true;
            }
        }
        else if (![b containsString: [NSString stringWithFormat:@"%c", temp]])
            return @"NO";
    }
    string = [NSMutableString stringWithString:[string uppercaseString]];
    if ([string isEqualToString:b])
        return @"YES";
    else
        return @"NO";
}
@end
