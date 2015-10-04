add_library (TCPIP_TCPIP OBJECT
  "tcpip.cpp")
  
 add_executable(TCPIP_Test
  "tcpip_test.cpp"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>")

add_test (TCPIP_TCPIP_Test 
  TCPIP_Test)
  
set_tests_properties (Crypto_BN_Test 
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Error;ERROR;Failed;failed")