
TOP = $(CURDIR)
include $(TOP)/configure/CONFIG


all: base modules

base:
	$(MAKE) -C $(EPICS_BASE)

modules: base modules-release
	$(MAKE) -C $(EPICS_MODULES)

modules-release:
	$(MAKE) -C $(EPICS_MODULES) release

clean: modules-clean base-clean
	rm -f *~

base-clean:
	$(MAKE) -C $(EPICS_BASE) clean

modules-clean:
	$(MAKE) -C $(EPICS_MODULES) clean


check:
	@echo $(EPICS_BASE)
	@echo $(EPICS_MODULES)
	@echo $(EPICS_APPS)
	@echo $(EPICS_HOST_ARCH)


# ifeq (init,$(firstword $(MAKECMDGOALS)))
# 	INIT_ARG := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
# 	echo $(INIT_ARG)
# 	$(eval $(INIT_ARG):dummy;@:)	
# endif

# sed needs $$ instead of $ in Makefile

init: 
	@git submodule deinit -f .
	git submodule deinit -f .
	sed -i '/submodule/,$$d'  $(TOP)/.git/config	
	git submodule init 
	git submodule update --init --recursive

base-init:
	@git submodule deinit -f $(EPICS_BASE)/.
	git submodule deinit -f $(EPICS_BASE)/.
	sed -i '/submodule/,$$d'  $(TOP)/.git/config	
	git submodule init $(EPICS_BASE)
	git submodule update --init --recursive $(EPICS_BASE)


modules-init:
	@git submodule deinit -f $(EPICS_MODULES)/.
	git submodule deinit -f $(EPICS_MODULES)/.
	sed -i '/epics-modules/,$$d'  $(TOP)/.git/config	
	git submodule init $(EPICS_MODULES)
	git submodule update --init --recursive $(EPICS_MODULES)


.PHONY: all base modules clean base-clean modules-clean modules-release init base-init modules-init modules-gitcl
