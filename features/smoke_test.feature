Feature: Smoke test Execution

@test
Scenario: TC_Help_01: Verify the popup for Help (menu bar)
  When I click on the "Help" menu bar
  Then the Help popup should be displayed with the options : "About CEIC" , "Applications" , "Learning" , "CEIC Help" , "Live chat" .

  Scenario: TC_Help_02 - Verify Video tutorials link
   When I click on the "Help" menu bar
   When I click on the "Video tutorials"
   Then Verify page loaded "Video tutorials"


  Scenario: TC_Help_03 - Verify Online tours link
    When I click on the "Help" menu bar
    When I click on the "Online tours"
    Then Verify page loaded "Online tours"

  # Scenario: TC_Help_04 - Verify Start guide link
  #   When I click on the "Help" menu bar
  #   When I click on the "Start guide"
  #   # Then Verify page loaded "Start guide"

  # Scenario: TC_Help_05 - Verify Functions guide link
  #   When I click on the "Help" menu bar
  #   When I click on the "Functions guide"
  #   # Then Verify page loaded "Functions guide"

  Scenario: TC_Help_06 - Verify Search help link
    When I click on the "Help" menu bar
    When I click on the "Search help"
    Then Verify page loaded "Search help"

  Scenario: TC_Help_07 - Verify CEIC mnemonic codes link
    When I click on the "Help" menu bar
    When I click on the "CEIC mnemonic codes"
    Then Verify page loaded "CEIC mnemonic codes"

  Scenario: TC_Help_08 - Verify Keyboard shortcuts link
    When I click on the "Help" menu bar
    When I click on the "Keyboard shortcuts"
    Then Verify page loaded "Keyboard shortcuts"

  Scenario: TC_Help_09 - Verify Footnotes link
    When I click on the "Help" menu bar
    When I click on the "Footnotes"
    Then Verify page loaded "Footnotes"

  # Scenario: TC_Help_10 - Verify Knowledge base link
  #   When I click on the "Help" menu bar
  #   When I click on the "Knowledge base"
  #   # Then Verify page loaded "Knowledge base"

  # Scenario: TC_Help_11 - Verify Contact Us link
  #   When I click on the "Help" menu bar
  #   When I click on the "Contact Us"
  #   # Then Verify page loaded "Contact Us"

  Scenario: TC_Help_12 - Verify Email us link
    When I click on the "Help" menu bar
    When I click on the "Email us"
    Then Verify page loaded "Email us"

  # Scenario: TC_Help_13 - Verify Diagnostics link
  #   When I click on the "Help" menu bar
  #   When I click on the "Diagnostics"
  #   # Then Verify page loaded "Diagnostics"

  Scenario: TC_Help_14 - Verify Report a problem link
    When I click on the "Help" menu bar
    When I click on the "Report a problem"
    Then Verify page loaded "Report a problem"

  Scenario: TC_Help_15 - Verify Excel Addin link
    When I click on the "Help" menu bar
    When I click on the "Excel Addin"
    Then Verify page loaded "Excel Addin"

  Scenario: TC_Help_16 - Verify WPS Addin link
    When I click on the "Help" menu bar
    When I click on the "WPS Addin"
    Then Verify page loaded "WPS Addin"

  Scenario: TC_Help_17 - Verify API link
    When I click on the "Help" menu bar
    When I click on the "API"
    Then Verify page loaded "API"

  Scenario: TC_Help_18 - Verify R link
    When I click on the "Help" menu bar
    When I click on the "r"
    Then Verify page loaded "R"

  Scenario: TC_Help_19 - Verify PyCEIC link
    When I click on the "Help" menu bar
    When I click on the "PyCEIC"
    Then Verify page loaded "PyCEIC"

  Scenario: TC_Help_20 - Verify EViews link
    When I click on the "Help" menu bar
    When I click on the "EViews"
    Then Verify page loaded "EViews"

 Scenario: TC_CEIC_logo_01: Verify the loading of default insight in the right panel when clicked on CEIC logo
    And I click on the CEIC logo
    Then the default insight "Name your insight" should be loaded in the right panel

  Scenario: TC_Download_01: Verify the Download popup when series is selected under Data tab
    Given I have selected two series under the Data tab
    When I click on the Download button
    Then the Download popup should be displayed with the header "Download: Search Results (2 series)"

  Scenario: TC_Download_window_02: Verify the Download popup when series is selected under My Series tab
    Given I have added some series in the My Series tab
    When I click on the Download button
    Then the Download popup should be displayed with the header "Download: My Series (2 series)"

  Scenario: TC_Download_window_03: Verify the Download popup when series is selected under My Series tab and Data tab
    Given I have added some series in the My Series tab
    When I have selected two series under the Data tab
    When I click on the Download button
    Then the Download popup should be displayed with the header "Download: My Series (2 series) or Search Results (2 series)"

  Scenario: TC_Theme_01: Verify Theme popup when clicked on Theme button
    When I click on the "Theme"
    Then the Theme popup should be displayed with the header "Theme"

  Scenario: TC_Notification_01: Verify the Notification popup when clicked on Bell icon
    When I click on the "Notifications"
    Then the Notification popup should be displayed

  Scenario: TC_Profile_01: Verify the profile popup
    When I click on the "View and edit profile information"
    Then the Profile popup should be displayed

  Scenario: TC_Database_01: Verify 'Databases' button
    When I click on the "Databases"
    Then a list of databases should be available

  Scenario: TC_Database_02: Verify Database selection
    When I click on the "Database"
    And I select any DB by clicking on the '+' icon
    Then the result should be loaded only for the selected database

