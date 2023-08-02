NAME = weather
SRCS = srcs/main.cpp
CXX = c++

# Define the paths
CONFIG_DIR = $(HOME)/.config
INSTALL_PATH = $(CONFIG_DIR)/$(NAME)

# Shell script 
SHDIR = srcs/tools
SET_SH = $(SHDIR)/setting.sh
CLEAR_SH = $(SHDIR)/clear_path.sh
CLEAR_CACHE_SH = $(SHDIR)/clear_cache.sh
SET_STATUS_SH = $(SHDIR)/create_status.sh
RM_STATUS_SH = $(SHDIR)/remove_status.sh

all: $(INSTALL_PATH)

$(INSTALL_PATH): $(NAME)
	@echo "$(B_Cyan) Install Weather Program $(Reset)"
	@make load
	@chmod +x $(SET_SH) $(CLEAR_SH) $(CLEAR_CACHE_SH) $(SET_STATUS_SH) $(RM_STATUS_SH)
	@bash $(SET_SH)
	@echo "[ Please Input Command ]\n\n > $(B_Yellow)$(NAME) [location] \n$(Reset)"
	@echo " > $(B_Yellow)$(NAME) all \n$(Reset)"
	@exec zsh

$(NAME):
	@$(CXX) $(SRCS) -o $(NAME)

clean:
	@rm -rf $(NAME) $(INSTALL_PATH)
	@bash $(CLEAR_SH)

re: clean 
	make all

.PHONY: all clean load re

LOAD 		:= 	------------------< 🌈 Weather >-------------------
N 			:= 	$(shell echo $(words $(LOAD)))
load		:	
				@for i in $$(seq 0 4 100); do\
					if [ $$i -eq 100 ]; then\
						printf "\r${B_Green}[%-50s] ${B_Yellow}%d%% ${Reset}" "$$(echo '$(LOAD)' | cut -b 1-$$(($$i/2+1)))" "$$i";\
					else\
						printf "\r${Red}[%-50s] ${B_Red}%d%% ${Reset}" "$$(echo '$(LOAD)' | cut -b 1-$$(($$i/2+1)))" "$$i";\
				fi;\
					sleep 0.05;\
				done;\
				printf "\n";

#color code 
#use with $(Reset)
# ===================
Black  	= \033[0;30m
Red    	= \033[0;31m
Green   = \033[0;32m
Yellow 	= \033[0;33m
Blue   	= \033[0;34m
Purple 	= \033[0;35m
Cyan   	= \033[0;36m
White  	= \033[0;37m
B_Black =  \033[0;90m
B_Red	= \033[0;91m
B_Green	= \033[0;92m
B_Yellow= \033[0;93m
B_Blue	= \033[0;94m
B_Purple= \033[0;95m
B_Cyan	= \033[0;96m
B_White	= \033[0;97m
Reset	= \033[0m

BG_BLACK=\033[40m
BG_RED=\033[41m
BG_GREEN=\033[42m
BG_YELLOW=\033[43m
BG_BLUE=\033[44m
BG_PURPLE=\033[45m
BG_CYAN=\033[46m
BG_WHITE=\033[47m
B_BG_BLACK=\033[100m
B_BG_RED=\033[101m
B_BG_GREEN=\033[102m
B_BG_YELLOW=\033[103m
B_BG_BLUE=\033[104m
B_BG_PURPLE=\033[105m
B_BG_CYAN=\033[106m
B_BG_WHITE=\033[107m
REVERSE=\033[7m
# ===================
