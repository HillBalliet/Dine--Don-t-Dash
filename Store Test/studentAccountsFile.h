//
//  studentAccountsFile.h
//  Store Test
//
//  Created by Hill Balliet on 1/24/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccounts.h"

@interface studentAccountsFile : NSObject{
    NSFileManager *fileManager;
    
    NSMutableArray *allYears;
    NSMutableArray *allIDs;
    NSMutableArray *allNames;
    NSMutableArray *allStudents;
    NSMutableArray *allStatus;
    NSMutableArray *selectedStudentHistory;
    
    studentAccounts *ramsey;
    studentAccounts *genericStudent;
    
    NSString *homeDirectory;
    NSString *filePath;
    NSString *secondFilePath;
}

- (void) writeArrayToFile:(NSMutableArray *)arrayToWrite: (NSString*) whichFile;
- (void) recordBillHomeToStudent: (NSMutableArray*) chargesToBill: (NSString*) whichStudent;
- (void) recordMasterFile;
- (void) addStudent: (studentAccounts *)newStudent;
- (void) deleteGraduatedStudents;
- (void) deleteCharges;

- (NSString*) getDocumentDirectory;
- (NSString*) setFilename;

- (NSMutableArray*) readChargesFromStudent: (NSString*) whichStudent;
- (NSMutableArray*) allStudents;
- (NSMutableArray *)allGraduatingYears;
- (NSMutableArray *)allNames;
- (NSMutableArray *)allStatus;

- (studentAccounts*) ramsey;

- (NSMutableArray*) allIDs;


@end
