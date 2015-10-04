add_library (TCPIP_TCPIP OBJECT
  "tcpip.cpp")
 
add_library (TCPIP_TCPIP_Testsuit OBJECT
  "tcpip_testsuit.cpp")
 
add_executable(TCPIP_Test
  "tcpip_test.cpp"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP_Testsuit>")

add_test (TCPIP_TCPIP_Test 
  TCPIP_Test)
  
set_tests_properties (TCPIP_TCPIP_Test 
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Error;ERROR;Failed;failed")