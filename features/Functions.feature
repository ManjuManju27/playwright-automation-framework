  Feature: Function Module 
   
   @function1
    Scenario: TC_function_01:Verifying 'Accumulate' function from smart toolbar.
    Given Create insight and add series "310902101" >open function popup
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
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
    Then Verify download excel file with "Functions01" testdata file

@test
     Scenario: TC_function_02:Verifying the function 'Adjustment-Previous' from smart toolbar.
    Given Create insight and add series "310902101" >open function popup
    And Apply function "FILLGAP" "FILLGAP (type)" by applying "Previous value"
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
    Then Verify download excel file with "Functions02" testdata file

@test    
  Scenario: TC_function_03:Verifying the function 'Adjustment-Next'  from smart toolbar.
    Given Create insight and add series "310902101" >open function popup
    And Apply function "FILLGAP" "FILLGAP (type)" by applying "Next value"
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
    Then Verify download excel file with "Functions03" testdata file

  Scenario: TC_function_06:Verifying the function 'Series Manipulation- Replace Null by' from smart toolbar.
    Given Create insight and add series "310902101" >open function popup
    And Apply fuction "REPLNULL","REPLNULL (null value)" input ValueIn "100"
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
    Then Verify download excel file with "Functions06" testdata file

  Scenario: TC_function_09:Verifying the function 'Multiply-constant' from smart toolbar.
    Given Create insight and add series "310902101" >open function popup
    And Apply fuction "MULTIPLY","MULTIPLY (type, value)" input ValueIn "7"
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
    Then Verify download excel file with "Functions09" testdata file


    Scenario: TC_function_21:Verifying the function 'Aggregate-Sum'.
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","Sum"
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
    Then Verify download excel file with "Functions21" testdata file


      Scenario: TC_function_22:Verifying the function 'Aggregate-Min'.
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","Min"
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
    Then Verify download excel file with "Functions22" testdata file


     Scenario: TC_function_23:Verifying the function 'Aggregate-Max'.
    Given Create insight and add series "310907101" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Max"
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
    Then Verify download excel file with "Functions23" testdata file


  Scenario: TC_function_24:Verifying the function 'Aggregate-First'.
    Given Create insight and add series "310907101" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","First"
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
    Then Verify download excel file with "Functions24" testdata file

  
  Scenario: TC_function_28:Verifying the function 'Aggregate-Quarterly' on a Quarterly series'.
    Given Create insight and add series "310912001" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Max"
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
    Then Verify download excel file with "Functions28" testdata file


  Scenario: TC_function_31:Verifying the function 'Index' with base begin and end
    Given Create insight and add series "310907601" >open function popup
    And search for "INDEX" function and click on "INDEX (start, end, value)" function
    And Apply function using base_start="2001-01-01",base_end="2014-04-01" and value="2"
    And Uncheck Replace selected series
    And Click on Insert function
    And Click on apply function
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions31" testdata file

