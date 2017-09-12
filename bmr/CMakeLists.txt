add_library (BMR_ParseNetlist OBJECT
  "parse_netlist.cpp")

add_library (BMR_Scheduling OBJECT
  "scheduling.cpp")

add_library (BMR_BMR OBJECT
  "bmr.cpp")

add_library (BMR_V2BMR OBJECT
  "v_2_bmr.cpp")

add_executable(V2BMR_Main
  "v_2_bmr_main.cpp"
  "$<TARGET_OBJECTS:BMR_V2BMR>"
  "$<TARGET_OBJECTS:BMR_ParseNetlist>"
  "$<TARGET_OBJECTS:BMR_Scheduling>"
  "$<TARGET_OBJECTS:BMR_BMR>"
  "$<TARGET_OBJECTS:Util_Log>")

if (Boost_FOUND)
  target_link_libraries(V2BMR_Main ${Boost_LIBRARIES})
endif (Boost_FOUND)
target_link_libraries(V2BMR_Main -lrt)