Scenario: TC_Download_02: Verify the downloading of the selected visual
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    And Download visual as "xlsx"
    Then visual should be downloaded in "xlsx"

  Scenario: TC_Copy_to_Clipboard_01: Verify the Copy to Clipboard for the series under Data tab
    Given I have selected two series under the Data tab
    When I click on the "Download"
    When I click on the "Copy to Clipboard"
    Then a growl popup should be displayed with the description "2 selected series copied from Series Search."

  Scenario: TC_My_Searches_01: Verify My Searches popup _ Search tab
    When I click on the "My searches"
    Then "My Searches" popup should be displayed

  Scenario: TC_My_Insights_01 : Verify My Insights hyperlink in the right panel
    When I click on the "My insights"
    Then "My Insights" popup should be displayed

     Scenario: TC_File_menu_01 : Verify File menu popup _ My series tab
    When I click on the "Open File menu"
    Then "File menu" popup should be displayed

  Scenario: TC_File_menu_01 : Verify File menu popup _ My series tab
    When I click on the "My insights"
    When I click on the "View as a grid"
    When I hover on the first insight and click on the share button
    Then "Share" popup should be displayed

  Scenario: TC_View_Tab_01 : Verify File menu popup _ My series tab
    When I click on the "Create new View tab"
    Then "View" popup should be displayed

    Scenario: TC_Text_visual_01 : Verify creation of Text visual under View tab
    When I click on the "Create new View tab"
    When I click on the "Click or drag-and-drop to insert Text"
    Then "Text Visual" popup should be displayed

  Scenario: TC_Image_visual_01 : Verify the creation of Image visual under View tab
    When I click on the "Create new View tab"
    When I click on the "Click or drag-and-drop to insert Image"
    Then "Image Visual" popup should be displayed

  Scenario: TC_Attachments_01 : Verify the cration of Attachments under View tab
     When I click on the "Create new View tab"
      When I click on the "Click or drag-and-drop to insert Attachments"
    Then "Attachment" popup should be displayed

  Scenario: TC_filter_01 : Verify the display of the Trending Data
    When I click on the "Trending Data"
    Then "Trending Data" popup should be displayed

 Scenario: TC_filter_01 : Verify the display of the Data Stories
    When I click on the "Data Stories"
    Then "Data Stories" popup should be displayed

 Scenario: TC_filter_01 : Verify the display of the Watchlist
    When I click on the "Watchlist"
    Then "Watchlist" popup should be displayed

  Scenario: TC_filter_01 : Verify the display of the My All Regions Filter
    When I click on the "All Regions"
    Then "Filter Popup" popup should be displayed
    Then "Cancel" Should be displayed

   Scenario: TC_filter_01 : Verify the display of the Concept Filter
    When I click on the "Concept"
    Then "Filter Popup" popup should be displayed
    Then "Cancel" Should be displayed

   Scenario: TC_filter_01 : Verify the display of the Frequency Filter
    When I click on the "Frequency"
    Then "Filter Popup" popup should be displayed
    Then "Cancel" Should be displayed

  Scenario: TC_filter_01 : Verify the display of the Source Filter
    When I click on the "Source"
    Then "Filter Popup" popup should be displayed
    Then "Cancel" Should be displayed

      Scenario: TC_filter_01 : Verify the display of the Status Filter
    When I click on the "Status"
    Then "Filter Popup" popup should be displayed
    Then "Cancel" Should be displayed

      Scenario: TC_filter_01 : Verify the display of the More Filter
    When I click on the "More"
    Then "Filter Popup" popup should be displayed
    Then "Cancel" Should be displayed

       Scenario: TC_filter_01 : Verify the display of the Pin
    When I click on the "index-module_button"
    Then "Pin" popup should be displayed
    Then "Pin" Should be displayed


      Scenario: TC_filter_01 : Verify the display of the Tags Filter
    When I click on the "Tags"
    Then "Filter Popup" popup should be displayed
     Then "Cancel" Should be displayed

    Scenario: TC_filter_01 : Verify the display of the My searches Filter
    When I click on the "My searches"
    Then "Filter Popup" popup should be displayed


    Scenario: TC_DataTab_01 : Verify the display of the Data --> Databases
    When I click on the "Data"
    When I click on the "Databases"
    Then "Database" popup should be displayed
    Then "Recommended tables" Should be displayed

   Scenario: TC_DataTab_01 : Verify the display of the Data --> Databases
    When I click on the "Data"
    When I click on the "Series"
    Then "Series" popup should be displayed
    Then "Series" Should be displayed

   Scenario: TC_DataTab_01 : Verify the display of the Data --> Datasets
    When I click on the "Data"
    When I click on the "Datasets"
    Then "Datasets" popup should be displayed
    Then "Title" Should be displayed



     Scenario: TC_Analysis_01 : Verify the display of the Analysis
    When I click on the "Analysis"
    Then "Analysis" popup should be displayed
    Then "Analysis" Should be displayed

     Scenario: TC_Comparables_01 : Verify the display of Comparables
    When I click on the "Comparables"
    Then "Comparables" popup should be displayed
    Then "Comparables" Should be displayed

    Scenario: TC_Releases_01 : Verify the display of Releases
    When I click on the "Releases"
    Then "Release" popup should be displayed
    Then "Releases" Should be displayed

     Scenario: TC_search_01 : Verify the display of Search Suggestions 
    When I click on the "search-input-text"
    Then "Search Suggestions" popup should be displayed
  
      Scenario: TC_search_01 : Verify the display of Search link
    When I click on the "series-series-count--number"
    Then "File menu" popup should be displayed

      Scenario: TC_search_01 : Verify the display of expander 
    When I click on the "insight-search-header--expander"
    Then "Expand" popup should be displayed

  # =====================================================
  # 1. Line Chart
  # =====================================================
  Scenario: Verify Line chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Line"
    Then User should see the following sub visuals displayed:
      | Line     |
      | Dotted   |
      | Spline   |
      | Step     |
      | Category |

  # =====================================================
  # 2. Area Chart
  # =====================================================
  Scenario: Verify Area chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Area"
    Then User should see the following sub visuals displayed:
      | Area              |
      | Stacked area      |
      | 100% Stacked area |

  # =====================================================
  # 3. Column Chart
  # =====================================================
  Scenario: Verify Column chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Column"
    Then User should see the following sub visuals displayed:
      | Column                  |
      | Stacked column          |
      | 100% Stacked column     |
      | Category column         |
      | Stacked category column |

  # =====================================================
  # 4. Waterfall Chart
  # =====================================================
  Scenario: Verify Waterfall chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Waterfall"
    Then User should see the following sub visuals displayed:
      | Waterfall |

  # =====================================================
  # 5. Bar Chart
  # =====================================================
  Scenario: Verify Bar chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Bar"
    Then User should see the following sub visuals displayed:
      | Bar                   |
      | Stacked bar           |
      | 100% Stacked bar      |
      | Category bar          |
      | Stacked category bar  |

  # =====================================================
  # 6. Stripe Chart
  # =====================================================
  Scenario: Verify Stripe chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Stripe"
    Then User should see the following sub visuals displayed:
      | Stripe |

  # =====================================================
  # 7. Range Chart
  # =====================================================
  Scenario: Verify Range chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Range"
    Then User should see the following sub visuals displayed:
      | Column Range |
      | Bar Range    |

  # =====================================================
  # 8. Table Visual
  # =====================================================
  Scenario: Verify Table sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Table"
    Then User should see the following sub visuals displayed:
      | Vertical table            |
      | Horizontal table          |


    # =====================================================
  # 8. Category Table Visual
  # =====================================================
  Scenario: Verify Table sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Category table"
    Then User should see the following sub visuals displayed:
      | Category vertical table   |
      | Category horizontal table |




  # =====================================================
  # 9. Pie Chart
  # =====================================================
  Scenario: Verify Pie chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Pie"
    Then User should see the following sub visuals displayed:
      | Pie   |
      | Donut |

  # =====================================================
  # 10. Map Chart
  # =====================================================
  Scenario: Verify Map chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Map"
    Then User should see the following sub visuals displayed:
      | Map        |
      | Bubble map |

  # =====================================================
  # 11. Heat Map Chart
  # =====================================================
  Scenario: Verify Heat map chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Heat map"
    Then User should see the following sub visuals displayed:
      | Heat map          |
      | Category heat map |

  # =====================================================
  # 12. Tree Map Chart
  # =====================================================
  Scenario: Verify Tree map chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Tree map"
    Then User should see the following sub visuals displayed:
      | Tree map |

  # =====================================================
  # 13. Scatter Chart
  # =====================================================
  Scenario: Verify Scatter chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Scatter"
    Then User should see the following sub visuals displayed:
      | Scatter |

  # =====================================================
  # 14. Spaghetti Chart
  # =====================================================
  Scenario: Verify Spaghetti chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Spaghetti"
    Then User should see the following sub visuals displayed:
      | Spaghetti |

  # =====================================================
  # 15. Bubble Chart
  # =====================================================
  Scenario: Verify Bubble chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Bubble"
    Then User should see the following sub visuals displayed:
      | Bubble |

  # =====================================================
  # 16. OHLC Chart
  # =====================================================
  Scenario: Verify OHLC chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "OHLC"
    Then User should see the following sub visuals displayed:
      | OHLC |

  # =====================================================
  # 17. Candlestick Chart
  # =====================================================
  Scenario: Verify Candlestick chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Candlestick"
    Then User should see the following sub visuals displayed:
      | Candlestick |

  # =====================================================
  # 18. Box Plot Chart
  # =====================================================
  Scenario: Verify Box Plot chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Box Plot"
    Then User should see the following sub visuals displayed:
      | Box Plot |

  # =====================================================
  # 19. Dumbbell Chart
  # =====================================================
  Scenario: Verify Dumbbell chart sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Dumbbell"
    Then User should see the following sub visuals displayed:
      | Dumbbell |

  # =====================================================
  # 20. Text Visual
  # =====================================================
  Scenario: Verify Text visual sub visuals are displayed correctly
    When I click on the "Theme"
    When I click on the "Charts settings"
    When I click on the "Select type"
    When I click on "Text"
    Then User should see the following sub visuals displayed:
      | Text |

   
   
  Scenario: TC_Visual_dropdown_01 : Verify the Visual dropdown _ Visual toolbar _ Visual
      When Create a visual with "2" series "5724301;5823501;"
      And Right click on series
      And click on Add chart
      And Select "Line" visual
      Then "Line" visual should be created
      When I click on the "chart-type-switcher-context-menu--text"
      Then "Visual dropdown" popup should be displayed

 
  Scenario: TC_Annotations_01 : Verify the Annotation dropdown _ Visual toolbar _ Visual
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "annotations-context-menu--text"
    Then "File menu" popup should be displayed

  
  Scenario: TC_Edit_Series_01 : Verify the Series button _ Visual toolbar _ Visual
   When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "edit-series-btn"
    Then "Edit series" popup should be displayed

  
  Scenario: TC_Download_icon_01 : Verify the Download icon _ Visual toolbar _ Visual
      When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "Download"
    Then "Download" popup should be displayed

  
  Scenario: TC_Copy_icon_01 : Verify the Copy icon _ Visual toolbar _ Visual
      When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "Make a copy (Ctrl+C)"
    Then "Growl" popup should be displayed

 
  Scenario: TC_Post_to_LinkedIn_01 : Verify Post to LinkedIn option _ Visual toolbar _ Visual
      When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "Share and publish"
    When I click on the "Embed"
    Then "Embed" popup should be displayed

  Scenario: TC_Embed_01 : Verify Embed option _ Visual toolbar _ Visual
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "Share and publish"
    When I click on the "Publish to LinkedIn"
    Then "LinkedIn" popup should be displayed

  Scenario: TC_Delete_icon_01 : Verify Delete icon _ Visual toolbar _ Visual
     When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "Delete (Delete)"
   Then "Confirmation" popup should be displayed

  Scenario: TC_Settings_icon_01 : Verify Settings icon _ Visual toolbar _ Visual
      When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "Chart Settings"
   Then "Chart Settings" popup should be displayed

  Scenario: TC_Choose_Date_01 : Verify Choose date (Calendar icon)_ Visual toolbar _ Visual
     When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    When I click on the "Choose date"
   Then "Date" popup should be displayed

    Scenario: TC_Series_info_01 : Verify the display of the Series information popup _ Series Legend _ Visual
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Mouse houring on "Exports fob"
    Then "Series info" popup should be displayed

    Scenario: TC_SSP_Window_01 : Verify the display of the SSP Window _ Series Legend _ Visual
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then I click on the "Exports fob"
    Then "SSP Window" popup should be displayed


   Scenario: TC_<VisualName> visual_01: Verify the <VisualName> visual 
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "<VisualName>" visual
    Then "<VisualName>" visual should be created

