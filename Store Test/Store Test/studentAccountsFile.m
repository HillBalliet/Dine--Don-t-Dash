//
//  studentAccountsFile.m
//  Store Test
//
//  Created by Hill Balliet on 1/24/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "studentAccountsFile.h"

@implementation studentAccountsFile

- (studentAccounts*) ramsey{
    if (!ramsey) {
        ramsey = [[studentAccounts alloc] initWithInformation:2015 :@1111 :@"Ramsey Rossmann"];
    }
    
    return ramsey;
}

- (NSString *)getDocumentDirectory{
    fileManager = [NSFileManager defaultManager];
    homeDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    return homeDirectory;
}

- (NSString *)setFilename{
    return @"List of Student Accounts";
}

#pragma mark - Read Methods

- (studentAccounts*) getStudentWithID: (NSString*) studentID{
    for (int i = 0; i < allStudents.count; i++) {
        if ([[[allStudents objectAtIndex: i] idNumber] isEqualToString: studentID]) {
            return [allStudents objectAtIndex:i];
        }
    }
    return genericStudent;
}

- (NSMutableArray*) allStudents{
    NSString *txtInFile;
    
    while (true) {
        if (!allStudents) {
            allStudents = [[NSMutableArray alloc] init];
        }
        
        filePath = [[NSString alloc] init];
        NSError *error;
        filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:self.setFilename];
        txtInFile = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
        
        if(!txtInFile)
        {
            [self writeArrayToFile:[[NSMutableArray alloc] initWithArray:@[@"Adam Aldaher", @"Zack Aldaher", @"Rakim Ali", @"Kendall Allen", @"Noel Anderson", @"Spence Bailey", @"Julianne Baker", @"Quinn Balazs", @"Hill Balliet", @"Margot Balliet", @"John Banks", @"Jaden Barney", @"McKenna Barney", @"Clarence Barr", @"Thomas Barr", @"Savannah Barrow", @"Sydney Barrow", @"Evelyn Baxley", @"Griffin Baxley", @"Johnny Baxley", @"Charlotte Benedict", @"Blake Benoit", @"Lynn Berger", @"Miriam Bernard", @"Ashlynn Berry", @"Jasmine Berry", @"Margaret Blackerby", @"Sebastian Black", @"Nikki Bogan", @"Caroline Borden", @"Sarah Brabston", @"Cassidy Bridgham", @"David Brockington", @"Andrew Bruno", @"Parker Bryant", @"Will Bryant", @"Josh Cain", @"Caleb Caldwell", @"Ehney Camp", @"Cole Cassidy", @"Elquis Castillo", @"Chandler Cullen", @"Mei Shou Chen", @"Sienna Chen", @"Claudia Choi", @"Jeffrey Choi", @"Jung In Choi", @"Rose Choi", @"Yoon Choi", @"Zach Choi", @"Lizzie Choy", @"Skylar Clark", @"Eli Cohen", @"Molly Cohn", @"Joseph Copeland", @"Joshua Copeland", @"Will Crain", @"Albert Dascher", @"Alex Daugherty", @"Graham Daugherty", @"Stella Davis", @"Alistair Delchamps", @"Katherine DePalma", @"Liz Dillard", @"Katie Dix", @"Reeves Duggan", @"Dala Eloubeidi", @"Samih Eloubeidi", @"Erin Ertunga", @"Parker Erwin", @"Tina Etminan", @"Zach Falkner", @"Arlen Fan", @"Frank Fan", @"Mac Farley", @"Virginia Farley", @"Emily Fleisig", @"Julia Fleisig", @"Tyler Fondren", @"David Fox", @"Jana Freialdenhoven", @"Malu Geschwandtner", @"Sherry Ge", @"Henry Giattina", @"Sophia Giattina", @"Elliot Gibbs", @"Ellie Goldfarb", @"Ben Goodman", @"Catherine Grady", @"Ashley Graham", @"Josy Gray", @"Isaac Griffin-Layne", @"Sarah Guillaume", @"Matias Gutierrez", @"Majd Habash", @"Ameer Hakim", @"Rachel Hancock", @"Ambria Hardy", @"Harvey He", @"Jingyu He", @"Alex Hedberg", @"Stephen Himic", @"David Hobdy", @"Karl Hofammann", @"Riley Hogan", @"Jessie Hook", @"William Hooker", @"Jalen Houston", @"Elizabeth Hunt", @"DJ Hunter", @"Kenechi Ijemere", @"Jaylan Jacobs", @"Grace Ji", @"Mike Jin", @"Patrick Jin", @"Hannah Johnson", @"Priscilla Jones", @"Sam Jones", @"Will Jones", @"Garrett Jordan", @"Terry Jordan", @"Harry Jun", @"Jay Jung", @"Daniel Kang", @"Danny Kang", @"Daler Karassayev", @"Noah Karle", @"Ulysses Keevan-Lynch", @"Jesse Kieve", @"Jennie Killebrew", @"Eui Hyun Kim", @"Ji Ye Kim", @"Kevin Kim", @"Lisa Kim", @"Min Gu Kim", @"Tina Kim", @"Makenzie King", @"Paris Kissel", @"Benjamin Kitchens", @"Max Klapow", @"Elorm Kluvitse", @"Billy Knapp", @"Emma Knapp", @"Mack Krell", @"Alex Kristjansson", @"Sue Hyun Kwon", @"Noah Lapidus", @"Matthew Lash", @"Amber Latimer", @"Ashley Leader", @"Ashley Lee", @"Daun Lee", @"Matthew Lee", @"Michael Lee", @"Callie Leopard", @"Robert Lichenstein", @"Oscar Lin", @"Yicheng Lin", @"Nick Long", @"Bowen Lu", @"Nicole Luo", @"Bellona Ma", @"Erica Ma", @"Abbey Macklin", @"Wesley Madden", @"Caroline Malone", @"Tara Markert", @"Meghan Marks", @"Alice Marson", @"Jake Martin", @"Cori Mazer", @"Hannah Jane McCarty", @"Cameron McDonald", @"Hugh McElderry", @"Connor McGarty", @"Jack McGuire", @"Marty McGuire", @"Daniel McMahon", @"Hannah McRight", @"Ashley Morris", @"Sydney Morris", @"Rachael Motamed", @"Slavin Mu", @"Annabelle Neville", @"Sam Newton", @"Sarah Noone", @"Fletcher North", @"Guy Nsanza", @"Joselyne Nsanza", @"Josianne Nsanza", @"Jisu Oh", @"Jack O'Malley", @"Michael O'Malley", @"Lia Orcutt", @"Sam Orcutt", @"Gabi Oser", @"Austin Pack", @"Yuzhao Pan", @"Ji Soo Park", @"Seth Perlman", @"Makayla Phillips", @"Em Price", @"Mat Price", @"Chandler Pulliam", @"Rob Pulliam", @"Emma Ramey", @"Temi Ransome-Kuti", @"Hadiya Rasheed", @"Sami Refai", @"Zaki Refai", @"Hannah Rezonzew", @"Corinna Rheinbay", @"Andrzej Richardson", @"Lauren Ridley", @"Dave Riha", @"Will Riley", @"Angela Robinson", @"Savannah Rodriguez", @"Cheska Romero", @"Ramsey Rossmann", @"Justin Rudd", @"Ethan Ryu", @"Victoria Saenz", @"Max Samford", @"Yuka Sanui", @"Patrick Scalise", @"Josh Scarborough", @"Leslie Schwartz", @"Clara Scott", @"Lizzie Scott", @"Cole Senn", @"Edward Shaw", @"John Carter Simmons", @"Jeffrey Simonetti", @"Paula Simonetti", @"Sam Simpson", @"Nikhi Singh", @"Alex Smith", @"Michelle Song", @"Erin Sullivan", @"Will Sullivan", @"Angela Szasz", @"Claire Tang", @"Madeleine Thomas", @"Clark Thompson", @"Sarah Thompson", @"Ellie Thompson", @"Kristin Toms", @"John Touloupis", @"Gareth Turner", @"Caleb Wakeford", @"Connor Walker", @"Mira Walker", @"Tess Walker", @"David Wang", @"Laura Ward", @"Amanda Westbrook", @"Katie Whatley", @"Ashlyn Whitaker", @"Ethan White", @"Jackson White", @"Jesse Wiatrak", @"Dewey Wilbanks", @"Emily Williams", @"Weiyang Xiong", @"Jamie Yang", @"Patrick Yang", @"Varun Yerramsetti", @"Alexander Young", @"Hans Young", @"Liqi Yu", @"Siran Zhang", @"Christine Zheng", @"Lianna Zhou"]]: self.setFilename];
            
            
            [self writeArrayToFile:[[NSMutableArray alloc] initWithArray:@[@"3204", @"3012", @"3267", @"3179", @"3176", @"3133", @"3244", @"2910", @"3006", @"3203", @"2915", @"3258", @"3259", @"3138", @"3145", @"3134", @"3264", @"2924", @"3129", @"3108", @"3101", @"2970", @"3261", @"3032", @"3173", @"3046", @"3043", @"3007", @"3226", @"3171", @"3232", @"3140", @"2805", @"3057", @"3155", @"3143", @"2966", @"2806", @"3172", @"3114", @"3186", @"3252", @"2957", @"3190", @"3253", @"3037", @"2935", @"3017", @"3135", @"3067", @"2907", @"3004", @"3047", @"3188", @"3201", @"2808", @"2916", @"3208", @"3210", @"3211", @"3241", @"2810", @"3016", @"3127", @"3212", @"2953", @"3292", @"3293", @"3281", @"2929", @"2813", @"2868", @"3285", @"3157", @"2901", @"3111", @"2718", @"3103", @"3049", @"3219", @"3273", @"3162", @"3276", @"3262", @"3287", @"2955", @"3076", @"3015", @"3131", @"2937", @"3242", @"3257", @"3181", @"2921", @"2820", @"3192", @"3229", @"2902", @"3251", @"3255", @"3277", @"2821", @"3230", @"2822", @"3048", @"2824", @"3027", @"3247", @"3266", @"3180", @"2960", @"3117", @"3233", @"3250", @"3218", @"3142", @"3071", @"3227", @"3124", @"3184", @"3185", @"2927", @"3044", @"3279", @"2947", @"3282", @"3294", @"3263", @"3003", @"2940", @"3113", @"3139", @"3064", @"2941", @"3256", @"3144", @"3291", @"2832", @"2936", @"3214", @"3254", @"3028", @"3079", @"3002", @"3128", @"3119", @"2833", @"3228", @"3246", @"3122", @"3159", @"3110", @"3078", @"2837", @"3045", @"3075", @"3217", @"3240", @"3187", @"2840", @"2841", @"3269", @"3245", @"3249", @"3116", @"3031", @"3011", @"3112", @"2844", @"2908", @"2903", @"3137", @"3036", @"3175", @"3042", @"3213", @"3104", @"3260", @"3105", @"3222", @"3125", @"3189", @"3115", @"3158", @"3209", @"2914", @"2850", @"3150", @"3151", @"3152", @"3271", @"2909", @"3130", @"3029", @"3221", @"3106", @"3177", @"3234", @"3077", @"3148", @"2852", @"3169", @"3066", @"3265", @"3107", @"3051", @"3038", @"3126", @"3236", @"3154", @"3141", @"3278", @"3052", @"3215", @"3239", @"2854", @"3053", @"3149", @"3225", @"3018", @"3286", @"3231", @"3030", @"3248", @"3068", @"2905", @"3289", @"2869", @"3109", @"2906", @"3005", @"2912", @"3202", @"3123", @"2964", @"3224", @"3023", @"3013", @"3161", @"3283", @"3284", @"2859", @"3163", @"3025", @"3238", @"3132", @"2952", @"3288", @"3237", @"3033", @"3039", @"3206", @"3164", @"2938", @"3275", @"2863", @"3191", @"2945", @"3290", @"3026", @"3220", @"3156", @"3280", @"2965", @"3160", @"3034", @"3268", @"3216", @"3205", @"3272", @"3270", @"3243", @"3170", @"3121"]]: @"List of Student IDs"];
        }
        else
            break;
    }
    
    [allStudents removeAllObjects];
    
    NSMutableString *tempName = [NSMutableString string];
    
    allIDs = [self allIDs];
    
    int x = 0;
    
    for (int i = 0; i < [txtInFile length]; i++) {
        
        if ([txtInFile characterAtIndex:i] == '*') {
            genericStudent = [[studentAccounts alloc] initWithInformation:2014 :[allIDs objectAtIndex:x] :tempName];
            [allStudents addObject:genericStudent];
            
            x++;
            tempName = [NSMutableString string];
        }
        else{
            [tempName appendFormat:@"%c", [txtInFile characterAtIndex:i]];
        }
    }
    
    txtInFile = [NSString string];
    
    return allStudents;
}

