add_library (GarbledCircuit_GarbledCircuit OBJECT
  "garbled_circuit.cpp")

add_executable(TinyGarble
  "garbled_circuit_main.cpp"
  "$<TARGET_OBJECTS:GarbledCircuit_GarbledCircuit>"
  "$<TARGET_OBJECTS:Crypto_BN>"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:Crypto_OT_Extension>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(TinyGarble ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(TinyGarble ${Boost_LIBRARIES})
endif (Boost_FOUND)

add_executable(GarbledCircuitTest
  "garbled_circuit_test.cpp"
  "$<TARGET_OBJECTS:GarbledCircuit_GarbledCircuit>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:SCD_SCD_Evaluator>"
  "$<TARGET_OBJECTS:Crypto_BN>"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:Crypto_OT_Extension>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP_Testsuit>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(GarbledCircuitTest ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(GarbledCircuitTest ${Boost_LIBRARIES})
endif (Boost_FOUND)

add_test (GarbledCircuit_GarbledCircuitTest
  GarbledCircuitTest --log2std)
  
set_tests_properties (GarbledCircuit_GarbledCircuitTest
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Failed;failed")