Examples:
  | VisualName                 |
  | Line                       |
  | Spline                     |
  | Step                       |
  | Dotted                     |
  | Category line              |
  | Pie                        |
  | Donut                      |
  | Area                       |
  | Stacked area               |
  | Column                     |
  | Stacked column             |
  | Category column            |
  | Stacked category column    |
  | Waterfall                  |
  | Bar                        |
  | Stacked bar                |
  | Category bar               |
  | Stacked category bar       |
  | Stripe                     |
  | Column Range               |
  | Bar Range                  |
  | Map                        |
  | Bubble map                 |
  | Heat map                   |
  | Category heat map          |
  | Tree map                   |
  | Scatter                    |
  | Spaghetti                  |
  | Bubble                     |
  | OHLC                       |
  | Candlestick                |
  | Vertical table             |
  | Horizontal table           |
  | Category vertical table    |
  | Category horizontal table  |
  | Box Plot                   |
  | Dumbbell                   |


  Scenario: TC_SynonymSearch_06:Search for an Acronym as "GDP"
    Given User enters keyword "GDP"
    Then Result should be displayed by "gdp" or "gross domestic product"

  Scenario: TC_SynonymSearch_011 : Search for an Acronym as "CPI"
    Given User enters keyword "CPI"
    Then Result should be displayed by "cpi" or "consumer price index"

  Scenario: TC_SynonymSearch_012 : Search for an Acronym as "IPI"
    Given User enters keyword "IPI"
    Then Result should be displayed by "ipi" or "industrial production index"

  Scenario: TC_SynonymSearch_025 : Search for an Acronym as "ytd"
    Given User enters keyword "ytd"
    Then Result should be displayed by "ytd" or "year to date"

  Scenario: TC_SynonymSearch_027 : Search for an Acronym as "USD"
    Given User enters keyword "USD"
    Then Result should be displayed by "usd" or "united states dollar"

  Scenario: TC_SynonymSearch_028: Search for an Acronym as "yoy"
    Given User enters keyword "yoy"
    Then Result should be displayed by "yoy" or "year on year"

  Scenario: TC_SynonymSearch_030 : Search for an Acronym as "crb"
    Given User enters keyword "crp"
    Then Result should be displayed by "crp" or "commodity research bureau"

   Scenario: TC_Series visual_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then "Unselect" Should be Displayed 

    Scenario: TC_Series visual_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Series Name"
   Then "Tooltip" Should be Displayed 

    Scenario: TC_Series visual_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "Related data"
   Then "Dataset" Should be Displayed 
   Then "Series" Should be displayed

    Scenario: TC_Series visual_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "menu-icon change-alert-icon"
   Then "Watchlist" Should be Displayed 

     Scenario: TC_Series visual_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "view-chart-icon menu-icon"
   Then "Chart" Should be Displayed 

     Scenario: TC_Series visual_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "open-footnotes-icon menu-icon"
   Then "Footnote" Should be Displayed 

   Scenario: TC_Series visual_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 

   Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   Then Mouse over on the "Add"
   When I click on the "(A)"
   Then "seriesName" Should be Displayed

      Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   Then Mouse over on the "Add"
   When I click on the "(G)"
   Then "groupName" Should be Displayed

       Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   When I click on the "Add to new insight"
   Then "GrowlMessage" Should be Displayed

      Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   Then Mouse over on the "AddToExitingInsight"
   When I click on the Checkbox
   When I click on the "Add"
   Then "GrowlMessage" Should be Displayed

      Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   Then Mouse over on the "addChart"
   Then "Visual" Should be Displayed

  Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   When I click on the "(D)"
   Then "Download" Should be Displayed

  Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   Then Mouse over on the "Set watchlist alert"
   Then "Watchlist" Should be Displayed

  Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   When I click on the "Series Info"
   Then "SSP" Should be Displayed

  Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   When I click on the "Footnotes"
   Then "Footnote" Should be Displayed 

  Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "449519837"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   When I click on the "See in Database"
   Then "Series" Should be displayed

  Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   Then Mouse over on the "Country"
   When I click on the "More actions"
   Then "Menu" Should be Displayed 
   Then Mouse over on the "Realated Data" 
   When I click on the "Show Dataset"
   Then "Dataset" Should be Displayed 
   Then "Series" Should be displayed


  Scenario: TC_Series_01: Verify the Series Options 
   Given User enters keyword "5198401"
   When I click on the Checkbox
   When I click on the "series-item--name"
   Then "SSP" Should be displayed


   Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "My insights"
    When I click on the "Favorite"
    Then "Insights" Should be displayed

    Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "My insights"
    When I click on the "Created"
    Then "Insights" Should be displayed

      Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "My insights"
    When I click on the "Shared"
    Then "Insights" Should be displayed

     Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "My insights"
    When I click on the "All"
    Then "Insights" Should be displayed

      Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "My insights"
    When I click on the "View as a grid"
    Then "Grid" Should be displayed 

  Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "My insights"
    When I click on the "View as a table"
    Then "Table" Should be displayed 

    Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Text"
    Then "Source: CEIC Data" Should be displayed 
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then "Source: CEIC Data" Should be displayed

    Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Image"
    Then "Image" Should be displayed 
    When I click on the "Apply"
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then "image" Should be displayed

    Scenario: TC_MyInsight_01 : Verify the display of the My insight Options
    When I click on the "Theme"
     When I click on the "Reset to default"
    When click on "Source"
    Then "Sources: CEIC" Should be displayed 
    When I click on the "Apply"
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then "Sources: CEIC, General Administration of Customs, NBS" Should be displayed

    Scenario: TC_Theme_01 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
    Then Choose the "Source: CEIC Data" and validate "color" as "rgb(144, 144, 144)"
    When I click on the "Apply"
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "color" as "rgb(144, 144, 144)"

    Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
    Then Choose the "Source: CEIC Data" and validate "size" as "12px"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "size" as "12px"

    Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
    When Choose the "Italic" "Copyright" "True"
    Then Choose the "Source: CEIC Data" and validate "italic" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "italic" as "true"

     Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
     When Choose the "Bold" "Copyright" "True"
    Then Choose the "Source: CEIC Data" and validate "bold" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "bold" as "true"

      Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
     When Choose the "Underline" "Copyright" "True"
    Then Choose the "Source: CEIC Data" and validate "underline" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "underline" as "true"

         Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
    When Choose the "Alignment" "Copyright" "center"
    Then Choose the "Source: CEIC Data" and validate "alignment" as "center"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "alignment" as "center"

          Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
    When Choose the "Alignment" "Copyright" "right"
    Then Choose the "Source: CEIC Data" and validate "alignment" as "right"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "alignment" as "right"

         Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Text"
    When Choose the "Alignment" "Copyright" "left"
    Then Choose the "Source: CEIC Data" and validate "alignment" as "left"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Source: CEIC Data" and validate "alignment" as "left"

    Scenario: TC_Theme_01 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Source"
    Then Choose the "Sources: CEIC" and validate "color" as "rgb(144, 144, 144)"
    When I click on the "Apply"
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "color" as "rgb(144, 144, 144)"

    Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Source"
    Then Choose the "Sources: CEIC" and validate "size" as "12px"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "size" as "12px"

    Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
   When click on "Source"
    When Choose the "Italic" "Copyright" "True"
    Then Choose the "Sources: CEIC" and validate "italic" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "italic" as "true"

     Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Source"
     When Choose the "Bold" "Copyright" "True"
    Then Choose the "Sources: CEIC" and validate "bold" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "bold" as "true"

      Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Source"
     When Choose the "Underline" "Copyright" "True"
    Then Choose the "Sources: CEIC" and validate "underline" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "underline" as "true"

         Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Source"
    When Choose the "Alignment" "Copyright" "center"
    Then Choose the "Sources: CEIC" and validate "alignment" as "center"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "alignment" as "center"

          Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Source"
    When Choose the "Alignment" "Copyright" "right"
    Then Choose the "Sources: CEIC" and validate "alignment" as "right"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "alignment" as "right"

         Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
  When click on "Source"
    When Choose the "Alignment" "Copyright" "left"
    Then Choose the "Sources: CEIC" and validate "alignment" as "left"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Sources: CEIC" and validate "alignment" as "left"

    Scenario: TC_Theme_01 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
    Then Choose the "Line chart" and validate "color" as "rgb(0, 0, 0)"
    When I click on the "Apply"
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "color" as "rgb(0, 0, 0)"

    Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When I click on the "Text"
    Then Choose the "Line chart" and validate "size" as "17px"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "size" as "17px"

    Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
   When I click on the "Text"
    When Choose the "Italic" "Title" "True"
    Then Choose the "Line chart" and validate "italic" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "italic" as "true"

     Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Text"
    #  When Choose the "Bold" "Title" "True"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "bold" as "true"

      Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Text"
     When Choose the "Underline" "Title" "True"
    Then Choose the "Line chart" and validate "underline" as "true"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "underline" as "true"

         Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Text"
    When Choose the "Alignment" "Title" "center"
    Then Choose the "Line chart" and validate "alignment" as "center"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "alignment" as "center"

          Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
    When I click on the "Reset to default"
    When click on "Text"
    When Choose the "Alignment" "Title" "right"
    Then Choose the "Line chart" and validate "alignment" as "right"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "alignment" as "right"

         Scenario: TC_Theme_02 : Verify the display of the My insight Options
    When I click on the "Theme"
  When click on "Text"
    When Choose the "Alignment" "Title" "left"
    Then Choose the "Line chart" and validate "alignment" as "left"
    When I click on the "Apply"
    Then "Growl" popup should be displayed
    When Create a visual with "2" series "5724301;5823501;"
    And Right click on series
    And click on Add chart
    And Select "Line" visual
    Then "Line" visual should be created
    Then Choose the "Chart" and validate "alignment" as "left"

  Scenario: TC_Analysis_01: Verify Sub tabs under Analysis
    And Verify Sub tabs under Analysis

  Scenario: TC_Analysis_02: Verify search for Analysis
    And Verify search for Analysis
							
  Scenario: TC_Analysis_04: Verify Sort by dropdown
    And Verify Sort by dropdown

      Scenario: TC_Imported_Tab_01: Verify the Import tab _ Search tab
    When I click on the "Imported"
    Then the Imported tab should be loaded and displayed with the series
    When I click on the "Data"

     Scenario: TC_DataTab_01 : Verify the display of the Data --> Imported
    When I click on the "Data"
    When I click on the "Imported"
    Then "Imported" popup should be displayed
    Then "ImportSeries" Should be displayed

      Scenario: TC_Import_series_01: Verify the popup for Import Series
    When I click on the "import" button
    Then the Import series popup should be displayed

    Scenario: TC_Import_series_01: Verify the popup for Import Series
    When I click on the "import" button
    Then the Import series popup should be displayed

  Scenario: TC_Text_visual_01 : Verify creation of Text visual under View tab
    When I click on the "Create new View tab"
    When I click on the "Click or drag-and-drop to insert Text"
    Then "Text Visual" popup should be displayed

  Scenario: TC_Image_visual_01 : Verify the creation of Image visual under View tab
    When I click on the "Create new View tab"
    When I click on the "Click or drag-and-drop to insert Image"
    Then "Image Visual" popup should be displayed

  Scenario: TC_Attachments_01 : Verify the cration of Attachments under View tab
    When I click on the "Create new View tab"
    When I click on the "Click or drag-and-drop to insert Attachments"
    Then "Attachment" popup should be displayed
    When I click on the "Attachments Settings"
    When I click on the "Close"
    Then Choose the "Attachments" and validate "color" as "rgb(0, 0, 0);"

  Scenario: TC_Attachments_08:Verify text color
      When I click on the "Create new View tab"
    When I click on the "Click or drag-and-drop to insert Attachments"
    Then "Attachment" popup should be displayed
     When I click on the "Attachments Settings"
     Then User should see the following sub visuals displayed:
      | General                  |
      | Headings          |
      | Style     |

  Scenario: TC_function_105:Verifying Currency Conversion for 'Greek Drachma (GRD)'
    Given Create insight and add series "310939101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions105" testdata file

  
  Scenario: TC_function_106:Verifying Currency Conversion for 'Greek Drachma (GRD)'
    Given Create insight and add series "310907101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions106" testdata file

  
  Scenario: TC_function_107:Verifying Currency Conversion for 'Greek Drachma (GRD)'
    Given Create insight and add series "310918901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions107" testdata file

  
  Scenario: TC_function_108:Verifying Currency Conversion for 'Forint (HUF)'
    Given Create insight and add series "310918801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions108" testdata file

  
  Scenario: TC_function_109:Verifying Currency Conversion for 'Rupiah (IDR)'
    Given Create insight and add series "310912701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions109" testdata file

  
  Scenario: TC_function_110:Verifying Currency Conversion for 'Israeli Sheqel(ILS)'
    Given Create insight and add series "310919001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions110" testdata file

  
  Scenario: TC_function_111:Verifying Currency Conversion for 'Israeli Sheqel(ILS)'
    Given Create insight and add series "310908801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions111" testdata file

  
  Scenario: TC_function_112:Verifying Currency Conversion for 'Irish Pound (IEP)'
    Given Create insight and add series "310904001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions112" testdata file

  
  Scenario: TC_function_113:Verifying Currency Conversion for 'Irish Pound (IEP)'
    Given Create insight and add series "310919401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions113" testdata file

  
  Scenario: TC_function_114:Verifying Currency Conversion for 'Irish Pound (IEP)'
    Given Create insight and add series "310918701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions114" testdata file

  
  Scenario: TC_function_115:Verifying Currency Conversion for 'Japanese Yen (JPY)'
    Given Create insight and add series "310907001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions115" testdata file

  
  Scenario: TC_function_116:Verifying Currency Conversion for 'Korean Won (KRW)'
    Given Create insight and add series "310913101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions116" testdata file

  
  Scenario: TC_function_117:Verifying Currency Conversion for Tenge (KZT)
    Given Create insight and add series "310920601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions117" testdata file

  
  Scenario: TC_function_118:Verifying Currency Conversion for Tenge (KZT)
    Given Create insight and add series "310911301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions118" testdata file

  
  Scenario: TC_function_119:Verifying Currency Conversion for 'Sri Lanka Rupee (LKR)'
    Given Create insight and add series "310902601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions119" testdata file

  
  Scenario: TC_function_120:Verifying Currency Conversion for 'Moldovan Leu (MDL)'
    Given Create insight and add series "310903701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions120" testdata file

  
  Scenario: TC_function_121:Verifying Currency Conversion for 'Denar (MKD)'
    Given Create insight and add series "310911101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions121" testdata file

  
  Scenario: TC_function_122:Verifying Currency Conversion for 'Macau Pataca (MOP)'
    Given Create insight and add series "310918301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions122" testdata file

  
  Scenario: TC_function_123:Verifying Currency Conversion for 'Mexican Peso (MXN)'
    Given Create insight and add series "310912301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions123" testdata file

  
  Scenario: TC_function_124:Verifying Currency Conversion for 'Malaysian Ringgit (MYR)'
    Given Create insight and add series "310912501" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions124" testdata file

  
  Scenario: TC_function_125:Verifying Currency Conversion for 'Norwegian Krone (NOK)'
    Given Create insight and add series "310903401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions125" testdata file

  
  Scenario: TC_function_126:Verifying Currency Conversion for 'Norwegian Krone (NOK)'
    Given Create insight and add series "310914601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-12-31"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions126" testdata file


   # ---------------------------------------------------------#


