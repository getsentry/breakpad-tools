TOP_DIR ?= ..
OUT_DIR ?= build
OPT_LEVEL ?= 3
OMIT_FP ?= true

FLAGS += \
	-g \
	-fPIC \
	-O$(OPT_LEVEL) \
	$(if $OMIT_FP, -fomit-frame-pointer) \
	-DHAVE_MACH_O_NLIST_H \
	-DBPLOG_MINIMUM_SEVERITY=SEVERITY_ERROR \
	$(NULL)

CFLAGS += \
	$(FLAGS) \
	$(NULL)

CXXFLAGS += \
	$(FLAGS) \
	-std=c++11 \
	-I$(TOP_DIR)/deps \
	-I$(TOP_DIR)/deps/breakpad/src \
	$(NULL)

BINARIES = \
	crash \
	minidump_stackwalk \
	dump_syms \
	$(NULL)

LIBRARIES = \
	client \
	disasm \
	$(NULL)

libdisasm_OBJ = \
	deps/breakpad/src/third_party/libdisasm/ia32_implicit.o \
	deps/breakpad/src/third_party/libdisasm/ia32_insn.o \
	deps/breakpad/src/third_party/libdisasm/ia32_invariant.o \
	deps/breakpad/src/third_party/libdisasm/ia32_modrm.o \
	deps/breakpad/src/third_party/libdisasm/ia32_opcode_tables.o \
	deps/breakpad/src/third_party/libdisasm/ia32_operand.o \
	deps/breakpad/src/third_party/libdisasm/ia32_reg.o \
	deps/breakpad/src/third_party/libdisasm/ia32_settings.o \
	deps/breakpad/src/third_party/libdisasm/x86_disasm.o \
	deps/breakpad/src/third_party/libdisasm/x86_format.o \
	deps/breakpad/src/third_party/libdisasm/x86_imm.o \
	deps/breakpad/src/third_party/libdisasm/x86_insn.o \
	deps/breakpad/src/third_party/libdisasm/x86_misc.o \
	deps/breakpad/src/third_party/libdisasm/x86_operand_list.o \
	$(NULL)

libclient_OBJ = \
	deps/breakpad/src/client/minidump_file_writer.o \
	deps/breakpad/src/client/mac/crash_generation/crash_generation_client.o \
	deps/breakpad/src/client/mac/handler/dynamic_images.o \
	deps/breakpad/src/client/mac/handler/exception_handler.o \
	deps/breakpad/src/client/mac/handler/minidump_generator.o \
	deps/breakpad/src/client/mac/handler/breakpad_nlist_64.o \
	deps/breakpad/src/common/convert_UTF.o \
	deps/breakpad/src/common/md5.o \
	deps/breakpad/src/common/string_conversion.o \
	deps/breakpad/src/common/mac/bootstrap_compat.o \
	deps/breakpad/src/common/mac/file_id.o \
	deps/breakpad/src/common/mac/macho_id.o \
	deps/breakpad/src/common/mac/macho_utilities.o \
	deps/breakpad/src/common/mac/macho_walker.o \
	deps/breakpad/src/common/mac/string_utilities.o \
	deps/breakpad/src/common/mac/MachIPC.o \
	$(NULL)

crash_OBJ = \
	libclient.a \
	macos/main.o \
	$(NULL)

minidump_stackwalk_OBJ = \
	libdisasm.a \
	deps/breakpad/src/common/path_helper.o \
	deps/breakpad/src/processor/basic_code_modules.o \
	deps/breakpad/src/processor/basic_source_line_resolver.o \
	deps/breakpad/src/processor/call_stack.o \
	deps/breakpad/src/processor/cfi_frame_info.o \
	deps/breakpad/src/processor/disassembler_x86.o \
	deps/breakpad/src/processor/dump_context.o \
	deps/breakpad/src/processor/dump_object.o \
	deps/breakpad/src/processor/logging.o \
	deps/breakpad/src/processor/pathname_stripper.o \
	deps/breakpad/src/processor/process_state.o \
	deps/breakpad/src/processor/proc_maps_linux.o \
	deps/breakpad/src/processor/simple_symbol_supplier.o \
	deps/breakpad/src/processor/source_line_resolver_base.o \
	deps/breakpad/src/processor/stack_frame_cpu.o \
	deps/breakpad/src/processor/stack_frame_symbolizer.o \
	deps/breakpad/src/processor/stackwalker.o \
	deps/breakpad/src/processor/stackwalker_amd64.o \
	deps/breakpad/src/processor/stackwalker_arm.o \
	deps/breakpad/src/processor/stackwalker_arm64.o \
	deps/breakpad/src/processor/stackwalker_mips.o \
	deps/breakpad/src/processor/stackwalker_ppc.o \
	deps/breakpad/src/processor/stackwalker_ppc64.o \
	deps/breakpad/src/processor/stackwalker_sparc.o \
	deps/breakpad/src/processor/stackwalker_x86.o \
	deps/breakpad/src/processor/stackwalk_common.o \
	deps/breakpad/src/processor/tokenize.o \
	deps/breakpad/src/processor/exploitability.o \
	deps/breakpad/src/processor/exploitability_linux.o \
	deps/breakpad/src/processor/exploitability_win.o \
	deps/breakpad/src/processor/minidump.o \
	deps/breakpad/src/processor/minidump_processor.o \
	deps/breakpad/src/processor/symbolic_constants_win.o \
	deps/breakpad/src/processor/minidump_stackwalk.o \
	$(NULL)

