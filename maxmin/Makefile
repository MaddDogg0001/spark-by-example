PROJECT=max_min_algorithms.gpr
#timeout for chapter
MAX_MIN_DEFAULT_TIMEOUT = "TIMEOUT=5"

#All proof target
ALL_PROOF_TARGET = max_element max_element_with_ghost max_seq min_element

#specification dependencies for each function
SPEC_TYPES       		= ../spec/types.ads
SPEC_MAX_ELEMENT 		= $(SPEC_TYPES) 
SPEC_MAX_ELEMENT_WITH_GHOST 	= $(SPEC_TYPES) ../spec/upper_bound_p.ads
SPEC_MIN_ELEMENT 		= $(SPEC_TYPES)
SPEC_MAX_SEQ 			= $(SPEC_MAX_ELEMENT_WITH_GHOST) ../spec/has_value_p.ads $(call GENERATE_DEP, max_element_with_ghost)

#proof level for each function
LEVEL_MAX_ELEMENT            = 0
LEVEL_MAX_ELEMENT_WITH_GHOST = 0
LEVEL_MIN_ELEMENT            = 0
LEVEL_MAX_SEQ	             = 0	

include ../Makefile-common

#Max_Element
max_element: $(call GENERATE_DEP, max_element) $(SPEC_MIN_ELEMENT)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_MAX_ELEMENT) $(MAX_MIN_DEFAULT_TIMEOUT)

max_element_with_ghost: $(call GENERATE_DEP, max_element_with_ghost) $(SPEC_MAX_ELEMENT_WITH_GHOST)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_MAX_ELEMENT_WITH_GHOST) $(MAX_MIN_DEFAUT_TIMEOUT)

max_seq: $(call GENERATE_DEP, max_seq) $(SPEC_MAX_SEQ)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_MAX_SEQ) $(MAX_MIN_DEFAULT_TIMEOUT)

min_element: $(call GENERATE_DEP,min_element) $(SPEC_MIN_ELEMENT)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_MIN_ELEMENT) $(MAX_MIN_DEFAULT_TIMEOUT)

all: $(ALL_PROOF_TARGET)