#     Scenario: TC_01 : Verifying All of these words
#     And I click on the "More"
#     And I click on the "Advanced search"
#     And Enter All of these words as "India;Japan;Russia;China"
#     And I click on the "Search"
#     Then Result should be displayed by "India;Japan;Russia;China" or "India;Japan;Russia;China"

 
#   Scenario: TC_02 : Verifying Any of these words
#     And Click on "More" filter
#     And Click on "Advanced search"
#     And Enter All of these words as "Import;Export"
#     And I click on the "Search"
#     Then Any of the words should display in the result pane1

  
#   Scenario: TC_03 : Verifying Exact phrase	
#     And Click on "More" filter
#     And Click on "Advanced search"
#     And Enter Exact phrase as "Retail Price"
#     And Click on "Search" button
#     Then Exact keyword should display in the result pane


#   Scenario: TC_04 : Verifying Exclude these words
#     And Click on "More" filter
#     And Click on "Advanced search"
#     And Enter Exclude words as "Import;Export"
#     And Click on "Search" button
#     Then Search results should dispaly with out searching keywords

 
#   Scenario: TC_05 : Verifying Any of these series IDs
#     And Click on "More" filter
#     And Click on "Advanced search"
#     And Enter Any of these series IDs as "274069502;274027202"
#     And Click on "Search" button
#     Then Verify the Search results


#   Scenario: TC_06:Verifying "With historical extension of continuous series" filter for series tab
#     And User has selects "More" as "With historical extension of continuous series"
#     When Click on "Apply filter"
#     Then User verify corresponding results for selected filter

  
#   Scenario: TC_07:Verifying "Hide series with 0 observations" filter for series tab
#     And User has selects "More" as "Hide series with 0 observations"
#     When Click on "Apply filter"
#     Then User verify corresponding results for selected filter

      
#   Scenario: TC_MS_01: Verify Expand view
#     And Select the Expand Icon
#     And Verify View panel which should be Expanded


#   Scenario: TC_MS_02: Verify series options if "NO" series under "My series" tab
#     And Verify for "NO" series functionality under "My series" tab

  
#   Scenario: TC_MS_03: Verify Related series option
#     And Select some series to my series tab
#     And Select all series
#     And select the Related series option
#     And Verify the Series suggestion manager popup

 
#   Scenario: TC_MS_04: Verify Rename option
#     And Select some series to my series tab
#     And Select all series
#     And select the Rename series option
#     And Verify the Rename popup


#   Scenario: TC_MS_76: Delete - Verify the associated visuals after deleted series
#     And Create visuals as Chart
#     And Select to myseries button and select the delete option
#     And Verify Delete option associated visuals after deleted series

   
#   Scenario: TC_MS_96: Verify Copy option
#     And Select some series to my series tab
#     And Select all series
#     And Select Copy option
#     And verify the Copy option

 
#   Scenario: TC_MS_97: Verify the confirmation message for Copy action
#     And Select some series to my series tab
#     And Select all series
#     And Select Copy option
#     And verifct Calculate Change from Popular dropdown
#     And verify the Calculate Change is applied for a series

 
#   Scenario: TC_MS_101: Verify Aggregate
#     And User Select Series ID  as "402529207"
#     And Select Aggregate from Popular dropdown
#     And verify the Aggregate is applied for a seriesy the confirmation message for Copy action

 
#   Scenario: TC_MS_99: Verify Currency Conversion
#     And User Select Series ID  as "402529207"
#     And Select Currency Conversion from Popular dropdown
#     And verify the Currency Conversion is applied for a series

  
#   Scenario: TC_MS_100: Verify Calculate Change
#     And User Select Series ID  as "402529207"
#     And Sele