dump_syms_OBJ = \
	deps/breakpad/src/common/convert_UTF.o \
	deps/breakpad/src/common/dwarf/bytereader.o \
	deps/breakpad/src/common/dwarf/cfi_assembler.o \
	deps/breakpad/src/common/dwarf/dwarf2diehandler.o \
	deps/breakpad/src/common/dwarf/dwarf2reader.o \
	deps/breakpad/src/common/dwarf/elf_reader.o \
	deps/breakpad/src/common/dwarf/functioninfo.o \
	deps/breakpad/src/common/dwarf_cfi_to_module.o \
	deps/breakpad/src/common/dwarf_cu_to_module.o \
	deps/breakpad/src/common/dwarf_line_to_module.o \
	deps/breakpad/src/common/language.o \
	deps/breakpad/src/common/long_string_dictionary.o \
	deps/breakpad/src/common/mac/arch_utilities.o \
	deps/breakpad/src/common/mac/bootstrap_compat.o \
	deps/breakpad/src/common/mac/dump_syms.o \
	deps/breakpad/src/common/mac/file_id.o \
	deps/breakpad/src/common/mac/macho_id.o \
	deps/breakpad/src/common/mac/macho_reader.o \
	deps/breakpad/src/common/mac/macho_utilities.o \
	deps/breakpad/src/common/mac/macho_walker.o \
	deps/breakpad/src/common/mac/string_utilities.o \
	deps/breakpad/src/common/md5.o \
	deps/breakpad/src/common/module.o \
	deps/breakpad/src/common/path_helper.o \
	deps/breakpad/src/common/simple_string_dictionary.o \
	deps/breakpad/src/common/stabs_reader.o \
	deps/breakpad/src/common/stabs_to_module.o \
	deps/breakpad/src/common/string_conversion.o \
	deps/breakpad/src/common/test_assembler.o \
	deps/breakpad/src/tools/mac/dump_syms/dump_syms_tool.o \
	$(NULL)

all: minidump symbols $(BINARIES) $(LIBRARIES)

minidump: $(OUT_DIR)/mini.dmp

symbols: $(OUT_DIR)/crash.sym

$(BINARIES): %: $(OUT_DIR)/%

$(LIBRARIES): %: $(OUT_DIR)/lib%.a

$(OUT_DIR)/mini.dmp: $(OUT_DIR)/crash
	$(RM) $(OUT_DIR)/mini.dmp
	-$(shell cd $(OUT_DIR) && ./crash)
	mv $(wildcard $(OUT_DIR)/*.dmp) $(OUT_DIR)/mini.dmp

$(OUT_DIR)/crash.sym: $(OUT_DIR)/crash $(OUT_DIR)/dump_syms
	$(OUT_DIR)/dump_syms -g $(OUT_DIR)/crash.dSYM $(OUT_DIR)/crash > $@

.SECONDEXPANSION:
$(LIBRARIES:%=$(OUT_DIR)/lib%.a): %.a: $$(addprefix $(OUT_DIR)/,$$($$(*F)_OBJ))
	$(AR) $(ARFLAGS) $@ $(filter %.o,$^)

.SECONDEXPANSION:
$(BINARIES:%=$(OUT_DIR)/%): %: $$(addprefix $(OUT_DIR)/,$$($$(*F)_OBJ))
	$(LINK.cpp) -o $@ $^ -framework CoreFoundation
	dsymutil $@

$(OUT_DIR)/%.o: $(TOP_DIR)/%.c
	@mkdir -p $(@D)
	$(COMPILE.c) $(OUTPUT_OPTION) $<

$(OUT_DIR)/%.o: $(TOP_DIR)/%.cc
	@mkdir -p $(@D)
	$(COMPILE.cc) $(OUTPUT_OPTION) $<

$(OUT_DIR)/%.o: $(TOP_DIR)/%.cpp
	@mkdir -p $(@D)
	$(COMPILE.cpp) $(OUTPUT_OPTION) $<

$(OUT_DIR)/%.o: $(TOP_DIR)/%.mm
	@mkdir -p $(@D)
	$(COMPILE.cpp) $(OUTPUT_OPTION) $<

dist: all
	$(RM) -r $(OUT_DIR)/deps $(OUT_DIR)/macos
	../scripts/cp-symbols.sh $(OUT_DIR)/symbols $(OUT_DIR)/crash.sym

clean:
	$(RM) -r $(OUT_DIR)

.PHONY: all minidump symbols $(BINARIES) $(LIBRARIES) dist clean
