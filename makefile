cc = gcc

src_path = ./Src
inc_path = ./Inc
dep_path = Deps/
quiz=./objfiles/Ehab_Ragab_MostafaMohamedMohamed_AhmedMohamedIbrahim.o
vpath %.c $(src_path)

src_files =$(subst $(src_path)/,,$(wildcard $(src_path)/*.c))

obj_files1 = $(src_files:.c=.o)


dep_files1= $(src_files:.c=.d)
dep_files2 = $(addprefix $(dep_path)/,$(dep_files1))
#$(addprefix $(dep_path)/, $(patsubst %.d, %.c, $(wildcard *.c)))

link_target = app.exe
clean_files = $(obj_files1) $(link_target) $(dep_files2)




# be senstive for H files
-include $(dep_files2)



# remove 
clean :
	-rm $(clean_files)

# compile
%.o : %.c
	$(cc) -c -I$(inc_path) $< -o $@
	$(cc) -MM -I$(inc_path) $< > $(dep_path)\$*.d

#link
$(link_target) : $(obj_files1) $(quiz) 
	$(cc) $^ -o $@

all : $(link_target)