#--------------------------------------------------------------------------------------


  Scenario: TC_function_88:Verifying Currency Conversion for 'Lek (ALL)'
    Given Create insight and add series "134540308" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Thousands"
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
    Then Verify download excel file with "Functions88" testdata file

  
  
  Scenario: TC_function_89:Verifying Currency Conversion for 'Bangladesh Taka (BDT)'
    Given Create insight and add series "539948117" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Thousands"
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
    Then Verify download excel file with "Functions89" testdata file

  
  
  Scenario: TC_function_90:Verifying Currency Conversion for 'Australian Dollar (AUD)'
   Scenario: TC_function_89:Verifying Currency Conversion for 'Bangladesh Taka (BDT)'
    Given Create insight and add series "539948117" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Billions"
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
    Then Verify download excel file with "Functions89" testdata file

  
  
  Scenario: TC_function_91:Verifying Currency Conversion for 'Bangladesh Taka (BDT)'
    Given Create insight and add series "310904701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Billions"
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
    Then Verify download excel file with "Functions91" testdata file

  
  
  Scenario: TC_function_92:Verifying Currency Conversion for 'Bangladesh Taka (BDT)'
    Given Create insight and add series "310903401" >open function popup
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
    Then Verify download excel file with "Functions92" testdata file

  
  Scenario: TC_function_93:Verifying Currency Conversion for 'Brazil Real (BRL)'
    Given Create insight and add series "539948117" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Thousands"
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
    Then Verify download excel file with "Functions89" testdata file

  
  Scenario: TC_function_94:Verifying Currency Conversion for 'Canadian Dollar (CAD)'
     Given Create insight and add series "539948117" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Billions"
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
    Then Verify download excel file with "Functions89" testdata file

  
  Scenario: TC_function_95:Verifying Currency Conversion for 'Swiss Franc (CHF)'
   Given Create insight and add series "539948117" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Millions"
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
    Then Verify download excel file with "Functions89" testdata file

  
  Scenario: TC_function_96:Verifying Currency Conversion for 'Chilean Peso (CLP)'
    Given Create insight and add series "310911401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Millions"
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
    Then Verify download excel file with "Functions96" testdata file

  
  Scenario: TC_function_97:Verifying Currency Conversion for 'Czech Koruna (CZK)'
     Given Create insight and add series "310911401" >open function popup
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
    Then Verify download excel file with "Functions96" testdata file
    

  
  Scenario: TC_function_98:Verifying Currency Conversion for 'Deutsche Mark (DEM)'
    Given Create insight and add series "310915401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Millions"
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
    Then Verify download excel file with "Functions98" testdata file

  
  Scenario: TC_function_99:Verifying Currency Conversion for 'Danish Krone (DKK)'
  Given Create insight and add series "310915401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Thousands"
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
    Then Verify download excel file with "Functions98" testdata file

  Scenario: TC_function_100:Verifying Currency Conversion for 'Spanish Peseta (ESP)'
    Given Create insight and add series "314529201" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Thousands"
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
    Then Verify download excel file with "Functions100" testdata file

  
  Scenario: TC_function_101:Verifying Currency Conversion for 'Euro Dollars (EUR)'
    Given Create insight and add series "310919701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Thousands"
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
    Then Verify download excel file with "Functions101" testdata file

  
  Scenario: TC_function_102:Verifying Currency Conversion for 'Finnish Mark (FIM)'
    Given Create insight and add series "310903801" >open function popup
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
    Then Verify download excel file with "Functions102" testdata file

  
  Scenario: TC_function_103:Verifying Currency Conversion for 'Finnish Mark (FIM)'
    Given Create insight and add series "310911001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Billions"
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
    Then Verify download excel file with "Functions103" testdata file

  
  Scenario: TC_function_104:Verifying Currency Conversion for 'Pound Sterling (GBP)'
    Given Create insight and add series "310906901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Billions"
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
    Then Verify download excel file with "Functions104" testdata file

  
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

  
  Scenario: TC_function_127:Verifying Currency Conversion for 'New Zealand Dollar (NZD)'
    Given Create insight and add series "310909001" >open function popup
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
    Then Verify download excel file with "Functions127" testdata file

  
  Scenario: TC_function_128:Verifying Currency Conversion for 'Nuevo Sol (PEN)'
    Given Create insight and add series "310920701" >open function popup
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
    Then Verify download excel file with "Functions128" testdata file

  
  Scenario: TC_function_129:Verifying Currency Conversion for 'Philippine Peso (PESO)'
    Given Create insight and add series "310912401" >open function popup
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
    Then Verify download excel file with "Functions129" testdata file

  
  Scenario: TC_function_130:Verifying Currency Conversion for 'Pakistan Rupee (PKR)'
    Given Create insight and add series "310904801" >open function popup
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
    Then Verify download excel file with "Functions130" testdata file

  
  Scenario: TC_function_131:Verifying Currency Conversion for 'Zloty (PLN)'
    Given Create insight and add series "310902701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Billions"
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
    Then Verify download excel file with "Functions131" testdata file

  
  Scenario: TC_function_132:Verifying Currency Conversion for 'Portuguese Escudo (PTE)'
    Given Create insight and add series "310906101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Billions"
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
    Then Verify download excel file with "Functions132" testdata file

  
  Scenario: TC_function_133:Verifying Currency Conversion for 'Serbian Dinar (RSD)'
    Given Create insight and add series "310912901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Millions"
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
    Then Verify download excel file with "Functions133" testdata file

  
  Scenario: TC_function_134:Verifying Currency Conversion for 'Serbian Dinar (RSD)'
    Given Create insight and add series "310911901" >open function popup
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
    Then Verify download excel file with "Functions134" testdata file

  
  Scenario: TC_function_135:Verifying Currency Conversion for 'Russian Ruble (RUB)'
    Given Create insight and add series "310902901" >open function popup
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
    Then Verify download excel file with "Functions135" testdata file

  @smoke
  Scenario: TC_function_136:Verifying Currency Conversion for 'Swedish Krona (SEK)'
    Given Create insight and add series "310918201" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Thousands"
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
    Then Verify download excel file with "Functions136" testdata file

  @smoke
  Scenario: TC_function_137:Verifying Currency Conversion for 'Singapore Dollar (SGD)'
    Given Create insight and add series "310914101" >open function popup
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
    Then Verify download excel file with "Functions137" testdata file

  
  Scenario: TC_function_138:Verifying Currency Conversion for 'Thailand Baht (THB)'
    Given Create insight and add series "310920401" >open function popup
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
    Then Verify download excel file with "Functions138" testdata file

  @test1
Scenario: TC_function_139:Verifying Currency Conversion for 'Turkish Lira (TRY)'
    Given Create insight and add series "310914001" >open function popup
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
    Then Verify download excel file with "Functions139" testdata file

  @test1
