# include <libft.h>
# include <ft_printf.h>
# include <gnl.h>

int main(void)
{
	char    c;
	char    *str;
	int     fd;
	int     i;
	char    *line;
	
	c = 'S';
	ft_printf("%d\n", ft_isalpha(c)); // libft.h
	str = "Hello world! :)";
	ft_printf("%s\n", str); //ft_printf.h

	fd = open("example.c", O_RDONLY);
	if (fd == -1)
	return (1);
	line = get_next_line(fd); // gnl.h
	i = 0;
	while (line != NULL)
	{
		ft_printf("line [%d] : %s", ++i, line);
		free(line);
		line = get_next_line(fd);
	}
	close(fd);
	
	return (0);
}
