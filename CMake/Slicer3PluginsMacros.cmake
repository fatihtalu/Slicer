#-----------------------------------------------------------------------------
# Set the default CMAKE_INSTALL_PREFIX variable
# 
macro(slicer3_set_default_plugins_install_prefix)
  if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    if(Slicer3_INSTALL_PREFIX)
      set(__install_prefix "${Slicer3_INSTALL_PREFIX}")
    else(Slicer3_INSTALL_PREFIX)
      set(__install_prefix "${Slicer3_HOME}")
    endif(Slicer3_INSTALL_PREFIX)
    set(CMAKE_INSTALL_PREFIX "${__install_prefix}"
      CACHE PATH "Install path prefix." FORCE)
  endif(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
endmacro(slicer3_set_default_plugins_install_prefix)

#-----------------------------------------------------------------------------
# Set the default output paths for plugins/CLP
# 
macro(slicer3_set_default_plugins_output_path)
  set(LIBRARY_OUTPUT_PATH 
    "${CMAKE_BINARY_DIR}/${Slicer3_INSTALL_PLUGINS_LIB_DIR}")
  set(EXECUTABLE_OUTPUT_PATH 
    "${CMAKE_BINARY_DIR}/${Slicer3_INSTALL_PLUGINS_BIN_DIR}")
  mark_as_advanced(
    LIBRARY_OUTPUT_PATH
    EXECUTABLE_OUTPUT_PATH
    )
endmacro(slicer3_set_default_plugins_output_path)

#-----------------------------------------------------------------------------
# Install one or more plugins to the default plugin location
# 
macro(slicer3_install_plugins)
  install(TARGETS ${ARGN}
    RUNTIME DESTINATION ${Slicer3_INSTALL_PLUGINS_BIN_DIR} COMPONENT RuntimeLibraries
    LIBRARY DESTINATION ${Slicer3_INSTALL_PLUGINS_LIB_DIR} COMPONENT RuntimeLibraries
    )
endmacro(slicer3_install_plugins)
