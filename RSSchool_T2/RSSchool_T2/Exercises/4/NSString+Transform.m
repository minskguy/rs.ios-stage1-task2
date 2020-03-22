#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    BOOL isPangram = true;
    NSMutableString *string = [NSMutableString stringWithString:self];
    NSString *alphabet = [NSString stringWithFormat: @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    NSString *vowels = [NSString stringWithFormat:@"AOIUYE"];
    NSString *constants = [NSString stringWithFormat:@"QWRTPSDFGHJKLZXCVBNM"];
    
    NSMutableArray<NSString*> *words = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray<NSNumber*> *wordsNumbers = [NSMutableArray arrayWithCapacity:0];
    
    for (int i = 0; i < [alphabet length]; i++) {
        char temp = [alphabet characterAtIndex:i];
        if (![string containsString:[NSString stringWithFormat:@"%c", temp]] &&
            ![string containsString:[NSString stringWithFormat:@"%c", temp+32]]) {
            isPangram = false;
            break;
        };
    }
    
    NSString *arrayNeeded;
    if (isPangram) arrayNeeded = vowels;
    else arrayNeeded = constants;
    
    for (int i = 0; i < [string length]; i++) {
        if ([string characterAtIndex:i] != ' ') {
            NSMutableString *tempString = [NSMutableString stringWithString:@""];
            unichar tempChar = [string characterAtIndex:i];
            int count = 0;
            while (tempChar != ' ') {
                if (tempChar >= 97 && tempChar <= 122) {
                    if ([arrayNeeded containsString:[NSString stringWithFormat:@"%C", (unichar)(tempChar-32)]]) {
                        tempChar -= 32;
                        count++;
                    }
                }
                else if ([arrayNeeded containsString:[NSString stringWithFormat:@"%C", tempChar]])
                    count++;
                [tempString appendString:[NSString stringWithFormat:@"%C", tempChar]];
                if (i+1 == [string length]) break;
                else i++;
                tempChar = [string characterAtIndex:i];
            }
            [words addObject:tempString];
            [wordsNumbers addObject: [NSNumber numberWithInt:count]];
        }
    }
    if ([words count] == 0) return @"";
    
    for (int i = 0; i < [words count]-1; i++) {
        for (int j = 0; j < [words count]-i-1; j++) {
            if ([[wordsNumbers objectAtIndex:j] intValue] > [[wordsNumbers objectAtIndex:j+1] intValue]) {
                [words exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                [wordsNumbers exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    for (int i = 0; i < [words count]; i++) {
        [result appendString:[NSString stringWithFormat:@"%d%@ ",
                              [[wordsNumbers objectAtIndex:i] intValue],
                              [words objectAtIndex:i]]];
    }
    [result deleteCharactersInRange:NSMakeRange([result length]-1, 1)];
    
    return result;
}

@end