#   Scenario: Tc_Comparables_01: Verify results loading in comparable tab
#     And Clicking on "Comparables" icon
#     Then The Section level results for series should be present

#   Scenario: Tc_Comparables_03: Verify disappearing comparables in search tab
#     And Click three dots in search pane
#     And "Uncheck"  "Comparables" checkbox
#     And Clicking "Save" button in search popup
#     Then Comparables tab "should not" be visible in search pane


#   Scenario: Tc_Comparables_04: Verify showing comparables in search tab
#     And Click three dots in search pane
#     And "Check"  "Comparables" checkbox
#     And Clicking "Save" button in search popup
#     Then Comparables tab "should" be visible in search pane


#   Scenario: Tc_FilterVisual_1:Verify creating filter visual
#     Then "Filter" visual should be created	
    


#   Scenario: Tc_FilterVisual_2:Verify content present in the filter visual
#     Then Below optins should be displayed
#       | Filter Settings |
#       | Download        |
#       | Delete          |


#   Scenario: Tc_FilterVisual_3:Verify creating filter visual with other visuals
#     And Create any other visuals in a view
#     And Create filter visual
#     #And Click inside filter visual
#     Then Countries name which are included in the other all visual should be listed and displayed

  
#   Scenario: Tc_FilterVisual_4:Verify expanding filter visual
#     And Click on Open icon
#     Then The visual should be displayed in maximized window


#   Scenario: Tc_FilterVisual_5:Verify contrasting filter visual.
#     And Click on Open icon
#     And Click on x icon to close
#     Then The modal window should be closed

 
#   Scenario: Tc_FilterVisual_6:Verify changing title of the filter
#     And Mouse hover on visual title
#     And Click on edit icon
#     And click on name icon
#     Then Small title window be enabled  to edit the name of the title

 
#   Scenario: Tc_FilterVisual_7:Verify checking subtitle of the filter visual
#     And Mouse hover on visual title
#     And Click on edit icon	
#     And Check sub-title
#     Then Sub title should be displayed for the visual

   
#   Scenario: TC_DB_02: Verifying Database selection
#     Given Click on More filter
#     And Select database as "India Premium Database"
#     And User has clicked on "Apply filter"
#     Then Result should be loaded only for selected database

#   Scenario: TC_DB_3: Verify Filters for DB tab
#     And User selects "All Regions" as "Japan"
#     And User has clicked on "Apply filter"
#     And Click on "More" filter
#     And User selected "Database" as "Global Database"
#     And User has clicked on "Apply filter"
#     Then Result should be displayed as per the filters applied

 
#   Scenario: TC_DB_05: Verifying remove icon for database
#     Given Click on More filter
#     And Select database as "World Trend Plus"
#     And User has clicked on "Apply filter"
#     And Click on x icon to remove DB
#     Then Selected database shold be removed

#   Scenario: TC_DB_4:Verify 'Reset' button
#     And User selects "Source" as "World Bank"
#     And User has clicked on "Apply filter"
#     When Click on "Reset"
#     Then Selected options should be reset to default

 
#   Scenario: TC_DB_12: Verifying Expand option when search/filter applied
#     Given User enters keyword "Bangaluru"
#     #And Click on "Expand all"
#     Then The data tree should be expanded

#   #series will expand when the series count shoild be less than or below 1000 series .
  
#   Scenario: TC_DB_13: Verifying Collapse option when search/filter applied
#     Given User enters keyword "bang"
#     And Click on "Collapse all"
#     Then The data tree should be collapsed

 
#   Scenario: TC_ExcelDownload_01:Verifying Date drop down for available options
#     And User Select Series ID  as "310902101"
#     And Select Download button
#     And Select Date drop down
#     Then Automatic and Custom Date drop down should be available


#   Scenario: TC_ExcelDownload_02:Verifying default decimal place
#     And User Select Series ID  as "310902101"
#     And Select Download button	
#     Then default decimal place to be as 3

  
#   Scenario:TC_ExcelDownload_03:Verifying available range of decimal places
#     And User Select Series ID  as "310902101"
#     And Select Download button
#     And Select Decimal drop down
#     Then decimal range should be as 0-8

 
#   Scenario:TC_ExcelDownload_04:Verifying Adjust column and wrap text option
#     And User Select Series ID  as "310902101"
#     And Select Download button
#     Then Adjust column and wrap text option should be present

  
#   Scenario: TC_ExcelDownload_05:Verifying Create a chart with series is available
#     And User Select Series ID  as "310902101"
#     And Select Download button
#     Then Create a chart with series is available


#   Scenario: TC_ExcelDownload_06:Verifying Date order option is available
#     And User Select Series ID  as "310902101"
#     And Select Download button
#     Then Ascending and  Descending date order radio buttons should be present

 
#   Scenario:TC_ExcelDownload_07:Verifying orientation option option is available
#     And User Select Series ID  as "310902101"
#     And Select Download button
#     Then Columns and Rows radio buttons should be present

    
#   Scenario: Tc_Footnotes_03: Verify footnotes open in current tab
#     And Find the Footnote option in menu bar
#     And Click Open to verify the footnotes

 
#   Scenario: Tc_Footnotes_04: Verify footnotes open in new tab
#     And Find the Footnote option in menu bar
#     And Click 'Open in a new tab' to verify footnotes

  
#   Scenario: Tc_Footnotes_05: Verify minimizing the footnote window
#     And Find the Footnote option in menu bar
#     And Select '-' icon to minimize
#     And Verify minimizing the footnote window

 
#   Scenario: Tc_Footnotes_06: Verify maximizing the footnote window
#     And Find the Footnote option in menu bar
#     And Select '-' icon to minimize
#     And select '-' icon to maximize
#     And Verify maximizing the footnote window

 
#   Scenario: Tc_Footnotes_07: Verify opening footnotes in new tab from footnote window
#     And Find the Footnote option in menu bar
#     And Click on Open icon to verify footnotes open in new tab

  
#   Scenario: Tc_Footnotes_08: Verify opening of footnotes as full screen
#     And Find the Footnote option in menu bar
#     And Click on cross arrow marks to verify footnotes as full screen

 
#   Scenario: Tc_Footnotes_09: Verify exit of Footnotes from full screen
#     And Find the Footnote option in menu bar
#     And Click on cross arrow marks to verify footnotes exit full screen


#   Scenario: Tc_Forecast Series Sugg _01:Verify forecast tab in series suggestion tab
#     Given User enters "399976317"
#     And Add series to the right pane
#     And Click on "Related Series"
#     Then "Forecast" tab should be seen in series suggestion manager window


#   Scenario: Tc_Forecast Series Sugg _02:Verify series having forecast suggestions in search pane
#     Given User enters "399976317"
#     And Add series to the right pane
#     And Open SSP window for the series
#     Then "Forecasts" suggestions flag bar should be shown


#   Scenario: Tc_Forecast Series Sugg _03:Verify dropdown for series having suggestion in search pane
#     Given User enters "399976317"
#     And Add series to the right pane
#     And Open SSP window for the series
#     And Check the checkbox for forecast series
#     Then Chart with forecast suggestions legends should be displayed


#   Scenario: Tc_Forecast Series Sugg _04:Verify deselecting legends in forecast suggestion dropdown
#     Given User enters "399976317"
#     And Add series to the right pane
#     And Open SSP window for the series
#     And Check the checkbox for forecast series
#     And click on cross icon for any legends name
#     Then Cross clicked legend of the chart in suggestion chart should be disabled


#   Scenario: Tc_Forecast Series Sugg _12:Verify opening ssp for more than suggestion of forecast in its chart suggestion dropdown
#     Given User enters "399976317"
#     And Add series to the right pane
#     And Open SSP window for the series
#     And Check the checkbox for forecast series
#     And Click on suggested series of forecast
#     Then Should be able to open respective ssp window

 
#   Scenario: Tc_Forecast Series Sugg _13:Verify collapsing available suggestion in forecast tab
#     Given User enters "399976317"
#     And Add series to the right pane
#     And Click on "Related Series"
#     And Click on minus sign checkbox
#     Then All opened forecast suggestions are collapsed


#   Scenario: Tc_Forecast Series Sugg _14:Verify expanding collapsed suggestion in forecast tab
#     Given User enters "399976317"
#     And Add series to the right pane
#     And Click on "Related Series"
#     And Click on minus sign checkbox
#     And click again on plus sign checkbox
#     Then Closed forecast suggestions must be expanded

#   Scenario: TC_ImportUDD_01: Verify the latest uploaded UDD series on top of the list
#     Given I import a UDD series
#     When the imported series is displayed on top of all available series under the 'Imported' tab
#     Then the latest uploaded UDD series should be displayed on top

  
#   Scenario: TC_ImportUDD_03: Verify case-insensitive search by User series ID and Category
#     Given I import a UDD series
#     Given I search UDD series with its attributes like User series ID and Category
#     Then the related series should be displayed


