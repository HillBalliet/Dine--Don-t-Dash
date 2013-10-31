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
        ramsey = [[studentAccounts alloc] initWithInformation:@"2015" newIdNumber:@1111 newName:@"Ramsey Rossmann" newStatus:@"D"];
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
            [self writeArrayToFile:[[NSMutableArray alloc] initWithArray:@[@"Zackery Aldaher", @"Adam Aldaher", @"Graham Alexander", @"Rakim Ali", @"Bennett Atkins", @"Hill Balliet", @"Julianne Baker", @"Quinn Balazs", @"Margaret Balliet", @"Johnny Banks", @"McKenna Barney", @"Clarence Barr", @"Thomas Barr", @"Sydney Barrow", @"Savannah Barrow", @"Frank Baxley", @"Evelyn Baxley", @"Charlotte Benedict", @"Lynn Berger", @"Miriam Bernard", @"Ashlynn Berry", @"Jasmine Berry", @"Sebastian Black", @"Eliza Black", @"Margaret Blackerby", @"Nicole Bogan", @"Caroline Borden", @"Sarah Brabston", @"Brianna Braden", @"Cassidy Bridgham", @"James Bruno", @"James Bryant", @"Nicholas Bryant", @"Katherine Bryant", @"William Bryant", @"Cole Cassady", @"Elquis Castillo", @"Cullen Chandler", @"Mei Chen", @"Xinnan Chen", @"Zachary Choi", @"Jong Choi", @"Ka Choi", @"Samuel Cianchetti", @"Skylar Clark", @"Josephine Cleverdon", @"Ada Cohen", @"Eli Cohen", @"Molly Cohn", @"Joseph Copeland", @"Maxine Cox", @"William Crain", @"Albert Dascher", @"Evan Dascher", @"Alexander Daugherty", @"Graham Daugherty", @"Stella Davis", @"Jewell Davis", @"Katherine DePalma", @"Erin Dickson", @"Elizabeth Dillard", @"Kathryn Dix", @"Davis Dudley", @"Patrick Duggan", @"Ethan Elgavish", @"Samih Mohamed Eloubeidi", @"Erin Ertunga", @"Arlen Fan", @"Joseph Farley", @"Virginia Farley", @"Galen Fleet", @"Julia Fleisig", @"Casey Fondren", @"David Fox", @"Shuwen Ge", @"Ethan Getman", @"Anna Giattina", @"Heinrich Giattina", @"Charles Gibbs", @"Henry Goff", @"Benjamin Goodman", @"Anna Grady", @"Caroline Grady", @"Josephine Gray", @"Issac Griffin-Layne", @"William Grumley", @"Sonia Gueye", @"Sarah Guillaume", @"Ameer Hakim", @"Mohammad Hamo", @"Rachel Hancock", @"Humzah Harhash", @"Enav Haviv", @"Eran Haviv", @"Harvey He", @"Sally Heggeman", @"Zachary Heino", @"Taylor Hinch", @"David Hobdy", @"Riley Hogan", @"William Hooker", @"Jalen Houston", @"Elizabeth Hunt", @"Dejuanay Hunter", @"Alexandra Hyatt", @"Kenechi Ijemere", @"Jaylan Jacobs", @"Seabrook Jeffcoat", @"Ha-Eun Ji", @"Kenneth Jiao", @"Seokho Jin", @"Zeyuan Jin", @"Hannah Johnson", @"Samuel Jones", @"William Jones", @"Priscilla Jones", @"Elizabeth Jones", @"Garrett Jordan", @"Ethan Jr", @"Chae Kang", @"Daler Karassayev", @"Noah Karle", @"John Keevan-Lynch", @"Jesse Kieve", @"Young Kim", @"Gang Kim", @"Eui Kim", @"Ji Kim", @"Min Kim", @"MaKenzie King", @"Maxwell Klapow", @"Julian Kolorz", @"Mack Krell", @"Alexander Kristjansson", @"Sue Kwon", @"Paul Langjahr", @"Matthew Lash", @"Edwin Lashley", @"Amber Latimer", @"Ashley Leader", @"Daun Lee", @"Songhyun Lee", @"Robert Lichenstein", @"Oscar Lin", @"Yicheng Lin", @"James Loeb", @"Zhaoyl Ma", @"Siqi Ma", @"Ellen Macklin", @"Wesley Madden", @"Caroline Malone", @"Tahirah Markert", @"Meghan Marks", @"Cori Mazer", @"Hannah McCarty", @"Cameron McDonald", @"Cameron McDonald", @"Hugh McElderry", @"Connor McGarty", @"Martin McGuire", @"Jack McGuire", @"Daniel McMahon", @"Hannah McRight", @"Caroline McRight", @"Audrey Mercer", @"Elisabeth Michaelis", @"Sydney Morris", @"Ashley Morris", @"Rachael Motamed", @"Slavin Mu", @"Annabelle Neville", @"Sam Newton", @"Sarah Noone", @"Guy Nsanza", @"Jisu Oh", @"John O'Malley", @"Michael O'Malley", @"Mary O'Malley", @"Julia Orcutt", @"Sarah Orcutt", @"Gabrielle Oser", @"Christian Owens", @"Anthony Pack", @"Yuzhao Pan", @"Nicholas Parmer", @"Bela Patel", @"Seth Perlman", @"Matthew Price", @"Robert Pulliam", @"John Pulliam", @"Hadiya Rasheed", @"Sami Refai", @"Zaki Refai", @"Danna Refai", @"Hannah Rezonzew", @"Andrzej Richardson", @"Lauren Ridley", @"David Riha", @"Luke Robinson", @"Angela Robinson", @"Savannah Rodriguez", @"Haley Rogers", @"Dayna Rollins", @"Mark Romero", @"Francesca Romero", @"Ramsey Rossmann", @"Justin Rudd", @"Mary Rueve", @"Hyun Ryu", @"Max Samford", @"Peter Scalise", @"Patrick Scalise", @"Josh Scarborough", @"Peter Schilli", @"Elisabeth Schwiebert", @"Elizabeth Scott", @"Clara Scott", @"Joon Sea", @"Cole Senn", @"Lily Sherrill", @"Kennedy Simes", @"John Simmons", @"Jeffrey Simonetti", @"Samuel Simpson", @"Nikhi Singh", @"Alexandria Smith", @"Madelayne Smith", @"Foster Allen Steinbeck", @"Jacob Straus", @"Jana Streyczek", @"Cole Sullivan", @"Erin Sullivan", @"Anna Tabor", @"Yu Tang", @"John Teschner", @"Madeleine Thomas", @"Sarah Thompson", @"Clark Thompson", @"Katherine Thomson", @"Kristen Toms", @"Sarah Toms", @"Alexios Touloupis", @"John Touloupis", @"Gareth Turner", @"Emma Turner", @"Everett Von Ferguson", @"Caleb Wakeford", @"Graham Waldo", @"Teresa Walker", @"William Walker", @"Mira Walker", @"Noah Walton", @"Dawei Wang", @"Lan Wei", @"Anna Welden", @"Katherine Whatley", @"Ashlyn Whitaker", @"Jackson White", @"Jesse Wiatrak", @"George Wilbanks", @"Emily Williams", @"Minou Wolter", @"Wenlan Xiao", @"Weiyang Xiong", @"Ziyue Xu", @"Jeong Yang", @"Jijin Yang", @"Tianyi Yang", @"Chloe Yeager", @"Tina Yeom", @"Varun Yerramsetti", @"Alexander Young", @"Gavin Young", @"Liqi Yu", @"Siran Zhang", @"Tinaxin Zhang", @"Tianlin Zheng", @"Lianna Zhou", @"D'Anthony Allen", @"Pete Arner", @"Lisa Balazs", @"Thomas Barr", @"Athena Chang", @"Robert Cooper", @"Jim Ellington", @"Charles Ellis", @"MacDonald Fleming", @"Jan Fortson", @"Hunter Gray", @"Jonathan Horn", @"Janie Hyattj", @"Tanya Hyattt", @"Clint Jacobs", @"Kelly Jacobs", @"Mac LaCasse", @"Mike Lantrip", @"Melody Machen", @"George Mange", @"Maria Martinez", @"Paul McGee", @"Richard Neely", @"David Noone", @"Marjan Obradovic", @"Bob Pollard", @"Douglas Ray", @"Brian Rodgers", @"Michael Sheehan", @"Diane Sheppard", @"Jessica Smith", @"Stephanie Thomass", @"Tim Thomast", @"Greg Van Horn", @"Gareth Vaughan", @"Alina Voicu", @"Chuck Williamsc", @"Michelle Williamsm", @"Josh Cain", @"Ethan White", @"Amanda Westbrook"]]: self.setFilename];
            
            
            [self writeArrayToFile:[[NSMutableArray alloc] initWithArray:@[@"3012", @"3204", @"3370", @"3267", @"3303", @"3006", @"3244", @"2910", @"3203", @"2915", @"3259", @"3138", @"3145", @"3264", @"3134", @"3108", @"2924", @"3101", @"3261", @"3032", @"3173", @"3046", @"3043", @"3302", @"3007", @"3226", @"3171", @"3232", @"3330", @"3140", @"3057", @"3155", @"3326", @"3307", @"3143", @"3114", @"3186", @"3252", @"2957", @"3190", @"3067", @"3135", @"3253", @"3378", @"3004", @"3310", @"3361", @"3047", @"3188", @"3201", @"3341", @"2916", @"3208", @"3352", @"3210", @"3211", @"3241", @"3348", @"3016", @"3306", @"3127", @"3212", @"3322", @"2953", @"3309", @"2954", @"3281", @"3285", @"2901", @"3111", @"3325", @"3103", @"3049", @"3219", @"3162", @"3375", @"3287", @"3262", @"2955", @"3319", @"3015", @"3131", @"3345", @"3242", @"3257", @"3305", @"3323", @"3181", @"3192", @"3349", @"3229", @"3339", @"3356", @"3357", @"3251", @"3373", @"3343", @"3374", @"3230", @"3048", @"3027", @"3247", @"3266", @"3180", @"3335", @"2960", @"3117", @"3354", @"3233", @"3315", @"3218", @"3250", @"3142", @"3227", @"3124", @"3071", @"3333", @"3184", @"3026", @"3279", @"3282", @"3294", @"3263", @"3003", @"2941", @"3064", @"3113", @"3139", @"3256", @"3291", @"3214", @"3365", @"3002", @"3128", @"3119", @"3367", @"3228", @"3324", @"3246", @"3122", @"3110", @"3159", @"3075", @"3217", @"3240", @"3316", @"3245", @"3269", @"3249", @"3116", @"3031", @"3011", @"3112", @"2903", @"3137", @"3036", @"3036", @"3175", @"3042", @"3104", @"3213", @"3260", @"3105", @"3340", @"3313", @"3358", @"3125", @"3222", @"3189", @"3115", @"3158", @"3209", @"2914", @"3150", @"3271", @"2909", @"3130", @"3336", @"3029", @"3221", @"3106", @"3320", @"3177", @"3234", @"3346", @"3314", @"3148", @"3066", @"3107", @"3265", @"3126", @"3236", @"3154", @"3350", @"3141", @"3052", @"3215", @"3239", @"3371", @"3053", @"3149", @"3351", @"3329", @"3312", @"3225", @"3018", @"3286", @"3308", @"3231", @"3248", @"3317", @"2905", @"3289", @"3311", @"3301", @"2906", @"3109", @"3342", @"3005", @"3338", @"3334", @"3202", @"3123", @"3224", @"3023", @"3013", @"3347", @"3376", @"3362", @"3368", @"3321", @"3283", @"3364", @"3163", @"3377", @"3025", @"3132", @"3238", @"2952", @"3288", @"3337", @"3318", @"3237", @"3033", @"3332", @"3304", @"3039", @"3328", @"2938", @"3206", @"3164", @"3327", @"3275", @"3344", @"3331", @"2945", @"3290", @"3220", @"3156", @"3280", @"2965", @"3363", @"3366", @"3160", @"3353", @"3034", @"3268", @"3359", @"3372", @"3144", @"3216", @"3205", @"3355", @"3270", @"3243", @"3360", @"3170", @"3121", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"0001", @"2966", @"3026", @"3191"]]: @"List of Student IDs"];
            
            
            [self writeArrayToFile:[[NSMutableArray alloc] initWithArray:@[@"2014", @"2017", @"2018", @"2016", @"2018", @"2014", @"2016", @"2014", @"2016", @"2014", @"2016", @"2016", @"2016", @"2017", @"2015", @"2016", @"2014", @"2016", @"2017", @"2015", @"2016", @"2014", @"2015", @"2018", @"2014", @"2017", @"2016", @"2016", @"2018", @"2015", @"2015", @"2016", @"2018", @"2018", @"2016", @"2016", @"2016", @"2015", @"2014", @"2014", @"2015", @"2015", @"2014", @"2016", @"2015", @"2018", @"2018", @"2015", @"2016", @"2017", @"2015", @"2014", @"2016", @"2018", @"2016", @"2014", @"2016", @"2018", @"2014", @"2016", @"2015", @"2016", @"2017", @"2014", @"2018", @"2014", @"2015", @"2014", @"2014", @"2016", @"2018", @"2016", @"2015", @"2016", @"2014", @"2018", @"2015", @"2017", @"2014", @"2018", @"2015", @"2015", @"2017", @"2017", @"2017", @"2018", @"2018", @"2016", @"2014", @"2018", @"2016", @"2017", @"2015", @"2015", @"2017", @"2015", @"2017", @"2017", @"2016", @"2015", @"2014", @"2016", @"2017", @"2015", @"2015", @"2014", @"2016", @"2017", @"2017", @"2018", @"2016", @"2015", @"2016", @"2017", @"2015", @"2015", @"2018", @"2014", @"2015", @"2015", @"2017", @"2016", @"2017", @"2015", @"2014", @"2015", @"2015", @"2014", @"2015", @"2015", @"2017", @"2014", @"2014", @"2016", @"2014", @"2016", @"2017", @"2017", @"2017", @"2015", @"2016", @"2015", @"2015", @"2015", @"2014", @"2015", @"2015", @"2015", @"2017", @"2015", @"2015", @"2014", @"2015", @"2014", @"2015", @"2014", @"2014", @"2016", @"2015", @"2015", @"2016", @"2016", @"2015", @"2017", @"2018", @"2014", @"2015", @"2015", @"2016", @"2016", @"2014", @"2016", @"2014", @"2014", @"2015", @"2014", @"2016", @"2018", @"2014", @"2016", @"2016", @"2017", @"2016", @"2016", @"2018", @"2018", @"2014", @"2015", @"2016", @"2017", @"2015", @"2016", @"2015", @"2018", @"2015", @"2015", @"2017", @"2017", @"2018", @"2014", @"2014", @"2018", @"2017", @"2018", @"2016", @"2015", @"2017", @"2017", @"2016", @"2016", @"2018", @"2014", @"2016", @"2018", @"2017", @"2014", @"2016", @"2017", @"2014", @"2015", @"2017", @"2017", @"2015", @"2017", @"2014", @"2014", @"2017", @"2018", @"2016", @"2016", @"2018", @"2015", @"2015", @"2015", @"2017", @"2015", @"2015", @"2016", @"2014", @"2016", @"2018", @"2017", @"2016", @"2015", @"2017", @"2016", @"2014", @"2017", @"2014", @"2017", @"2016", @"2018", @"2015", @"2017", @"2015", @"2014", @"2016", @"2017", @"2014", @"2017", @"2014", @"2016", @"2015", @"2014", @"2017", @"2014", @"2015", @"2016", @"2016", @"2015", @"2017", @"2015", @"2017", @"2014", @"2015", @"2016", @"2014", @"2016", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"69", @"2014", @"2015", @"2016"]] :@"Graduating Year"];
            
            
            [self writeArrayToFile:[[NSMutableArray alloc]initWithArray:@[@"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"B", @"B", @"D", @"B", @"D", @"B", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"B", @"D", @"B", @"D", @"D", @"D", @"D", @"B", @"B", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"B", @"B", @"D", @"B", @"B", @"B", @"B", @"B", @"B", @"B", @"B", @"D", @"B", @"D", @"D", @"B", @"B", @"D", @"B", @"B", @"D", @"D", @"B", @"B", @"B", @"B", @"B", @"B", @"B", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"B", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"B", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"D", @"D", @"B", @"B", @"B", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"D", @"B", @"B", @"D", @"D", @"D", @"D", @"B", @"B", @"D", @"B", @"D", @"D", @"D", @"D", @"D", @"B", @"B", @"B", @"B", @"B", @"B", @"B", @"D", @"D", @"D", @"D", @"D", @"B", @"B", @"B", @"B", @"D", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"F", @"D", @"D", @"D"]] :@"Status"];
        }
        else
            break;
    }
    
    [allStudents removeAllObjects];
    
    NSMutableString *tempName = [NSMutableString string];
    
    allIDs = [self allIDs];
    allYears = [self allGraduatingYears];
    allStatus = [self allStatus];
    
    int x = 0;
    
    for (int i = 0; i < [txtInFile length]; i++) {
        
        if ([txtInFile characterAtIndex:i] == '*') {
                        
            genericStudent = [[studentAccounts alloc] initWithInformation:[allYears objectAtIndex:x] newIdNumber:[allIDs objectAtIndex:x] newName:tempName newStatus:[allStatus objectAtIndex:x]];
            [allStudents addObject:genericStudent];
            
            tempName = [NSMutableString string];
            x++;
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

-(NSMutableArray *)allNames{
    if (!allNames) {
        allNames = [[NSMutableArray alloc] init];
    }
    
    filePath = [[NSString alloc] init];
    NSError *error;
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:self.setFilename];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if(!txtInFile)
    {
        return nil;
    }
    
    NSMutableString *tempName = [NSMutableString string];
    
    for (int i = 0; i < [txtInFile length]; i++) {
        
        if ([txtInFile characterAtIndex:i] == '*') {
            
            [allNames addObject:tempName];
            
            tempName = [NSMutableString string];
        }
        else{
            [tempName appendFormat:@"%c", [txtInFile characterAtIndex:i]];
        }
    }
    
    return allNames;
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

- (NSMutableArray *)allGraduatingYears{
    if (!allYears) {
        allYears = [[NSMutableArray alloc] init];
    }
    
    filePath = [[NSString alloc] init];
    NSError *error;
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"Graduating Year"];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if(!txtInFile)
    {
        return nil;
    }
    
    NSMutableString *tempName = [NSMutableString string];
    
    for (int i = 0; i < [txtInFile length]; i++) {
        
        if ([txtInFile characterAtIndex:i] == '*') {
            
            [allYears addObject:tempName];
            
            tempName = [NSMutableString string];
        }
        else{
            [tempName appendFormat:@"%c", [txtInFile characterAtIndex:i]];
        }
    }
    
    return allYears;
}

-(NSMutableArray *)allStatus{
    if (!allStatus) {
        allStatus = [[NSMutableArray alloc] init];
    }
    
    filePath = [[NSString alloc] init];
    NSError *error;
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"Status"];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if(!txtInFile)
    {
        NSLog(@"there are no statuses to be read");
        return nil;
    }
    
    NSMutableString *tempName = [NSMutableString string];
    
    for (int i = 0; i < [txtInFile length]; i++) {
        
        if ([txtInFile characterAtIndex:i] == '*') {
            
            [allStatus addObject:tempName];
            
            tempName = [NSMutableString string];
        }
        else{
            [tempName appendFormat:@"%c", [txtInFile characterAtIndex:i]];
        }
    }
    
    return allStatus;
}

#pragma mark - Delete Methods

-(void)deleteGraduatedStudents{
    
    NSDate *time = [[NSDate alloc] init];
    
    NSString* datePart = [NSDateFormatter localizedStringFromDate: time dateStyle: NSDateFormatterMediumStyle timeStyle: NSDateFormatterNoStyle];
    
    int spaces = 0;
    NSMutableString *year = [NSMutableString string];
    
    for (int i = 0; i < [datePart length]; i++) {
        if (spaces == 2) {
            [year appendFormat:@"%c", [datePart characterAtIndex:i]];
        }
        else if ([datePart characterAtIndex:i] == ' '){
            spaces++;
        }
    }
    
    int x = 0;
    
    for (int i = 0; i < [allYears count]; i++) {
        
        if ([[allYears objectAtIndex:i - x] isEqualToString:year]) {
            [allNames removeObjectAtIndex:i-x];
            [allIDs removeObjectAtIndex:i-x];
            [allYears removeObjectAtIndex:i-x];
            [allStatus removeObjectAtIndex:i-x];
            x++;
        }
    }
    
    [self writeArrayToFile:allYears :@"Graduating Year"];
    [self writeArrayToFile:allNames :self.setFilename];
    [self writeArrayToFile:allIDs :@"List of Student IDs"];
    [self writeArrayToFile:allStatus :@"Status"];
}

- (void)deleteCharges{
    NSError *err;
    
    filePath = [[NSString alloc] init];
    NSError *error;
    
    allNames = [self allNames];
    
    for (int i = 0; i < allNames.count; i++) {
        filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:[allNames objectAtIndex:i]];
        secondFilePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"Master File"];
        NSString *thirdFilePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"Detail File"];
        
        NSMutableString *textToWrite = [[NSMutableString alloc] init];
        
        BOOL ok = [textToWrite writeToFile:filePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
        
        ok = [textToWrite writeToFile:secondFilePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
        
        ok = [textToWrite writeToFile:thirdFilePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
        
        if (!ok) {
            NSLog(@"Error writing file at %@\n%@",
                  filePath, [err localizedFailureReason]);
        }
    }
    
}

# pragma mark - Write Methods

-(void)writeArrayToFile:(NSMutableArray *)arrayToWrite: (NSString*) whichFile{
    
    NSError *err;
    
    filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:whichFile];
    
    NSMutableString *textToWrite = [[NSMutableString alloc] init];
    int x = 0;
    
    for (int i = 0; i < arrayToWrite.count; i++) {
        [textToWrite insertString:[NSString stringWithFormat:@"%@*", [arrayToWrite objectAtIndex:i]] atIndex:x];
        x += [[NSString stringWithFormat:@"%@", [arrayToWrite objectAtIndex:i]] length] + 1;
    }
    
    BOOL ok = [textToWrite writeToFile:filePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    
    if (!ok) {
        NSLog(@"Error writing file at %@\n%@",
              filePath, [err localizedFailureReason]);
    }
}

-(void)addStudent:(studentAccounts *)newStudent{
    int y = -1;
    
    allNames = [self allNames];
    [allNames addObject:[newStudent name]];
    
    BOOL record = false;
    NSMutableString *holderString = [NSMutableString string];
    NSMutableArray *lastNames = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [allNames count]; i++) {
        for (int j = 0; j < [[allNames objectAtIndex:i] length]; j++) {
            if (record) {
                [holderString appendFormat:@"%c", [[allNames objectAtIndex:i] characterAtIndex:j]];
            }
            else if ([[allNames objectAtIndex:i] characterAtIndex:j] == ' ') {
                record = true;
            }
        }
        [lastNames addObject:holderString];
        holderString = [NSMutableString string];
        record = false;
    }
    
    [lastNames sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    for (int i = 0; i < [lastNames count]; i++) {
        if ([[lastNames objectAtIndex:i] isEqualToString:[newStudent lastName]]) {
            y = i;
        }
    }
    
    [allNames removeLastObject];
    [allNames insertObject:[newStudent name] atIndex:y];
    
    allIDs = [self allIDs];
    
    [allIDs insertObject:newStudent.idNumber atIndex:y];
    
    allStatus = [self allStatus];
    [allStatus insertObject:newStudent.status atIndex:y];
    
    allYears = [self allGraduatingYears];
    [allYears insertObject:[[NSString alloc] initWithFormat:@"%@", [newStudent graduatingYear]] atIndex:y];
    
    [self deleteGraduatedStudents];
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
                        
                        NSLog(@"%@", [[[allCharges objectAtIndex:i] objectAtIndex:2] objectAtIndex:0]);
                        
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
                    
                    
                    if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Dinner"]) {
                        [detailToWrite appendString:[NSString stringWithFormat:@"%@\t\t\t%@\t\t\t%@\n", [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:1], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:0]]];
                        total += 6;
                    }
                    else if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Breakfast"]){
                        [detailToWrite appendString:[NSString stringWithFormat:@"%@\t\t%@\t\t\t%@\n", [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:1], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:0]]];
                        total += 4;
                    }
                    else if ([[[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2] isEqualToString: @"Brunch"]){
                        [detailToWrite appendString:[NSString stringWithFormat:@"%@\t\t\t%@\t\t\t%@\n", [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:2], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:1], [[[[allCharges objectAtIndex:i] objectAtIndex:j] objectAtIndex:k] objectAtIndex:0]]];
                        total += 5;
                    }
                }
                
                [detailToWrite appendString:[NSString stringWithFormat:@"Total\t\t\t\t\t\t$%.2f\n\n\n", total]];
                
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