- (NSMutableArray*) allIDs{
    if (!allIDs) {
        allIDs = [[NSMutableArray alloc] init];
    }
    
    filePath = [[NSString alloc] init];
    NSError *error;
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"List of Student IDs"];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if(!txtInFile)
    {
        return nil;
    }
    
    NSMutableString *tempName = [NSMutableString string];
    
    for (int i = 0; i < [txtInFile length]; i++) {
        
        if ([txtInFile characterAtIndex:i] == '*') {
            
            [allIDs addObject:tempName];
            
            tempName = [NSMutableString string];
        }
        else{
            [tempName appendFormat:@"%c", [txtInFile characterAtIndex:i]];
        }
    }
    
    return allIDs;
}

- (NSMutableArray *)readChargesFromStudent:(NSString *)whichStudent{
    NSMutableArray *chargesForStudent = [[NSMutableArray alloc] init];
    
    filePath = [[NSString alloc] init];
    NSError *error;
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:whichStudent];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if(!txtInFile)
    {
        return chargesForStudent;
    }
    
    NSMutableArray *nestedArray = [[NSMutableArray alloc] init];
    
    NSMutableString *arrayItem = [NSMutableString string];
    
    for (int i = 0; i < [txtInFile length]; i++) {
        
        if ([txtInFile characterAtIndex:i] == '*') {
            [nestedArray addObject:arrayItem];
            
            arrayItem = [NSMutableString string];
        }
        else if ([txtInFile characterAtIndex:i] == '&'){
            [chargesForStudent addObject:nestedArray];
            
            nestedArray = [[NSMutableArray alloc] init];
        }
        else{
            [arrayItem appendFormat:@"%c", [txtInFile characterAtIndex:i]];
        }
    }
    
    return chargesForStudent;
}

