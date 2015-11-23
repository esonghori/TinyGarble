add_library (SCD_ParseNetlist OBJECT
  "parse_netlist.cpp")

add_library (SCD_Scheduling OBJECT
  "scheduling.cpp")

add_library (SCD_SCD OBJECT
  "scd.cpp")

add_library (SCD_SCD_Evaluator OBJECT
  "scd_evaluator.cpp")

add_executable(V2SCD
  "v_2_scd.cpp"
  "$<TARGET_OBJECTS:SCD_ParseNetlist>"
  "$<TARGET_OBJECTS:SCD_Scheduling>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:Util_Log>")

if (Boost_FOUND)
  target_link_libraries(V2SCD ${Boost_LIBRARIES})
endif (Boost_FOUND)
target_link_libraries(V2SCD -lrt)

add_executable(SCD_Evaluator_Main
  "scd_evaluator_main.cpp"
  "$<TARGET_OBJECTS:SCD_SCD_Evaluator>"
  "$<TARGET_OBJECTS:SCD_ParseNetlist>"
  "$<TARGET_OBJECTS:SCD_Scheduling>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

if (Boost_FOUND)
  target_link_libraries(SCD_Evaluator_Main ${Boost_LIBRARIES})
endif (Boost_FOUND)
if (OPENSSL_FOUND)
  target_link_libraries(SCD_Evaluator_Main ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
target_link_libraries(SCD_Evaluator_Main -lrt)

add_executable(SCD_Evaluator_Test
  "scd_evaluator_test.cpp"
  "$<TARGET_OBJECTS:SCD_SCD_Evaluator>"
  "$<TARGET_OBJECTS:SCD_ParseNetlist>"
  "$<TARGET_OBJECTS:SCD_Scheduling>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

if (Boost_FOUND)
  target_link_libraries(SCD_Evaluator_Test ${Boost_LIBRARIES})
endif (Boost_FOUND)
if (OPENSSL_FOUND)
  target_link_libraries(SCD_Evaluator_Test ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
target_link_libraries(SCD_Evaluator_Test -lrt)

add_test (SCD_SCD_Evaluator_Test
  SCD_Evaluator_Test --log2std)

set_tests_properties (SCD_SCD_Evaluator_Test
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Failed;failed")

