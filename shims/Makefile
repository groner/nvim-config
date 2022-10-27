prefix = $(error set prefix, or set nvim and shimdir)

nvim = $(prefix)/bin/nvim
shimdir = $(prefix)/libexec/neovim

update-alternatives = update-alternatives

install:
	mkdir -pv $(shimdir)
	echo >$(shimdir)/ex		'exec $(nvim) -e "$$@"'
	echo >$(shimdir)/rview		'exec $(nvim) -RZ "$$@"'
	echo >$(shimdir)/rvim		'exec $(nvim) -Z "$$@"'
	echo >$(shimdir)/view		'exec $(nvim) -R "$$@"'
	echo >$(shimdir)/vimdiff	'exec $(nvim) -d "$$@"'

update-alternatives:
	$(update-alternatives)	--install /usr/bin/vim		vim	$(nvim)			100
	$(update-alternatives)	--install /usr/bin/vi		vi	$(nvim)			100
	$(update-alternatives)	--install /usr/bin/editor	editor	$(nvim)			100
	$(update-alternatives)	--install /usr/bin/ex		ex	$(shimdir)/ex		100
	$(update-alternatives)	--install /usr/bin/rview	rview	$(shimdir)/rview	100
	$(update-alternatives)	--install /usr/bin/rvim		rvim	$(shimdir)/rvim		100
	$(update-alternatives)	--install /usr/bin/view		view	$(shimdir)/view		100
	$(update-alternatives)	--install /usr/bin/vimdiff	vimdiff	$(shimdir)/vimdiff	100

remove-alternatives:
	$(update-alternatives)	--remove vim		$(nvim)
	$(update-alternatives)	--remove vi		$(nvim)
	$(update-alternatives)	--remove editor		$(nvim)
	$(update-alternatives)	--remove ex		$(shimdir)/ex
	$(update-alternatives)	--remove rview		$(shimdir)/rview
	$(update-alternatives)	--remove rvim		$(shimdir)/rvim
	$(update-alternatives)	--remove view		$(shimdir)/view
	$(update-alternatives)	--remove vimdiff	$(shimdir)/vimdiff
