*** Settings ***

Resource  ../Resources/Common.robot
Library    Collections

Test Setup  Common.Open test browser
Test Teardown  Common.Close test browser
 
*** Variables ***

*** Test Cases ***

Example of connecting to Lambdatest via Robot Framework 
	[Timeout]   ${TIMEOUT}
	Page should contain element  name:li1
	Page should contain element  name:li2

	Click button  name:li1	
	Click button  name:li2	
		
	Input text  id:sampletodotext  Yey Let's add it to list
	Click button  id:addbutton
	Log To Console    I am the iron man
	${response}    Get Text    xpath=/html/body/div/div/div/ul/li[6]/span
	
	TRY
		Should Be Equal As Strings    ${response}    Yey Let's add it to lis
	EXCEPT    AS    ${error_message}
	    ${e}    Set Variable    ${error_message}        
	    Log To Console    ${e}
		@{exceptions}=    Create List   
		Append To List    ${exceptions}    ${e}    
		Log To Console    ${exceptions}
		Execute Javascript    lambda-exceptions    ARGUMENTS    ${exceptions}
		Log To Console    ${TEST_STATUS}

	END 

