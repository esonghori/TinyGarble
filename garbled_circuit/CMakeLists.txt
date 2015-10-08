add_library (GarbledCircuit_GarbledCircuit OBJECT
  "garbled_circuit.cpp")

add_executable(TinyGarble
  "tiny_garble.cpp"
  "$<TARGET_OBJECTS:GarbledCircuit_GarbledCircuit>"
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
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(GarbledCircuitTest ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(GarbledCircuitTest ${Boost_LIBRARIES})
endif (Boost_FOUND)

add_test (GarbledCircuit_GarbledCircuitAddition1bTest
  GarbledCircuitTest -i ${PROJECT_SOURCE_DIR}/scd/netlists/sum_1bit.scd --g_init 0 --e_init 0 --g_input 1234567812345678 --e_input 1234567812345678 --clock_cycles 64)
  
set_tests_properties (GarbledCircuit_GarbledCircuitAddition1bTest
	PROPERTIES
	PASS_REGULAR_EXPRESSION "2468ACF02468ACF0")

add_test (GarbledCircuit_GarbledCircuitAddition8b0Test
  GarbledCircuitTest -i ${PROJECT_SOURCE_DIR}/scd/netlists/sum_8bit.scd --g_init 0 --e_init 0 --g_input 0 --e_input 0 --clock_cycles 2)
  
set_tests_properties (GarbledCircuit_GarbledCircuitAddition8b0Test
	PROPERTIES
	PASS_REGULAR_EXPRESSION "0")

add_test (GarbledCircuit_GarbledCircuitAddition8bTest
  GarbledCircuitTest -i ${PROJECT_SOURCE_DIR}/scd/netlists/sum_8bit.scd --g_init 0 --e_init 0 --g_input 1234 --e_input 1234 --clock_cycles 2)
  
set_tests_properties (GarbledCircuit_GarbledCircuitAddition8bTest
	PROPERTIES
	PASS_REGULAR_EXPRESSION "2468")