#   Scenario: TC_ImportUDD_06: Verify Download for User data template
#     Given I click on the 'Import series' button.
#     When I click on the hyperlink "CEIC Defined template"
#     Then the CDMNext template should be downloaded in Excel format

  
#   Scenario: TC_ImportUDD_07: Verify importing series with all attributes from CDMNext template
#     Given I download CDMNext template
#     When I fill the details for series in Excel
#     And I import from CDMNext
#     Then the series should be imported successfully and should be available under the Imported tab

  
#   Scenario: TC_ImportUDD_08: Verify uploading already imported CDMNext template
#     Given I download CDMNext template
#     And I fill the details for series in Excel
#     And I import from CDMNext and the series is reflected
#     When I import the file again
#     Then the "Data can't be uploaded." popup should be displayed


#   Scenario: TC_03: Verify related series tab in my series for opening indicator tab
#     And Select some series to my series tab
#     And select all series check box checked
#     And try click on selecting related series in my series
#     Then related series button should be enabled

 
#   Scenario: TC_04: Verify mouse point hover on I icon of indicator tab
#     And Select some series to my series tab
#     And select all series check box checked
#     And click on related series tab
#     And hover mouse on I icon of indicator tab
#     Then Tooltip should be displayed

 
#   Scenario: TC_05:Verify country tabs creation in indicators of series suggestion manager window
#     And Select some series to my series tab
#     And select all series check box checked
#     And click on related series tab
#     And Add indicators to my series by click on plus icon beside indicators of country selected
#     Then Maximum of 5 country/region tabs can be created


#   Scenario: TC_06: Verify opening select a region for indicators
#     And Select some series to my series tab
#     And select all series check box checked
#     And click on related series tab
#     And click on select a region text box dropdown
#     Then Regions list for selecting DB series should be opened


#   Scenario: TC_07:Verify footnotes open through indicators tab
#     And Select some series to my series tab
#     And select all series check box checked
#     And click on related series tab
#     And click on I icon of indicators tab
#     Then Footnotes popup should be opened


#   Scenario Outline: <TCID>:Search for Mnemonic as <Mnemonic>
#     Given Series_id  is "<SID>"
#     Given User enters Mnemonic "<Mnemonic>"
#     Then User should get Mnemonic Code and Series_id in SSI window

#     Examples: 
#       | TCID   | SID       | Mnemonic                   |
#       | TC_01  | 118270508 | AE.AP.NMVA.AED-TH-A        |
#       | TC_02  | 118307308 | AE.APFISH.VO.A             |

     
#   Scenario: TC_MyInsights_07: Verify Mouse over on inisight title in Table mode
#     And Navigates to Myinsight page
#     And Verify the Mouse over on inisight title in Table mode

 
# 	  Scenario: TC_MyInsights_08: Verify search in My Insights
# 	    And Navigates to Myinsight page
# 	    And Verify the search in My Insights


#   Scenario: TC_MyInsights_09: Verify search when any filter applied
#     And Navigates to Myinsight page
#     And Verify search when any filter applied


#   Scenario: TC_MyInsights_10: Verify search with invalid keyword
#     And Navigates to Myinsight page
#     And Verify search with invalid keyword

  
#   Scenario: TC_MyInsights_11: Verify Create insight button with invalid keyword
#     And Navigates to Myinsight page
#     And Verify Create insight button with invalid keyword

  
#   Scenario: TC_MyInsights_12: Verify All tags drop down with no tagname
#     And Navigates to Myinsight page
#     And Verify All tags drop down with no tagname




#   Scenario: TC_MyInsights_14: Verify number of insights for a tag
#     And Navigates to Myinsight page
#     And Verify number of insights for a tag
    

# Scenario: TC_Download_Atr_02 - Download - Verify 'Series Name' attribute
#     Given I select a series (e.g., 5724301)
#     When I click on the download option
#     And I select 'Series Name' attribute
#     And I download to Excel
#     Then The 'Series Name' attribute should be available in Excel

#   Scenario: TC_Download_Atr_03 - Download - Verify 'Series Region' attribute
#     Given I select a series (e.g., 5724301)
#     When I click on the download option
#     And I select 'Series Region' attribute
#     And I download to Excel
#     Then The 'Series Region' attribute value should be available in Excel

#   Scenario: TC_Download_Atr_04 - Download - Verify 'Subnational' attribute
#     Given I search for the series ID: 383981567
#     When I select the series from the series tab
#     And I open the download window
#     And I select 'Subnational' checkbox
#     And I click on Download
#     Then The 'Subnational' attribute value should be available in Excel

#   Scenario: TC_Download_Atr_05 - Download - Verify 'Frequency' attribute
#     Given I select a series (e.g., 5724301)
#     When I click on the download option
#     And I select 'Frequency' attribute
#     And I download to Excel
#     Then The 'Frequency' attribute value should be available in Excel

     
#   Scenario: TC_SeriesTab_01:Verify indicator filter for series tab
#     And Select indicator "Foreign Trade" as "Import Price"
#     When Click on "Apply filter"
#     Then Result should be displayed as per selection

 
#   Scenario: TC_SeriesTab_02:Verify Reset option for series tab
#     Given User enters "GDP"
#     And User selects "Source" as "World Bank"
#     And User has clicked on "Apply filter"
#     When Click on "Reset"
#     Then Selected options should be reset to default

 
#   Scenario: TC_SeriesTab_03:Verify source filter for series tab
#     Given User enters "mfg"
#     And User selects "Source" as "The Bank of Korea"
#     And User has clicked on "Apply filter"
#     Then User verify the search results


#   Scenario: TC_SeriesTab_04:Verify series count for search
#     Given User enters keyword "gdp"
#     Then Series count should be matched with displayed result

 
#   Scenario: TC_SeriesTab_05:Verifying "Copy" option for series level
#     Given User enters seriesID "1380601;245178303"
#     When User right click on any series
#     And Select "Copy"
#     Then The message should be in growl popup as "Selected series copied."
#     Then Series should be pasted in excel as refreshable links

    
#   Scenario: TC_SSP_01: Try to open SSP window from myseries
#     And Open preference dropdown
#     And Clicking on "Date format" dropdown option in preference
#     And Click "Custom" format date option
#     And Enter "Valid" custom date
#     And Open preference dropdown
#     And Add few series to myseries
#     And hightlight any one series and click on series name
#     Then Verify SSP window

  
#   Scenario: TC_SSP_02: Try to open SSP window from Search
#     And Go to search
#     And hightlight any one series from search list and click on series name
#     Then Verify SSP window

  
#   Scenario: TC_SSP_03: Verify the options available on the main bar of the SSP window
#     And Go to search
#     And hightlight any one series from search list and click on series name
#     And SSP window should open
#     Then Verify options on top bar of window

 
#   Scenario: TC_SSP_04: Verify the Add option
#     And Go to search
#     And hightlight any one series from search list and click on series name
#     And Open SSP window
#     And Click on Add option
#     Then The series should add into right pane

  
#   Scenario: TC_04:Verify order of colors with series order
#     And Select some series and create a chart/column/pie or any visual
#     Then Should match the color's order in the Color palette inside the Theme popup

  
#   Scenario: TC_05:Verify ''Theme'' button
#     #And Login to CDMNext
#     Then Theme button should be present in Right Top side of the CEIC tab

 
#   Scenario: TC_06:Verify the colors in chart/visual under ''Previews'' with the order of colors in the color palette
#     And Click on Theme button
#     Then Number of Series(colors) in the Line/Pie/Column charts should be same as the colors in the Color Palette

  
#   Scenario: TC_07:Verify ''Previews'' in the Theme popup
#     And Click on Theme button
#     Then Changes should be applied under Previews
 
#   Scenario: TC_08:Verify description inside ''Theme'' popup
#     And Click on Theme button
#     Then Description should be as "Theme is a branding of fundamental settings to apply to your charts"
#     Then 'Theme setting defines the default look and is applied to all newly created visuals by default'
#     Then 'To apply theme to your existing visuals, click on 'convert to your theme brand' under insight setting'   

#   Scenario: TC_Breakdown_01:Verify if group option is present for Global database> South African table
#     And Expand Global database till "South Africa"
#     And Expand "South Africa: National Accounts" till first table level
#     And Click on the "Group" option
#     Then The series should be grouped


#   Scenario: TC_Breakdown_02:Verify if ungroup option is present for Global database> South African table
#     And Expand Global database till "South Africa"
#     And Expand "South Africa: National Accounts" till first table level
#     And Click on the "Group" option
#     And Uncheck the "Group" option
#     Then The series grouped previously should be un-grouped

 
#   Scenario: TC_Breakdown_03:Verify if select all works with grouped option is  for Global database> South African table
#     And Expand Global database till "South Africa"
#     And Expand "South Africa: National Accounts" till first table level
#     And Click on the "Group" option
#     And Click on "Select All" option for the first group
#     And Click on "Add"
#     Then All selected series should add to right pane-my series


#   Scenario: TC_Breakdown_04:Verify if de-select all works with grouped option is  for Global database> South African table
#     And Expand Global database till "South Africa"
#     And Expand "South Africa: National Accounts" till first table level
#     And Click on the "Group" option
#     And Click on "Select All" option for the first group
#     And Click on the "Unselect all" option
#     Then All selected series should get de-selected