Scenario: TC_function_140:Verifing Currency Conversion for 'New Taiwan Dollar'(TWD)
    Given Create insight and add series "310912101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","as reported"
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
    Then Verify download excel file with "Functions140" testdata file

  @test
  Scenario: TC_function_141:Verifying Currency Conversion for 'US Dollar (USD)'
    Given Create insight and add series "310906601" >open function popup
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
    Then Verify download excel file with "Functions141" testdata file

  
  Scenario: TC_function_142:Verifying Currency Conversion for 'Bolivar Fuerte (VEB/VEF)'
    Given Create insight and add series "310903001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Millions"
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
    Then Verify download excel file with "Functions142" testdata file

  
  Scenario: TC_function_143:Verifying Currency Conversion for 'Vietname Dong (VND)'
    Given Create insight and add series "310903501" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Millions"
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
    Then Verify download excel file with "Functions143" testdata file

  
  Scenario: TC_function_144:Verifying Currency Conversion for 'South African Rand (ZAR)'
    Given Create insight and add series "310902801" >open function popup
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
    Then Verify download excel file with "Functions144" testdata file

  
  Scenario: TC_function_145:Verifying Currency Conversion for  'UAE Dirham' (AED)
    Given Create insight and add series "310916001" >open function popup
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
    Then Verify download excel file with "Functions145" testdata file

  
  Scenario: TC_function_146:Verifying Currency Conversion for  'Armenian Dram' (AMD)
    Given Create insight and add series "310910301" >open function popup
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
    Then Verify download excel file with "Functions146" testdata file

  
  Scenario: TC_function_147:Verifying Currency Conversion for  'Azerbaijanian Manat' (AZN)
    Given Create insight and add series "310919501" >open function popup
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
    Then Verify download excel file with "Functions147" testdata file

  
  Scenario: TC_function_148:Verifying Currency Conversion for  'Convertible Marks' (BAM)
    Given Create insight and add series "310909501" >open function popup
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
    Then Verify download excel file with "Functions148" testdata file

  @test1
  Scenario: TC_function_149:Verifying Currency Conversion for  'Bulgarian Lev' (BGN)
    Given Create insight and add series "310910501" >open function popup
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
    Then Verify download excel file with "Functions149" testdata file

  
  Scenario: TC_function_150:Verifying Currency Conversion for  'Bulgarian Lev' (BGN)
    Given Create insight and add series "310920501" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
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
    Then Verify download excel file with "Functions150" testdata file

  
  Scenario: TC_function_151:Verifying Currency Conversion for  'Brunei Dollar' (BND)
    Given Create insight and add series "310916301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
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
    Then Verify download excel file with "Functions151" testdata file

  
  Scenario: TC_function_152:Verifying Currency Conversion for  'Boliviano' (BOB)
    Given Create insight and add series "310916701" >open function popup
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
    Then Verify download excel file with "Functions152" testdata file

  
  Scenario: TC_function_153:Verifying Currency Conversion for  'Pula' (BWP)
    Given Create insight and add series "310909701" >open function popup
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
    Then Verify download excel file with "Functions153" testdata file

  
  Scenario: TC_function_154:Verifying Currency Conversion for  'Pula' (BWP)
    Given Create insight and add series "310910401" >open function popup
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
    Then Verify download excel file with "Functions154" testdata file

  
  Scenario: TC_function_155:Verifying Currency Conversion for  'Colombian Peso' (COP)
    Given Create insight and add series "310917701" >open function popup
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
    Then Verify download excel file with "Functions155" testdata file

  
  Scenario: TC_function_156:Verifying Currency Conversion for  'Costa Rican Colon' (CRC)
    Given Create insight and add series "310916801" >open function popup
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
    Then Verify download excel file with "Functions156" testdata file

  
  Scenario: TC_function_157:Verifying Currency Conversion for  'Costa Rican Colon' (CRC)
    Given Create insight and add series "310915701" >open function popup
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
    Then Verify download excel file with "Functions157" testdata file

  
  Scenario: TC_function_158:Verifying Currency Conversion for  'Dominican Peso' (DOP)
    Given Create insight and add series "310916901" >open function popup
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
    Then Verify download excel file with "Functions158" testdata file

  
  Scenario: TC_function_159:Verifying Currency Conversion for  'Algerian Dinar' DZD
    Given Create insight and add series "310909601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Thousands"
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
    Then Verify download excel file with "Functions159" testdata file

  
  Scenario: TC_function_160:Verifying Currency Conversion for  'Kroon' (EEK)
    Given Create insight and add series "310909101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Thousands"
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
    Then Verify download excel file with "Functions160" testdata file

  
  Scenario: TC_function_161:Verifying Currency Conversion for  'Egyptian Pound' (EGP)
    Given Create insight and add series "310916101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
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
    Then Verify download excel file with "Functions161" testdata file

  
  Scenario: TC_function_162:Verifying Currency Conversion for  'Lari' (GEL)
    Given Create insight and add series "310910701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
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
    Then Verify download excel file with "Functions162" testdata file

  
  Scenario: TC_function_163:Verifying Currency Conversion for  'Guatemalan Quetzal' (GTQ)
    Given Create insight and add series "310917101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
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
    Then Verify download excel file with "Functions163" testdata file

  
  Scenario: TC_function_164:Verifying Currency Conversion for  'Honduran Lempira' (HNL)
    Given Create insight and add series "310917201" >open function popup
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
    Then Verify download excel file with "Functions164" testdata file

  
  Scenario: TC_function_165:Verifying Currency Conversion for  'Iranian Rial' (IRR)
    Given Create insight and add series "310915801" >open function popup
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
    Then Verify download excel file with "Functions165" testdata file

  
  Scenario: TC_function_166:Verifying Currency Conversion for  ' Jamaican Dollar' (JMD)
    Given Create insight and add series "310918401" >open function popup
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
    Then Verify download excel file with "Functions166" testdata file

  
  Scenario: TC_function_167:Verifying Currency Conversion for  'Jordanian Dinar' (JOD)
    Given Create insight and add series "310918401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
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
    Then Verify download excel file with "Functions167" testdata file

  
  Scenario: TC_function_168:Verifying Currency Conversion for  'Kenyan Shilling' (KES)
    Given Create insight and add series "310919601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
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
    Then Verify download excel file with "Functions168" testdata file

  
  Scenario: TC_function_169:Verifying Currency Conversion for  'Riel' (KHR)
    Given Create insight and add series "310908701" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
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
    Then Verify download excel file with "Functions169" testdata file

  
  Scenario: TC_function_170:Verifying Currency Conversion for  'Kuwaiti Dinar' (KWD)
    Given Create insight and add series "310920301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
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
    Then Verify download excel file with "Functions170" testdata file

  
  Scenario: TC_function_171:Verifying Currency Conversion for  'Lebanese Pound' (LBP)
    Given Create insight and add series "310918501" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions171" testdata file

  
  Scenario: TC_function_172:Verifying Currency Conversion for  'Lithuanian Litus' (LTL)
    Given Create insight and add series "310919201" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "1997-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions172" testdata file

  
  Scenario: TC_function_173:Verifying Currency Conversion for  'Luxembourg franc'(LUF)
    Given Create insight and add series "310918101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "1997-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions173" testdata file

  
  Scenario: TC_function_174:Verifying Currency Conversion for  'Latvian Lats' (LVL)
    Given Create insight and add series "310917601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions174" testdata file

  
  Scenario: TC_function_175:Verifying  Replace Original Series with  function 'ArithmeticOperations-Multiply'.
    Given Create insight and add series "310919301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions175" testdata file

  
  Scenario: TC_function_176:Verifying Currency Conversion for  'Kyat' (MMK)
    Given Create insight and add series "310919801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions176" testdata file

  
  Scenario: TC_function_177:Verifying Currency Conversion for  'Maltese Lira' (MTL)
    Given Create insight and add series "310917801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions177" testdata file

  
  Scenario: TC_function_178:Verifying Currency Conversion for  'Maltese Lira' (MTL)
    Given Create insight and add series "310917501" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions178" testdata file

  
  Scenario: TC_function_179:Verifying Currency Conversion for  'Kwacha' (MWK)
    Given Create insight and add series "310910801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions179" testdata file

  
  Scenario: TC_function_180:Verifying Currency Conversion for  'Naira' (NGN)
    Given Create insight and add series "310909901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions180" testdata file

  
  Scenario: TC_function_181:Verifying Currency Conversion for  'HKD'
    Given Create insight and add series "310905801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions181" testdata file

  
  Scenario: TC_function_182:Verifying Currency Conversion for  'Rial Omani' (OMR)
    Given Create insight and add series "310918601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions182" testdata file

  
  Scenario: TC_function_183:Verifying Currency Conversion for  'Balboa' (PAB)
    Given Create insight and add series "310920801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions183" testdata file

  
  Scenario: TC_function_184:Verifying Currency Conversion for  'Paraguay Guarani' (PYG)
    Given Create insight and add series "310917401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions184" testdata file

  
  Scenario: TC_function_185:Verifying Currency Conversion for  'Qatari Rial' (QAR)
    Given Create insight and add series "310919901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions185" testdata file

  
  Scenario: TC_function_186:Verifying Currency Conversion for  'Leu' (RON)
    Given Create insight and add series "310914901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions186" testdata file

  
  Scenario: TC_function_187:Verifying Currency Conversion for  'Saudi Riyal' (SAR)
    Given Create insight and add series "310914801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions187" testdata file

  
  Scenario: TC_function_188:Verifying Currency Conversion for  'Tolar' (SIT)
    Given Create insight and add series "310909401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions188" testdata file

  
  Scenario: TC_function_189:Verifying Currency Conversion for  'Slovak Koruna'(SKK)
    Given Create insight and add series "310909301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions189" testdata file

  
  Scenario: TC_function_190:Verifying Currency Conversion for  'El Salvador Colon' (SVC)
    Given Create insight and add series "310917001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions190" testdata file

  
  Scenario: TC_function_191:Verifying Currency Conversion for  'Syrian Pound' (SYP)
    Given Create insight and add series "310915901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions191" testdata file

  
  Scenario: TC_function_192:Verifying Currency Conversion for  'Somoni' (TJS)
    Given Create insight and add series "310910601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions192" testdata file

  
  Scenario: TC_function_193:Verifying Currency Conversion for  'Tunisian Dinar' (TND)
    Given Create insight and add series "310910001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions193" testdata file

  
  Scenario: TC_function_194:Verifying Currency Conversion for  'Trinidad and Tobago Dollar' (TTD)
    Given Create insight and add series "310915601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions194" testdata file

  
  Scenario: TC_function_195:Verifying Currency Conversion for  'Hryvnia' (UAH)
    Given Create insight and add series "310909201" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions195" testdata file

  
  Scenario: TC_function_196:Verifying Currency Conversion for  'Ugandan shilling' (UGX)
    Given Create insight and add series "310910101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions196" testdata file

  
  Scenario: TC_function_197:Verifying Currency Conversion for  'Peso Uruguayo' (UYU)
    Given Create insight and add series "310920901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions197" testdata file

  
  Scenario: TC_function_198:Verifying Currency Conversion for  'CFA Franc BCEAO' (XOF)
    Given Create insight and add series "310909801" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions198" testdata file

  
  Scenario: TC_function_199:Verifying Currency Conversion for  'Yemeni Rial' (YER)
    Given Create insight and add series "310916201" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions199" testdata file

  
  Scenario: TC_function_200:Verifying Currency Conversion for  'MYR'
    Given Create insight and add series "503761317" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    Then Verify download excel file with "Functions200" testdata file

  
  Scenario: TC_function_201:Verifying Currency Conversion for (INR --> USD)
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions201" testdata file

  
  Scenario: TC_function_202:Verifying Currency Conversion for  (INR --> Euro)
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions202" testdata file

  
  Scenario: TC_function_203:Verifying Currency Conversion for (INR --> Yen)
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions203" testdata file

  
  Scenario: TC_function_204:Verifying Currency Conversion for (INR --> RMB)
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions204" testdata file

  
  Scenario: TC_function_205:Verifying Currency Conversion for (INR --> Pound)
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions205" testdata file

  
  Scenario: TC_function_206:Verifying Currency Conversion for  (RUB --> USD)
    Given Create insight and add series "310902901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions206" testdata file

  
  Scenario: TC_function_207:Verifying Currency Conversion for (RUB --> Euro)
    Given Create insight and add series "310902901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions207" testdata file

  
  Scenario: TC_function_208:Verifying Currency Conversion for (RUB --> Yen)
    Given Create insight and add series "310902901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions208" testdata file

  
  Scenario: TC_function_209:Verifying Currency Conversion for (RUB --> RMB)
    Given Create insight and add series "310902901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions209" testdata file

  
  Scenario: TC_function_210:Verifying Currency Conversion for (RUB --> Pound)
    Given Create insight and add series "310902901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"UK Pounds","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions210" testdata file

  
  Scenario: TC_function_211:Verifying Currency Conversion for INR (daily) ---> USD
    Given Create insight and add series "310907301" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Billions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions211" testdata file

  
  Scenario: TC_function_212:Verifying Currency Conversion for INR (Montly) ---> USD
    Given Create insight and add series "310907601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Thousands"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions212" testdata file

  
  Scenario: TC_function_213:Verifying Currency Conversion for INR (Quarterly) ---> USD
    Given Create insight and add series "310912001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Millions"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions213" testdata file

  
  Scenario: TC_function_214:Verifying Currency Conversion for INR (Yearly) ---> USD
    Given Create insight and add series "310904601" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    And Applyin time frame from "2000-01-01"  to "2015-01-01"
    And Select below attribute
      | Region               |
      | Frequency            |
      | Unit                 |
      | Source               |
      | Status               |
      | Series ID            |
      | Function Description |
    #| First Obs. Date      |
    Then Verify download excel file with "Functions214" testdata file

  Scenario: TC_function_215:Verifying 'Accumulate' function on weekly series.
    Given Create insight and add series "310913401" >open function popup
    And Applying "ACCUMULATE","ACCUMULATE ()" function
    And Check Replace selected series
    And Click on apply function
   Then Verify download excel file with "Functions215" testdata file

  
  Scenario: TC_function_216:Verifing Function Accumulate - Rolling Sum - Period=3 on weekly series.
    Given Create insight and add series "310913401" >open function popup
    And Apply fuction "ROLLSUM","ROLLSUM (period)" input ValueIn "3"
    And Check Replace selected series
    And Click on apply function
     Then Verify download excel file with "Functions216" testdata file

  
  Scenario: TC_function_217:Verifying the function 'Fillgap-Previous'  on a weekly series.
    Given Create insight and add series "310913401" >open function popup
    And Apply fuction "FILLGAP","FILLGAP (type)" by applying "Previous value"
    And Check Replace selected series
    And Click on apply function
     Then Verify download excel file with "Functions217" testdata file

  
  Scenario: TC_function_218:Verifying the function 'Fillgap-Next'  on a weekly series.
    Given Create insight and add series "310913401" >open function popup
    And Apply fuction "FILLGAP","FILLGAP (type)" by applying "Next value"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions218" testdata file

  
  
  Scenario: TC_function_219:Verifying the function 'Fill gaps with specific Value'  on a weekly series.
    Given Create insight and add series "310913401" >open function popup
    And Apply fuction "FILLGAP","FILLGAP (type)" select argument "Specific value" input ValueIn "33"
    And Check Replace selected series
    And Click on apply function
     Then Verify download excel file with "Functions219" testdata file
 

  Scenario: TC_function_252:Verifying the function 'Aggregate-Sum' : Weekly to Weekly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Weekly","Sunday","Sum"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions252" testdata file

  
  Scenario: TC_function_253:Verifying the function 'Aggregate-Sum' : Weekly to Monthly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Sum"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions253" testdata file


  Scenario: TC_function_254:Verifying the function 'Aggregate-Sum' : Weekly to Quarterly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Sum"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions254" testdata file


  Scenario: TC_function_255:Verifying the function 'Aggregate-Sum' : Weekly to Semi Annually
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Semiannual","June, December","Sum"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions255" testdata file


  Scenario: TC_function_256:Verifying the function 'Aggregate-Sum' : Weekly to Yearly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","Sum"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions256" testdata file

  Scenario: TC_function_257:Verifying the function 'Aggregate-Min' : Weekly to Weekly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Weekly","Sunday","Min"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions257" testdata file


  Scenario: TC_function_258:Verifying the function 'Aggregate-Min' : Weekly to Montly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Min"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions258" testdata file

  Scenario: TC_function_259:Verifying the function 'Aggregate-Min' : Weekly to Quarterly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Min"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions259" testdata file


  Scenario: TC_function_260:Verifying the function 'Aggregate-Min' : Weekly to Semi Annually
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Semiannual","June, December","Min"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions260" testdata file


  Scenario: TC_function_261:Verifying the function 'Aggregate-Min' : Weekly to Yearly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","Min"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions261" testdata file

  
  Scenario: TC_function_262:Verifying the function 'Aggregate-Max' : Weekly to Weekly.
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Weekly","Sunday","Max"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions262" testdata file


  Scenario: TC_function_263:Verifying the function 'Aggregate-Max' : Weekly to Montly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Max"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions263" testdata file


  Scenario: TC_function_264:Verifying the function 'Aggregate-Max' : Weekly to Quarterly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Max"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions264" testdata file


  Scenario: TC_function_265:Verifying the function 'Aggregate-Max' : Weekly to Semi Annually
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Semiannual","June, December","Max"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions265" testdata file


  Scenario: TC_function_266:Verifying the function 'Aggregate-Max' : Weekly to Yearly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","Max"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions266" testdata file


  Scenario: TC_function_267:Verifying the function 'Aggregate-First' : Weekly to Weekly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Weekly","Sunday","First"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions267" testdata file

 @function1
  Scenario: TC_function_268:Verifying the function 'Aggregate-First' : Weekly to Montly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","First"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions268" testdata file

  Scenario: TC_function_269:Verifying the function 'Aggregate-First' : Weekly to Quarterly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","First"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions269" testdata file


  Scenario: TC_function_270:Verifying the function 'Aggregate-First' : Weekly to Semi Annually
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Semiannual","June, December","First"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions270" testdata file

  Scenario: TC_function_271:Verifying the function 'Aggregate-First' : Weekly to Yearly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","First"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions271" testdata file


  Scenario: TC_function_272:Verifying the function 'Aggregate-Last' : Weekly to Weekly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Weekly","Sunday","Last"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions272" testdata file

  Scenario: TC_function_273:Verifying the function 'Aggregate-Last' : Weekly to Montly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Last"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions273" testdata file

  Scenario: TC_function_274:Verifying the function 'Aggregate-Last' : Weekly to Quarterly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Last"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions274" testdata file

  Scenario: TC_function_275:Verifying the function 'Aggregate-Last' : Weekly to Semi Annually
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Semiannual","June, December","Last"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions275" testdata file

  Scenario: TC_function_276:Verifying the function 'Aggregate-Last' : Weekly to Yearly
    Given Create insight and add series "310913401" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Yearly","December","Last"
    And Check Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions276" testdata file

 @function
  Scenario: TC_function_411:Verifying multiple functions 'Aggregate-Sum' & 'Currency Conversion USD - NA'.
    Given Create insight and add series "310915001" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Sum"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Check Replace selected series
    And Select first series and click on apply function
    Then Verify latest download excel file with "Functions411" testdata file

  @function
  Scenario: TC_function_412:Verifying multiple functions 'Aggregate-Sum' & 'Currency Conversion USD - NA'.
    Given Create insight and add series "310915001" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Sum"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Thousands"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions412" testdata file

  @function
  Scenario: TC_function_413:Verifying multiple functions 'Aggregate-Sum' & 'CurrencyConversion USD - Million'.
    Given Create insight and add series "310915001" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Sum"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Millions"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions413" testdata file

  @function
  Scenario: TC_function_414:Verifying multiple functions 'Aggregate-Sum' & 'CurrencyConversion USD - Billion'.
    Given Create insight and add series "310915001" >open function popup
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Sum"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","in Billions"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions414" testdata file

  @function
  Scenario: TC_function_415:Currency Conversion -->Fx table start date is later than series to converted.
    Given Create insight and add series "310916001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions415" testdata file

  @function
  Scenario: TC_function_416:Currency Conversion -->Fx table is longer than series to be converted.
    Given Create insight and add series "310907901" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions416" testdata file

  @function
  Scenario: TC_function_417:CCurrency Conversion -->Gaps in FX table
    Given Create insight and add series "310919101" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions417" testdata file

  @function
  Scenario: TC_function_418:Currency Conversion -->Gaps in series to be converted
    Given Create insight and add series "310916401" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions418" testdata file

  @test
  Scenario: TC_function_419:Currency Conversion -->Unit/Unit
    Given Create insight and add series "310907501" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions419" testdata file

  @function
  Scenario: TC_function_420:Currency Conversion -->FX Series and target series have different freq
    Given Create insight and add series "310905001" >open function popup
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","as reported"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify download excel file with "Functions420" testdata file

 @function
  Scenario: TC_function_426Verifying the YTD function for Semi annual series .
    Given Create insight and add series "310906101" >open function popup
    And Apply function-"YTD","YTD (method, end)" >"Difference","December"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions426" testdata file

  @function
  Scenario: TC_function_427:Verifying the HTD function for quarterly series .
    Given Create insight and add series "310911801" >open function popup
    And Apply function-"HTD","HTD (method, end)" >"Difference","June, December"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions427" testdata file

    @function
  Scenario: TC_function_433:Verifing Function Adjustment -Fill Gaps - Linear Interpolation
    Given Create insight and add series "310902101" >open function popup
    And Apply fuction "FILLGAP","FILLGAP (type)" by applying "Calculate with linear interpolation"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions433" testdata file

  @function
  Scenario: TC_function_434:Verifing Function Fill Gaps - Exponential Interpolation
    Given Create insight and add series "310902101" >open function popup
    And Apply fuction "FILLGAP","FILLGAP (type)" by applying "Calculate with exponential interpolation"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions434" testdata file

  @function
  Scenario: TC_function_435:Verifing Function Update X with Y
    Given Create insight and add two  series "310902101" "310902201" >and select one series open function popup
    And Apply function "UPDATE", "UPDATE (value)" by applying arrgument "Insurance Industry: Long Term Inv: China Life Insurance Co {310902201}"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions435" testdata file

  @function
  Scenario: TC_function_436:Verifing Function Update X with Y
    Given Create insight and add two  series "310914101" "310914201" >and select one series open function popup
    And Apply function "SPLICE", "SPLICE (value)" by applying arrgument "Turnover: Value: SGX: Mainboard in SGD: Agriculture {310914201}" select radio button "Ratio"
    And Uncheck Replace selected series
    And Select 1 & 2 series and click on apply function
    Then Verify latest download excel file with "Functions436" testdata file

