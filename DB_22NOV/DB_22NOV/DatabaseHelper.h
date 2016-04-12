
//DatabaseHelper.h


#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DatabaseHelper : NSObject
{
    sqlite3 *databaseReference;
}

- (id)init;

//Copies the database from the Project bundle to the document directory
- (BOOL)copyDatabaseFromBundletoDocumentDirectory;

// gets the location of the database present in the document directory
- (NSString*)documentDirectoryDatabaseLocation;

// creates the database instance
- (void)createDatabaseInstance;

// checks if any previous db connection is open before firing a new query
//and if the connection is open then closes it
- (void)closeanyOpenConnection;


// inserts the new employee record
- (BOOL)insertStudentRecordWithStudentName:(NSString*)name andStudentNumbar:(NSString*)number andatudentAddress:(NSString *)address;

// gives you the employee name and employee image
- (NSMutableArray*)getAllStudentRecord;

// Delete the employee record and accepts the record ID as the parameter
- (BOOL)deleteEmployeeWithID:(NSString*)employeeRecordID;


@end
