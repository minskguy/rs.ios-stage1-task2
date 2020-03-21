#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    int dayInt = [day intValue];
    int monthInt = [month intValue];
    int yearInt = [year intValue];
    
    NSLog(@"%d", (yearInt%100)%4);
    if (monthInt > 12 || monthInt < 1 || ((yearInt%100)%4 != 0 && dayInt > 28))
        return @"Такого дня не существует";
    
    NSArray<NSString*> *months = [NSArray arrayWithObjects:
                                 @"января",
                                 @"февраля",
                                 @"марта",
                                 @"апреля",
                                 @"мая",
                                 @"июня",
                                 @"июля",
                                 @"августа",
                                 @"сентября",
                                 @"октября",
                                 @"ноября",
                                 @"декабря", nil];
    NSArray<NSString*> *daysOfTheWeek = [NSArray arrayWithObjects:
                                         @"воскресенье",
                                         @"понедельник",
                                         @"вторник",
                                         @"среда",
                                         @"четверг",
                                         @"пятница",
                                         @"суббота", nil];
    int yearIndex = (yearInt%100)/12 + (yearInt%100)%12 + ((yearInt%100)%12)/4;
    int monthIndex = 0;
    switch (monthInt) {
        case 1:
        case 10:
            monthIndex = 6;
            break;
        
        case 2:
        case 3:
        case 11:
            monthIndex = 2;
            break;
            
        case 4:
        case 7:
            monthIndex = 5;
            break;
        
        case 5:
            monthIndex = 0;
            break;
            
        case 6:
            monthIndex = 3;
            break;
            
        case 8:
            monthIndex = 1;
            break;
            
        case 9:
        case 12:
            monthIndex = 4;
            break;
    }
    int centuaryIndex = 0;
    if (yearInt < 2000) centuaryIndex = 1;
    int leapYearIndex = 0;
    if ((yearInt%100)%4 == 0 && (monthInt == 1 || monthInt == 2)) leapYearIndex = -1;
    int dayOfTheWeek = (yearIndex+monthIndex+dayInt+leapYearIndex+centuaryIndex)%7;
    
    NSMutableString *result = [NSMutableString stringWithFormat:@"%d %@, %@", dayInt, [months objectAtIndex:monthInt-1], [daysOfTheWeek objectAtIndex:dayOfTheWeek]];
    
    return result;;
}

@end
