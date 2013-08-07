SJOStaticTableViews
===================

Helper for creating form-style/static table views.

##Example

```
//Initialise
_staticTableViewDataSource = [[SJOStaticTableViewDataSource alloc] init];
self.tableView.dataSource = _staticTableViewDataSource
self.tableView.delegate = _staticTableViewDataSource;


//Add cells & sections
self.staticTableViewDataSource[@"Section 1"][0] = [SJOStaticCellData  cellWithTitle:@"Switch Cell" 
                                                                      andAccessory:[[UISwitch alloc] init]];
                                                                      
self.staticTableViewDataSource[@"Section 1"][1] = [SJOStaticCellData  cellWithTitle:@"Block Cell" 
                                                                      andActionBlock:^id(SJOStaticCellData *cell) {
                                                                          NSLog(@"%@", @"Clicked!");
                                                                          return @"Clicked!";
                                                                      } 
                                                                      withStyle:SJOCellStyleDefault 
                                                                      andAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

self.staticTableViewDataSource[@"Section 2"][0] = [SJOStaticCellData  cellWithTitle:@"Done" 
                                                                      andActionBlock:^id(SJOStaticCellData *cell) {
                                                                          for (SJOStaticCellData* cell in section1)
                                                                          {
                                                                              //Do something with your data
                                                                          }
                                                                          return nil;
                                                                      } 
                                                                      withStyle:SJOCellStyleButton 
                                                                      andAccessoryType:UITableViewCellAccessoryNone];

```