@function
  Scenario: TC_function_438:Verifying Function - DisAggregate - Distribute
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Semiannual","June, December","Distribute"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions438" testdata file

  @function
  Scenario: TC_function_439:Verifying Function - DisAggregate - Distribute
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Distribute"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions439" testdata file

    @function
  Scenario: TC_function_443:Verifying Function - DisAggregate - Distribute  from function window
    Given Create insight and add series "310906101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Distribute"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions443" testdata file

  @function
  Scenario: TC_function_444:Verifying Function - DisAggregate - Distribute
    Given Create insight and add series "310906101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Distribute"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions444" testdata file

     @function
  Scenario: TC_function_447:Verifying Function - DisAggregate - Distribute
    Given Create insight and add series "310912901" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Distribute"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions447" testdata file

  @function
  Scenario: TC_function_448:Verifying Function - DisAggregate - Distribute
    Given Create insight and add series "310912901" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Weekly","Sunday","Distribute"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions448" testdata file

  Scenario: TC_function_450:Verifying Function - DisAggregate - Distribute
    Given Create insight and add series "310920001" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Weekly","Sunday","Distribute"
    And Uncheck Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions450" testdata file

@function
  Scenario: TC_function_452:Verifying for Aggregate on Cubic Spline Interpolation function
    Given Create insight and add series "310913301" >open function popup
    And Apply fuction "DISAGGREGATE","DISAGGREGATE (frequency, end, method)" choose radio botton "Daily" >"Cubic Spline Interpolation"
    And Apply function-"AGGREGATE","AGGREGATE (frequency, end, method)" >"Weekly","Sunday","Sum"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions452" testdata file

    @function
  Scenario: TC_function_453:Verifing Double Functions Accumulate - Rolling Sum. Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
    And Apply fuction "ROLLSUM","ROLLSUM (period)" input ValueIn "2"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions453" testdata file

  @function
  Scenario: TC_function_454:Verifing Double Functions Accumulate - Rolling Sum.Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
    And Apply fuction "ROLLSUM","ROLLSUM (period)" input ValueIn "2"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions454" testdata file

 @function
  Scenario: TC_function_456:Verifing Double Functions Fill Gaps - Exponential Interpolation.Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Apply Fill gaps function "FILLGAP (type)" by applying "Calculate with exponential interpolation"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions456" testdata file

  @function
  Scenario: TC_function_457:Verifing Function Update X with Y
    Given Create insight and add two  series "310902101" "310902201" >and select one series open function popup
    And Apply function "UPDATE", "UPDATE (value)" by applying arrgument "Insurance Industry: Long Term Inv: China Life Insurance Co {310902201}"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Check Replace selected series
    And click on apply function on replaced series
    Then Verify latest download excel file with "Functions457" testdata file