#   Scenario Outline: TC_Data_set_05: Verify Sort by option for dataset tab
#     And Clicking "Datasets" tab from menu
#     Then Verify Sort by option <actual> for <index>

#     Examples: 
#       | actual             | index |
#       | "Popularity"       |     1 |
#       | "Recently Updated" |     2 |
#       | "New Series"       |     3 |	   
#    #  | "Region"           |     4 |
	
	
  
#   Scenario: TC_Data_set_06: Verify closing Sort by option for dataset tab
#     And Open preference dropdown
#     And Clicking on "Ask me to confirm the download settings" option under user preference to be "Check"
#     And Clicking on "Keyboard shortcuts" option under user preference be "ON"
#     And Open preference dropdown
#     And Clicking "Datasets" tab from menu
#     And Click on the Sort by option
#     Then Verify closing the Sort by option

  
#   Scenario Outline: TC_Data_set_07: Verify the tooltips for Sort by options in dataset tab
#     And Clicking "Datasets" tab from menu
#     Then Verify the <tooltips> with Sort by options for <index>

#     Examples: 
#       | tooltips           | index |
#       | "Popularity"       |     1 |
#       | "Recently Updated" |     2 |
#       | "New Series"       |     3 |
#      # | "Region"           |     4 |


#   Scenario: TC_Data_set_08: Verify the expand option in dataset tab
#     And Clicking "Datasets" tab from menu
#     Then Verify "Expand" the datasets "Without" keyboard shortcuts


#   Scenario: TC_01:Verify Dependencies tab in series suggestion manager window
#     And User Select Series ID as "505928477; 356927877"
#     And add some of series into my series tab
#     And click on related series
#     And Navigate to dependencies tab
#     Then Dependencies tab should be seen

 
#   Scenario: TC_02:Verify loading dependencies in dependency tab of suggestion window
#     And User Select Series ID as "505928477; 356927877"
#     And add some of series into my series tab
#     And click on related series
#     And Navigate to dependencies tab
#     Then Chart of first dependencies only shown and all below are hidden

 
#   Scenario: TC_03:Verify manage all dropdown for dependency tab
#     And User Select Series ID as "505928477; 356927877"
#     And add some of series into my series tab
#     And click on related series
#     And Navigate to dependencies tab
#     And click on manage all dropdown
#     Then Select dependencies & Unselect dependencies options should be present

  
#   Scenario: TC_04:Verify 'Select dependencies' for manage all dropdown in dependencies tab
#     And User Select Series ID as "505928477; 356927877"
#     And add some of series into my series tab
#     And click on related series
#     And Navigate to dependencies tab
#     And click on manage all dropdown
#     And select 'Select dependencies'
#     Then Add button should get colored by ticking as right with apply button enabled

 
#   Scenario: Tc_EmptyView_01 : Verify creating any visuals in the visualisation panel
#     And Click on View tab
#     And Select some series and drag and drop onto the visual
#     Then Series dropped should be created in the selected visual

  
#   Scenario: Tc_EmptyView_02 : Verify creating new view tab
#     And Click on plus icon
#     Then New view tab should be created with all visual options

  
#   Scenario: Tc_EmptyView_03 : Verify deleting any view
#     And Click on View tab
#     And Mouse hover on the view tab
#     And Click on cross icon
#     Then Selected view tab should be deleted

  
#   Scenario: Tc_EmptyView_04 : Verify displaying different line charts
#     And Click on View tab
#     And Select the "Add chart" dropdown
#     Then Verify different types of Line charts

  
#   Scenario: Tc_EmptyView_05 : Verify displaying different area charts
#     And Click on View tab
#     And Select the "Add chart" dropdown
#     Then Verify different types of Area charts


#   Scenario: Tc_EmptyView_06 : Verify displaying different column charts
#     And Click on View tab
#     And Select the "Add chart" dropdown
#     Then Verify different types of Column charts


#   Scenario: Tc_ImageVisual_1 : Verify creating filter visual
#     And Go to View tab
#     And Click on insert Image visual icon
#     Then "Image" visual should be created

 
#   Scenario: Tc_ImageVisual_2 : Verify copy-paste of image visual
#     And Go to View tab
#     And Click on insert Image visual icon
#     And Select "Upload image" icon
#     And Upload any image
#     And Click on Copy icon
#     And Paste to new insight
#     Then The image visual should be pasted to new insight


#   Scenario: Tc_ImageVisual_3 : Verify content present in the image visual
#     And Go to View tab
#     And Click on insert Image visual icon
#     Then Below optins should be available
#       | Upload image      |
#       | Insert/edit image |
#       | Fit to width      |
#       | Align left        |
#       | Align center      |
#       | Align right       |


#   Scenario: Tc_InsightGeneral_01:Verify CEIC logo
#     #And Login as current execution login by taking username rowcount as 2 and cellcount as 0 and for password rowcount as 2 and cellcount as 1
#     #And Setting values in preference
#     And Creating new insight   
#     And Verify CEIC logo

  
#   Scenario: Tc_InsightGeneral_02:Verify clicking on CEIC logo
#     And Creating new insight
#     Then Click on CEIC logo to verify
#     And Delete Insight

  
#   Scenario: Tc_InsightGeneral_03:Verify insight title change
#     And Click  insight title
#     And Verify insight title change


#   Scenario: Tc_InsightGeneral_04:Verify Clicking on my insights
#     And My Insights should be loaded

 
#   Scenario: Tc_InsightGeneral_05:Verify insight URL after changed insight title
#     And Creating new insight
#     And Change insight title and verify insight URL after changed insight title
#     And Delete Insight

  
#   Scenario: Tc_InsightGeneral_06:Verify insight URL after changed insight title with existing insight title
#     And Creating new insight
#     And Verify insight URL after changed insight title with existing insight title


#   Scenario: TC_MS_230: Verify More actions Footnotes if the series linked to multiple Database
#     And User Select Series ID  as "1692001"
#     And Mouse hover the first series
#     And Select the More option
#     And Verify More actions Footnotes if the series linked to multiple Database


#   Scenario: TC_MS_231: Verify More actions Show dataset
#     And Select random series and add to to my series tab
#     And Mouse hover the first series
#     And Select the More option
#     And Select the "Show Dataset" in more option
#     And Verify More actions Show dataset

  
#   Scenario: TC_MS_232: Verify More actions See in Database
#     And Select random series and add to to my series tab
#     And Mouse hover the first series
#     And Select the More option
#     And Select the "See in Database" in more option
#     And Verify More actions Show Show Database

  
#   Scenario: TC_MS_233:Verify Right click option
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Verify Right click option on series

  
#   Scenario: TC_MS_235:Right click on Series- Verify Add Chart
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "chart-line" link
#     And Verify Right click Add to chart Chart all


#   Scenario: TC_MS_236:Right click on Series- Verify Add Chart
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "map-filled" link
#     And Verify Right click Add to chart Map

 
#   Scenario: TC_MS_237:Right click on Series- Verify Add Chart
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "table-vertical" link
#     And Verify Right click Add to chart Table

 
#   Scenario: TC_MS_239:Right click on Series- Verify Add Chart
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "pie_chart-pie" link
#     And Verify Right click Add to chart Pie

 
#   Scenario: TC_MS_240:Right click on Series- Verify Add Chart
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "heatmap" link
#     And Verify Right click Add to chart Heatmap

 
#   Scenario: TC_MS_241:Right click on Series- Verify Add Chart
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "scatter" link
#     And Verify Right click Add to chart Scatter


#   Scenario: TC_MS_242:Right click on Series- Verify Add Chart
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "histogram" link
#     And Verify Right click Add to chart Histogram


#   Scenario: TC_MS_243: Verify Right click function for creating visual with more than max series selection
#     And Select "21" series to my series tab
#     And Select all series
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Add chart" button
#     And Select the "pie_chart-pie" link
#     And Verify Right click creating visual with more than max series selection

 
#   Scenario: TC_MS_244: Verify Right click -Download option
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the Download option
#     And Verify Right click View on Download option

 
#   Scenario: TC_MS_245: Verify Right click Copy option
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the Copy option
#     And Verify Right click Copy option

 
#   Scenario: TC_MS_246: Verify Right click the confirmation message for Copy action
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the Copy option
#     And Verify Right click the confirmation message for Copy action

#   Scenario: TC_MS_250: Verify Right click Copy link(s) for series
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Copy selected links" option
#     And Verify Right click Copy link(s) for series

 
#   Scenario: TC_MS_251: Verify Right click copy link behavior for single series
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Copy selected links" option
#     And Verify Right click Copy link behavior for single series

  
#   Scenario: TC_MS_252: Verify Right click copy link confirmation message
#     And Select some series to my series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Copy selected links" option
#     And Verify Right click Copy link confirmation message

 
#   Scenario: TC_MS_254: Verify Right click copy link confirmation message for multiple series
#     And Select some series to my series tab
#     And Select all series
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Copy selected links" option
#     And Verify Right click Copy link confirmation message for multiple series


