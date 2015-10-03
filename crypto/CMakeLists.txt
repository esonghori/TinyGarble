add_library (Crypto_OT OBJECT
  "OT.cpp")


add_executable(BN_Test
  "BN_test.cpp"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Util>")

if (OPENSSL_FOUND)
	target_link_libraries(BN_Test ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)

add_test (Crypto_BN_Test 
  BN_Test)
  
set_tests_properties (Crypto_BN_Test 
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Error;ERROR;Failed;failed")