@function
  Scenario: TC_function_465:Verifying Function - DisAggregate - Replicate.Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Replicate"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions465" testdata file

    @function
  Scenario: TC_function_468:Verifying Double Functions - Accumulate. Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"US Dollars","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions468" testdata file

  @function
  Scenario: TC_function_469:Verifying Double Functions - DisAggregate - Distribute.Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Distribute"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Euros","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions469" testdata file

    @function
  Scenario: TC_function_474:Verifying Double Functions - DisAggregate - Replicate.Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Semiannual","June, December","Replicate"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions474" testdata file

  @test1
Scenario: TC_function_475:Verifying Double Functions - DisAggregate - Replicate.Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Replicate"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions475" testdata file

@function
  Scenario: TC_function_484:Verifying Double Functions - Changes(Percentage over a yr)Tramo(SA, trend and forecast) from smart toolbar
    Given Create insight and add series "310906101" >open function popup
    And Apply fuction "%CHANGE","%CHANGE (period)" choose radio botton "Over Year"
    And Verify TRAMOSEATS function "TRAMOSEATS" "TRAMOSEATS (output)" by applying "Trend series","Forecast series","Seasonally adjusted series"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions484" testdata file

     @function
  Scenario: TC_function_486:Verifying Double Functions - DisAggregate - Replicate.Currency Conversion
    Given Create insight and add series "310920001" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Weekly","Sunday","Replicate"
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Japanese Yen","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions486" testdata file

     @function
  Scenario: TC_function_492:Verifying Double Functions - Mathematics - Base l0 logCurrency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Applying "LOG10" "LOG10 ()" function
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions492" testdata file

