NAME 	= 	weather
SRCS	= 	srcs/main.cpp
CXX 	= 	c++

# LINK = curl -sSL 'wttr.in/Seoul?m2&lang=ko' 

all 	: 	$(NAME)
$(NAME)	:
	$(CXX) $(SRCS) -o $(NAME)
	chmod +x srcs/setting.sh
	bash srcs/setting.sh

clean	:
	rm -rf $(HOME)/.config/$(NAME)

.PHONY	: all clean