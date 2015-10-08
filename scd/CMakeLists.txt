add_library (SCD_ParseNetlist OBJECT
  "parse_netlist.cpp")

add_library (SCD_Scheduling OBJECT
  "scheduling.cpp")

add_library (SCD_SCD OBJECT
  "scd.cpp")

add_executable(V2SCD
  "v_2_scd.cpp"
  "$<TARGET_OBJECTS:SCD_ParseNetlist>"
  "$<TARGET_OBJECTS:SCD_Scheduling>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:Util_Log>")

if (Boost_FOUND)
  target_link_libraries(V2SCD ${Boost_LIBRARIES})
endif (Boost_FOUND)