#   Scenario: TC_MS_255: Verify Right click copy link closing of growl popup
#     And Select some series to my series tab
#     And Select all series
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the "Copy selected links" option
#     And Verify Right click Copy link closing of growl popup

 
#   Scenario: TC_MS_259:  Verify Right click Delete option
#     And Select some series to my series tab
#     And Select all series
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the the Delete option
#     And Verify Right click Delete

  
#   Scenario: TC_MS_260: Verify Right click Delete description for delete series popup
#     And Create visuals as Chart
#     And Navigate to Series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the the Delete option
#     And Verify Right click Delete description for delete series popup

  
#   Scenario: TC_MS_261: Verify Right click Delete ok button for delete series popup
#     And Create visuals as Chart
#     And Navigate to Series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the the Delete option
#     And Verify Right click Delete ok button for delete series popup

  
#   Scenario: TC_MS_262:VerifyRight click Delete the associated visuals after deleted series
#     And Create visuals as Chart
#     And Navigate to Series tab
#     And Mouse hover the first series
#     And Right click on the first series
#     And Select the the Delete option
#     And Verify Right click Delete the associated visuals after deleted series

    
#   Scenario: TC_Commentary_55:Table - properties - verify cell spacing field for table
#     And Create Commentary visual
#     And Click on "Table" drop down
#     And Create table
#     And Click on "Table" drop down from More dropdown
#     And Click on "Table properties"
#     And Set "cell spacing" for table "30"
#     Then The table "cell spacing" should be displayed as "30"

 
#   Scenario: TC_Commentary_56:Table - properties - verify cell padding field for table
#     And Create Commentary visual
#     And Click on "Table" drop down
#     And Create table
#     And Click on "Table" drop down from More dropdown
#     And Click on "Table properties"
#     And Set "cell padding" for table "40"
#     Then The table "cell padding" should be displayed as "40"

  
#   Scenario: TC_Commentary_57:Table - properties - verify caption field for table
#     And Create Commentary visual
#     And Click on "Table" drop down
#     And Create table
#     And Click on "Table" drop down from More dropdown
#     And Click on "Table properties"
#     And Check Caption for table
#     Then Caption should be added to the table

#   Scenario: TC_Commentary_58:Table - properties - verify removing caption by unchecking the field.
#     And Create Commentary visual
#     And Click on "Table" drop down
#     And Create table
#     And Click on "Table" drop down from More dropdown
#     And Click on "Table properties"
#     And Uncheck caption for table
#     Then Caption shoud be removed

#   Scenario: TC_Commentary_62:Table - properties - verify cancel/x icon
#     And Create Commentary visual
#     And Click on "Table" drop down
#     And Create table
#     And Click on "Table" drop down from More dropdown
#     And Click on "Table properties"
#     And Click on Cancel
#     Then The table properties popup should be closed

#   Scenario: TC_Releases_04: Verify when release status is selected
#     And Clicking "Releases" icon
#     And Clicking the release status as "Released"
#     Then Only "Released" status icon should present

 
#   Scenario: TC_Releases_05: Verify when pending status is selected
#     And Clicking "Releases" icon
#     And Clicking the release status as "Pending"
#     Then Only "Pending" status icon should present


#   Scenario: TC_Releases_06: Verify when delayed status is selected
#     And Clicking "Releases" icon
#     And Clicking the release status as "Delayed"
#     Then Only "Delayed" status icon should present


#   Scenario: TC_Releases_07: Verify when all status is selected
#     And Clicking "Releases" icon
#     And Clicking the release status as "Released"
#     And Clicking the release status as "Pending"
#     And Clicking the release status as "Delayed"
#     Then Only "All" status icon should present

 
#   Scenario: TC_Releases_08: Verify when all status is deselected
#     And Clicking "Releases" icon
#     And Check the deselected option
#     Then Only "All" status icon should present

 
#   Scenario: TC_Releases_09: Expand the one of the Datasets
#     And Clicking "Releases" icon
#     And Expand first Dataset
#     And Get the text of expanded Dataset
#     Then Verify the "expanded" dataset


#   Scenario: TC_Releases_10: Collapse the datasets
#     And Clicking "Releases" icon
#     And Expand first Dataset
#     Then Verify the "collapsed" dataset

 
#   Scenario: TC_Releases_11: Verify Selection of any datasets
#     And Clicking "Releases" icon
#     # And Search for the series "176412302" in ReleasesTab
#     And Search for the series "70649302" in ReleasesTab
#     And Select "-1Y" timeframe button
#     And Select first Dataset
#     Then Download button should enable and x series selected should appear in search

    
  
#   Scenario: Tc_Scatter/bubble_303:Right click - change chart type  as - Verify Table.
#     And Create a scatter chart with 2 series
#     And Right click on visual header
#     And Choose Change chart type as "Table"
#     Then The "Scatter" visual should be converted as "Table" visual

 
#   Scenario: Tc_Scatter/bubble_304:Right click - change chart type  as - Verify Heatmap.
#     And Create a scatter chart with 2 series
#     And Right click on visual header
#     And Choose Change chart type as "Heat map"
#     Then The "Scatter" visual should be converted as "Heat map" visual

  
#   Scenario: Tc_Scatter/bubble_305:Right click - Change chart type - Verify area chart
#     And Create a scatter chart with 2 series
#     And Right click on visual header
#     And Choose Change chart type as "Area"
#     Then The "Scatter" visual should be converted as "Area" visual

 
#   Scenario: Tc_Scatter/bubble_306:Right click - Change chart type - Verify column chart
#     And Create a scatter chart with 2 series
#     And Right click on visual header
#     And Choose Change chart type as "Column"
#     Then The "Scatter" visual should be converted as "Column" visual


#   Scenario: Tc_Scatter/bubble_307:Right click - Change chart type - Verify bar chart
#     And Create a scatter chart with 2 series
#     And Right click on visual header
#     And Choose Change chart type as "Bar"
#     Then The "Scatter" visual should be converted as "Bar" visual

#       Scenario: TC_function_1032:Verify the Unit conversion function
#     Given Create insight and add series "284642301" >open function popup
#     And Applying "UNIT_CONVERSION" "UNIT_CONVERSION (output unit)" function
#     Then Verfiy the "Dropdowns" in "Output Unit"
#       | 10 Ton     |
#       | Bale       |
#       | g          |
#       | Metric Ton |
#       | oz         |
#       | Short Ton  |
#       | Tonne      |
#       | lb         |
#       | mg         |
#       | 60 kg      |
#       | Quintal    |
#       | Centner    |
#       | Long Ton   |
#       | Mt         |
#       | Pyi        |

#   Scenario: TC_function_1033:Verify the Unit conversion function
#     Given Create insight and add series "176398302" >open function popup
#     And Applying "UNIT_CONVERSION" "UNIT_CONVERSION (output unit)" function
#     Then Verfiy the "Dropdowns" in "Output Unit"
#       | kg        |
#       | GT        |
#       | 100 Tonne |

  
#   Scenario: TC_function_1034:Verify the Unit conversion function
#     Given Create insight and add series "176398302" >open function popup
#     And Apply UNIT_CONVERSION function "UNIT_CONVERSION (output unit)" by applying "GT"
#     And Check Replace selected series
#     And Click on apply function
#     Then Verify latest download excel file with "Functions1034" testdata file

#   Scenario: TC_function_1035:Verify the Unit conversion functionn
#     Given Create insight and add series "359015597" >open function popup
#     And Applying "UNIT_CONVERSION" "UNIT_CONVERSION (output unit)" function
#     Then Verfiy the "Dropdowns" in "Output Unit"
#       | Gross Ton |
#       | kton      |
#       | kt        |

#   Scenario: TC_function_1036:Verify the Unit conversion function.
#     Given Create insight and add series "359015597" >open function popup
#     And Apply UNIT_CONVERSION function "UNIT_CONVERSION (output unit)" by applying "kton"
#     And Uncheck Replace selected series
#     And Click on apply
#     Then Unit of the series should be changed from "Ton" to "kton" Verify Results in excel

#   Scenario: TC_function_1037:Verify the Unit conversion functionn
#     Given Create insight and add series "458586567" >open function popup
#     And Applying "UNIT_CONVERSION" "UNIT_CONVERSION (output unit)" function
#     Then Verfiy the "Dropdowns" in "Output Unit"
#       | sq Mile |
#       | sq m    |

#   Scenario: TC_function_1038:Verify the Unit conversion function
#     Given Create insight and add series "458586567" >open function popup
#     And Apply UNIT_CONVERSION function "UNIT_CONVERSION (output unit)" by applying "sq m"
#     And Check Replace selected series
#     And Click on apply function
#     Then Verify latest download excel file with "Functions1038" testdata file

#   Scenario: TC_function_1039:Verify the Unit conversion functionn
#     Given Create insight and add series "353085901" >open function popup
#     And Applying "UNIT_CONVERSION" "UNIT_CONVERSION (output unit)" function
#     Then Verfiy the "Dropdowns" in "Output Unit"
#       | kg        |
#       | Short Ton |

#   Scenario: TC_function_301:Verifying the function 'Aggregate-Avg' : Weekly to Weekly
#     Given Create insight and add series "310913401" >open function popup
#     And search for "AGGREGATE" function and click on "AGGREGATE (frequency, end, method)" function
#     And Apply function "AGGREGATE", "AGGREGATE (frequency, end, method)" by applying "1","Weekly","2","Sunday","3","Avg",""
#     Then Check Replace selected series
#     And Click on apply function
#     Then Verify latest download excel file with "Functions301" testdata file