#pragma mark - Write Methods

-(void)writeArrayToFile:(NSMutableArray *)arrayToWrite: (NSString*) whichFile{
    
    filePath = [[NSString alloc] init];
    NSError *err;
    
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:whichFile];
    
    NSMutableString *textToWrite = [[NSMutableString alloc] init];
    int x = 0;
    
    for (int i = 0; i < arrayToWrite.count; i++) {
        if ([[[[arrayToWrite objectAtIndex:i] class] description] isEqualToString:@"__NSCFConstantString"]) {
            [textToWrite insertString:[NSString stringWithFormat:@"%@*", [arrayToWrite objectAtIndex:i]] atIndex:x];
        }
        x += [[arrayToWrite objectAtIndex:i] length] + 1;
    }
    
    BOOL ok = [textToWrite writeToFile:filePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    
    if (!ok) {
        NSLog(@"Error writing file at %@\n%@",
              filePath, [err localizedFailureReason]);
    }
}

- (void) recordMasterFile{
    NSMutableArray *allCharges = [[NSMutableArray alloc] init];
    
    allStudents = [self allStudents];
    
    for (int i = 0; i < allStudents.count; i++) {
        [allCharges addObject:@[[[allStudents objectAtIndex:i] name], [[allStudents objectAtIndex:i] idNumber], [self readChargesFromStudent:[[allStudents objectAtIndex:i] name]]]];
    }
    
    filePath = [[NSString alloc] init];
    secondFilePath = [[NSString alloc] init];
    NSError *err;
    
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"Master File"];
    secondFilePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"Detail File"];
    
    NSMutableString *textToWrite = [[NSMutableString alloc] init];
    NSMutableString *detailToWrite = [[NSMutableString alloc] init];
    
    
    BOOL hasPurchased = false;
    
    for (int i = 0; i < allCharges.count; i++) {
        for (int j = 0; j < [[allCharges objectAtIndex:i] count]; j++) {
            if (j == 0) {
                @try{
                    if ([[[allCharges objectAtIndex:i] objectAtIndex:0] isEqualToString:@"Hill Balliet"]) {
                    }
                    
                    if ([[[allCharges objectAtIndex:i] objectAtIndex:2] objectAtIndex:0]) {
                        [textToWrite appendString:[NSString stringWithFormat:@"%@: ", [[allCharges objectAtIndex:i] objectAtIndex:0]]];
                        
                        
                        hasPurchased = true;
                        
                    }
                    else{
                        hasPurchased = false;
                    }
                }
                @catch (NSException *e) {
                    hasPurchased = false;
                }
                @finally {
                    
                }
                
            }
            else if (j == 1 && hasPurchased){
                [textToWrite appendString:[NSString stringWithFormat:@"%@\nMeal\t\t\tTotal\nDinners\t\t\t", [[allCharges objectAtIndex:i] objectAtIndex:1]]];
                
            }
            else if (j == 2 && hasPurchased){
                float dinners = 0;
                float breakfasts = 0;
                float brunches = 0;
                
                for (int k = 0; k < [[[allCharges objectAtIndex:i] objectAtIndex:j] count]; k++) {
                    if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Dinner"]) {
                        dinners++;
                    }
                    else if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Breakfast"]){
                        breakfasts++;
                    }
                    else if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Brunch"]){
                        brunches++;
                    }
                    
                }
                NSString *newString = [NSString stringWithFormat:@"$%.2f\nBreakfasts\t\t$%.2f\nBrunches\t\t$%.2f\nTotal\t\t\t$%.2f\n\n\n", dinners * 6, breakfasts * 4, brunches * 5, ((dinners * 6)+(breakfasts * 4)+(brunches * 5))];
                
                [textToWrite appendString:newString];
                
            }
        }
    }
    
    for (int i = 0; i < allCharges.count; i++) {
        for (int j = 0; j < [[allCharges objectAtIndex:i] count]; j++) {
            if (j == 0) {
                [detailToWrite appendString:[NSString stringWithFormat:@"%@: ", [[allCharges objectAtIndex:i] objectAtIndex:0]]];
                
            }
            else if (j == 1){
                [detailToWrite appendString:[NSString stringWithFormat:@"%@\nMeal\t\t\tDate\t\t\tTotal\n", [[allCharges objectAtIndex:i] objectAtIndex:1]]];
                
            }
            else if (j == 2){
                
                float total = 0;
                
                for (int k = 0; k < [[[allCharges objectAtIndex:i] objectAtIndex:j] count]; k++) {
                    [detailToWrite appendString:[NSString stringWithFormat:@"%@\t\t\t%@\t\t\t%@\n", [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:1], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:0]]];
                    
                    if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Dinner"]) {
                        total += 6;
                    }
                    else if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Breakfast"]){
                        total += 4;
                    }
                    else if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Brunch"]){
                        total += 5;
                    }
                }
                
                [detailToWrite appendString:[NSString stringWithFormat:@"Total\t\t\t\t\t\t\t$%.2f\n\n\n", total]];
                
            }
        }
    }
        
    BOOL ok = [textToWrite writeToFile:filePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    BOOL isOK = [detailToWrite writeToFile:secondFilePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    
    if (!ok) {
        NSLog(@"Error writing file at %@\n%@",
              filePath, [err localizedFailureReason]);
    }
    
    if (!isOK) {
        NSLog(@"Error writing file at %@\n%@",
              secondFilePath, [err localizedFailureReason]);
    }
    
    [allCharges removeAllObjects];
}

- (void)recordBillHomeToStudent:(NSMutableArray*) chargesToBill: (NSString *)whichStudent{
    NSError *err;
    
    filePath = [[NSString alloc] init];
    NSError *error;
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:whichStudent];
    
    NSMutableString *textToWrite = [[NSMutableString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if (!textToWrite) {
        textToWrite = [[NSMutableString alloc] init];
    }
    
    int x = textToWrite.length;
        
    for (int i = 0; i < chargesToBill.count; i++) {
        for (int j = 0; j < [[chargesToBill objectAtIndex:i] count]; j++) {
            [textToWrite appendString:[NSString stringWithFormat:@"%@*", [[chargesToBill objectAtIndex:i] objectAtIndex:j]]];
            
            x += [[[chargesToBill objectAtIndex:i] objectAtIndex: j] length] + 1;
        }
        [textToWrite insertString:@"&" atIndex:x];
        x++;
    }
    
    BOOL ok = [textToWrite writeToFile:filePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    
    if (!ok) {
        NSLog(@"Error writing file at %@\n%@",
              filePath, [err localizedFailureReason]);
    }
}

@end
