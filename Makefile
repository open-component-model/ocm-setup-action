

OCM=ocm

ifneq (,$(wildcard bin/ocm))
  OCM=bin/ocm
endif

echo:
	@echo using $(OCM)
	@which ocm