@function
  Scenario: TC_function_495:Verifing Double Functions Accumulate - Rolling Sum.Currency Conversion
    Given Create insight and add series "310902101" >open function popup
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
    And Apply function-"CONVERTCUR","CONVERTCUR (currency, unit)" >"Chinese Yuan (RMB)","as reported"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions495" testdata file

    @function
  Scenario: TC_function_498:Verifying Double Functions - DisAggregate - Distribute.Accumulate
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Semiannual","June, December","Distribute"
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions498" testdata file

  @function
  Scenario: TC_function_499:Verifying Double Functions - DisAggregate - Distribute.Accumulate
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Distribute"
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions499" testdata file

@function
  Scenario: TC_function_500:Verifying Double Functions - DisAggregate - Distribute.Fill Gaps, Calculate with Linear interpolation
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Monthly","Last day of month","Distribute"
    And Apply Fill gaps function "FILLGAP (type)" by applying "Calculate with linear interpolation"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions500" testdata file

  @function
  Scenario: TC_function_501:Verifying Double Function - DisAggregate - Distribute. Fill Gaps, Calculate with linear Extrapolate
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Weekly","Sunday","Distribute"
    And Apply Fill gaps function "FILLGAP (type)" by applying "Calculate with linear extrapolate"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions501" testdata file

@function
  Scenario: TC_function_504:Verifying Double Function - DisAggregate - Distribute.Mathematics - Log10
    Given Create insight and add series "310920001" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Weekly","Sunday","Distribute"
    And Applying "LOG10" "LOG10 ()" function
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions504" testdata file

@function
  Scenario: TC_function_506:Verifying Double Function - DisAggregate - Replicate Function : Rolling Sum
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Semiannual","June, December","Replicate"
    And Apply fuction "ROLLSUM","ROLLSUM (period)" input ValueIn "2"
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions506" testdata file

  @function
  Scenario: TC_function_507:Verifying Double Function - DisAggregate - Replicate.Accumulate
    Given Create insight and add series "310902101" >open function popup
    And Apply function-"DISAGGREGATE","DISAGGREGATE (frequency, end, method)" >"Quarterly","March, June, September, December","Replicate"
    And Applying "ACCUMULATE" "ACCUMULATE ()" function
    And Check Replace selected series
    And Click on apply function
    Then Verify latest download excel file with "Functions507" testdata file

