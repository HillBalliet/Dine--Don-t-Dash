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
    
    NSMutableArray *allIDs;
    NSMutableArray *allStudents;
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

- (NSString*) getDocumentDirectory;
- (NSString*) setFilename;

- (NSMutableArray*) readChargesFromStudent: (NSString*) whichStudent;
- (NSMutableArray*) allStudents;

- (studentAccounts*) ramsey;

- (NSMutableArray*) allIDs;


@end
