# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mflores- <mflores-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/16 19:55:59 by mflores-          #+#    #+#              #
#    Updated: 2023/11/14 18:36:18 by mflores-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#------------------------------------------------------------------------------#
#									GENERAL               				       #
#------------------------------------------------------------------------------#

NAME	= libft.a
CC		= gcc
FLAGS	= -Wall -Wextra -Werror
RM		= rm -f

#------------------------------------------------------------------------------#
#								HEADER FILES            				       #
#------------------------------------------------------------------------------#

HEADER_FILE = libft gnl ft_printf
HEADER_PATH = includes/
HEADER = $(addsuffix .h, $(addprefix $(HEADER_PATH), $(HEADE_FILE)))
HEADER_INC = $(addprefix -I,$(HEADER_PATH))

#------------------------------------------------------------------------------#
#								LIBFT FILES            			 			   #
#------------------------------------------------------------------------------#
BOOL_FILES = ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_islower ft_isprint \
						ft_isspace ft_isupper
BOOL_FOLDER = bool/

FTPRINTF_FILES = ft_printf_unsigned ft_printf_utils ft_printf
FTPRINTF_FOLDER = ft_printf/

GNL_FILES = get_next_line get_next_line_utils
GNL_FOLDER = gnl/

LIST_FILES = ft_lstadd_back ft_lstadd_front ft_lstclear ft_lstdelone \
							ft_lstiter ft_lstlast ft_lstmap ft_lstnew ft_lstsize
LIST_FOLDER = lists/

MEM_FILES =	ft_calloc ft_memchr ft_memcmp ft_memcpy ft_memmove ft_memset
MEM_FOLDER = mem/

STRS_FILES = ft_atoi ft_bzero ft_itoa ft_putchar_fd ft_putendl_fd ft_putnbr_fd \
						ft_putstr_fd ft_split ft_strchr ft_strdup ft_striteri ft_strjoin \
						ft_strlcat ft_strlcpy ft_strlen ft_strmapi ft_strncmp ft_strnstr \
						ft_strrchr ft_strtrim ft_substr ft_tolower ft_toupper
STRS_FOLDER = strings/

OTHER_FILES = ft_abs
OTHER_FOLDER = other/

SRCS_PATH = srcs/
SRCS_NAMES 	= $(addsuffix .c, \
							$(addprefix $(BOOL_FOLDER), $(BOOL_FILES)) \
							$(addprefix $(FTPRINTF_FOLDER), $(FTPRINTF_FILES)) \
							$(addprefix $(GNL_FOLDER), $(GNL_FILES)) \
							$(addprefix $(MEM_FOLDER), $(MEM_FILES)) \
							$(addprefix $(STRS_FOLDER), $(STRS_FILES)) \
							$(addprefix $(LIST_FOLDER), $(LIST_FILES)) \
							$(addprefix $(OTHER_FOLDER), $(OTHER_FILES)))

OBJS_NAMES = $(SRCS_NAMES:.c=.o)
OBJS_FOLDERS = $(addprefix $(OBJS_PATH), $(BOOL_FOLDER) \
							 $(FTPRINTF_FOLDER) $(GNL_FOLDER) $(LIST_FOLDER) \
							 $(MEM_FOLDER) $(STRS_FOLDER) $(OTHER_FOLDER))
OBJS_PATH = objs/
OBJS = $(addprefix $(OBJS_PATH), $(OBJS_NAMES))

DEPS		= $(addprefix $(OBJS_PATH), $(SRCS_NAMES:.c=.d))

#------------------------------------------------------------------------------#
#								BASCIC RULES	        				       #
#------------------------------------------------------------------------------#
all: header $(NAME)
	@echo "\n$(BOLD)$(GREEN)[ ✔ ]\tLIBFT$(RESET)"

$(NAME): $(HEADER) $(OBJS)
		@ar rcs $(NAME) $(OBJS)

$(OBJS_PATH)%.o: $(SRCS_PATH)%.c
	@mkdir -p $(OBJS_FOLDERS)
	@$(CC) $(FLAGS) $(HEADER_INC) -MMD -o $@ -c $<
	@printf "$(YELLOW). . . compiling $(NAME) objects . . . $(GREY)%-33.33s\r$(WHITE)" $@

clean:
	@if [ -d "$(OBJS_PATH)" ]; then \
		echo "$(YELLOW). . . cleaning $(NAME) objects . . .$(RESET)"; \
		$(RM) -rd $(OBJS_PATH); \
	fi
	@echo "$(BOLD)$(GREEN)[ ✔ ]\tLIBFT OBJECTS CLEANED$(RESET)"

fclean:	clean
	@if [ -e $(NAME) ]; then \
		echo "$(YELLOW). . . deleting $(NAME) . . .$(RESET)"; \
		$(RM) $(NAME); \
	fi
	@echo "$(BOLD)$(GREEN)[ ✔ ]\tLIBFT CLEANED$(RESET)"

re:	fclean all

-include $(DEPS)

.PHONY:	all clean fclean re norme

#------------------------------------------------------------------------------#
#								CUSTOM RULES    					           #
#------------------------------------------------------------------------------#
AUTHOR = https://github.com/mariav7

define HEADER_PROJECT

	██      ██ ██████  ███████ ████████ 
	██      ██ ██   ██ ██         ██    
	██      ██ ██████  █████      ██    
	██      ██ ██   ██ ██         ██    
	███████ ██ ██████  ██         ██    
																																	
endef
export HEADER_PROJECT

header:
	clear
	@echo "$(CYAN)$$HEADER_PROJECT $(RESET)"
	@printf "$(MAGENTA)%15s Coded by:$(WHITE) \e]8;;$(AUTHOR)\e\\mflores-\e]8;;\e\\ $(RESET)\n\n"

# COLORS
DEF_COLOR = \033[0;39m
GREY = \033[0;90m
RED = \033[0;91m
GREEN = \033[1;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

# FORMAT
BOLD = \033[1m
ITALIC = \033[3m
UNDERLINE = \033[4m
STRIKETHROUGH = \033[9m
BLINK	= \033[5m