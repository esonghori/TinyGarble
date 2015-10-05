add_library (Crypto_OT OBJECT
  "OT.cpp")

add_executable(OT_Main
  "OT_main.cpp"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(OT_Main ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(OT_Main ${Boost_LIBRARIES})
endif (Boost_FOUND)

add_executable(BN_Test
  "BN_test.cpp"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(BN_Test ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)

add_test (Crypto_BN_Test 
  BN_Test)
  
set_tests_properties (Crypto_BN_Test
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Failed;failed")
	
add_executable(OT_Test
  "OT_test.cpp"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP_Testsuit>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(OT_Test ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)

add_test (Crypto_OT_Test 
  OT_Test
  CONFIGURATIONS Debug)
  
set_tests_properties (Crypto_OT_Test
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Failed;failed")