Feature: Login Page Functionality 

  Background:
    Given Launch the REDD application login page

  Scenario: TC_Login_1: Login using a valid user id and password
    When Enter valid username and password
    And Click on Login button
    Then User should be able to login successfully

  Scenario: TC_Login_2: Verify Password Encryption
    When Enter password in the password field
    Then Password should be masked as asterisks

  Scenario: TC_Login_3: Verify copying password is not allowed
    When Enter password in the password field
    Then User should not be able to copy the password

  Scenario: TC_Login_4: Verifying for Invalid Username. 
    When Enter invalid username and valid password
    And Click on Login button
    Then Error message "Invalid username or password. Please try your email address as username." should be displayed

  Scenario: TC_Login_5: Verifying for Invalid Password.
    When Enter valid username and invalid password
    And Click on Login button
    Then Error message "Invalid username or password. Please try your email address as username." should be displayed

  Scenario: TC_Login_6: Verifying for All Empty Fields.
    When Click on Login button without entering credentials
    Then Error message "Username or email is required." and "Password is required." should be displayed

  Scenario: TC_Login_7: Verifying only when Password is entered.
    When Enter valid password only
    And Click on Login button
    Then Error message "Username or email is required." should be displayed.

  Scenario: TC_Login_8: Verifying for invalid Username and Password.
    When Enter invalid username and invalid password
    And Click on Login button
    Then Error message "Invalid username or password. Please try your email address as username." should be displayed

  Scenario: TC_Login_9: Valid username with trailing space
    When Enter valid username with space at the end
    And Enter valid password
    And Click on Login button
    Then User should be able to login successfully

  Scenario: TC_Login_10: Valid username with leading space
    When Enter valid username with space in the front
    And Enter valid password
    And Click on Login button
    Then User should be able to login successfully

  Scenario: TC_Login_11: Password with trailing space
    When Enter valid username
    And Enter valid password with space at the end
    And Click on Login button
    Then Error message "Invalid username or password. Please try your email address as username." should be displayed

  Scenario: TC_Login_12: Password with leading space
    When Enter valid username
    And Enter valid password with space in the front
    And Click on Login button
    Then Error message "Invalid username or password. Please try your email address as username." should be displayed

  Scenario: TC_Login_13: Verify Log Out option
    Given User is logged in successfully
    Then Click on Log Out and User should be logged out successfully

