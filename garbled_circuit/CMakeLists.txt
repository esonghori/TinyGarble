add_library (GarbledCircuit_GarbledCircuit OBJECT
  "garbled_circuit.cpp")

add_executable(TinyGarble
  "tiny_garble.cpp"
  "$<TARGET_OBJECTS:GarbledCircuit_GarbledCircuit>"
  "$<TARGET_OBJECTS:SCD_ReadSCD>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Log>")

if (Boost_FOUND)
  target_link_libraries(TinyGarble ${Boost_LIBRARIES})
endif (Boost_FOUND)