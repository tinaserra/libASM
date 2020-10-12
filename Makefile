SRC = 	ft_strlen.s \
		ft_write.s

MAIN = main.c

NAME = libasm.a
PROG = libasm.out

CFLAGS = -Wall -Wextra -Werror -O3 #-MMD

OBJ_DIR = obj
SRC_DIR = src
INC_DIR = inc

OBJ = $(addprefix $(OBJ_DIR)/,$(SRC:.s=.o))
# DPD = $(addprefix $(OBJ_DIR)/,$(SRC:.s=.d))

# -j multithreader / ameliore la vitesse de compliation

all:
	@$(MAKE) -j $(NAME)

# permet de pouvoir comparer la derniere modification de la dependance par rapport a la regle
# -L donner le nom du dossier / -l donner le nom le la lib
$(NAME): $(OBJ)
		@ar rcs $(NAME) $(OBJ)
		@echo $(NAME) : Created !


# si le .s est plus recent que le .o on rentre dans la regle
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s | .gitignore
		@mkdir -p $(OBJ_DIR)
		@nasm -f macho64 -I $(INC_DIR) $< -o $@

test: $(MAIN) $(NAME)
		@gcc $(CFLAGS) -I $(INC_DIR) $(NAME) $(MAIN) -o $(PROG)
		@./$(PROG)

.gitignore:
		@echo $(NAME) > .gitignore

clean:
		@rm -rf $(OBJ_DIR)
		@echo "obj deleted"

fclean:	clean
		@rm -rf $(NAME)
		@rm -rf $(PROG)
		@echo "[$(NAME)] & [$(PROG)] : deleted"

re: fclean all

.PHONY: all, clean, fclean, re

# Utilise les .d (et ignore s'ils n'existent pas)
# -include $(DPD)