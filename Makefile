NAME = Tic-tac-tic-tac-toe
MPATH = modules

all: $(NAME).native $(NAME).byte
	rm -rf $(NAME)
	ln -s _build/main.native $(NAME)

$(NAME).native:
	ocamlbuild -I $(MPATH) main.native
	rm -rf main.native

$(NAME).byte:
	ocamlbuild -I $(MPATH) main.byte
	rm -rf main.byte

clean:
	rm -rf $(NAME).native $(NAME).byte

fclean: clean
	rm -rf _build
