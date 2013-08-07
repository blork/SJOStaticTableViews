SJOStaticTableViews
===================

Helper for creating form-style/static table views.

##Example

```
//Initialise
_dataSource = [[SJOStaticTableViewDataSource alloc] init];
self.tableView.dataSource = _staticTableViewDataSource
self.tableView.delegate = _staticTableViewDataSource;


//Add cells & sections
_dataSource[@"Section 1"][0] = [SJOStaticCellData cellWithTitle:@"Switch Cell" andAccessory:[[UISwitch alloc] init]];
                                                                      
_dataSource[@"Section 1"][1] = [SJOStaticCellData cellWithTitle:@"Block Cell"
    andActionBlock:^id(SJOStaticCellData *cell) {
        NSLog(@"%@", @"Clicked!");
        return @"Clicked!";
    } 
    withStyle:SJOCellStyleDefault 
    andAccessoryType:UITableViewCellAccessoryDisclosureIndicator];


_dataSource[@"Section 2"][0] = [SJOStaticCellData cellWithTitle:@"Done" 
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
