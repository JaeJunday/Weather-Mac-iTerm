NAME 	= 	weather
SRCS	= 	srcs/main.cpp
CXX 	= 	c++

# LINK = curl -sSL 'wttr.in/Seoul?m2&lang=ko' 

all 	: 	$(NAME)
$(NAME)	:
	$(CXX) $(SRCS) -o $(NAME)
	@echo "$(B_Cyan) Install Weather Program $(Reset)"
	@make load
	@chmod +x srcs/setting.sh
	@bash srcs/setting.sh
	@echo "[ Please Input Command ]\n\n > $(B_Yellow)weather\n$(Reset)"
	@exec zsh

clean	:
	rm -rf $(HOME)/.config/$(NAME)

.PHONY	: all clean load

LOAD 		:= 	------------------< 🌈 Weather >-------------------
N 			:= 	$(shell echo $(words $(LOAD)))
load		:	
				@for i in $$(seq 0 2 100); do\
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
# ===================